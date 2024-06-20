import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/booking/domain/entities/booking.dart';
import 'package:infi_wheel/features/booking/presentation/blocs/bloc/add_booking_bloc.dart';
import 'package:intl/intl.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd'); // Date formatter

  @override
  void initState() {
    super.initState();
    _fetchUserBookings();
  }

  Future<void> _fetchUserBookings() async {
    final String? userIdStr = await _storage.read(key: 'user_id');
    final int? userId = userIdStr != null ? int.tryParse(userIdStr) : null;
    if (userId != null) {
      context.read<AddBookingBloc>().add(FetchUserBookings(userId));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User ID not found. Please login again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).go("/home"),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.kOxfordBlue,
          ),
        ),
        title: Text(
          "My Bookings",
          style: TextStyle(color: AppColors.kOxfordBlue),
        ),
      ),
      body: BlocBuilder<AddBookingBloc, AddBookingState>(
        builder: (context, state) {
          if (state is AddBookingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserBookingsLoaded) {
            return ListView.builder(
              itemCount: state.bookings.length,
              itemBuilder: (context, index) {
                final Booking booking = state.bookings[index];
                final String formattedStartDate =
                    _dateFormat.format(DateTime.parse(booking.startDate));
                final String formattedEndDate =
                    _dateFormat.format(DateTime.parse(booking.endDate));

                return Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                              color: AppColors.kPlatinum, width: 2.0))),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          booking.car.model,
                          style: TextStyle(
                              color: AppColors.kOxfordBlue, fontSize: 20),
                        ),
                        Text(formattedStartDate,
                            style: TextStyle(
                                color: AppColors.kOxfordBlue, fontSize: 14)),
                      ],
                    ),
                    subtitle: Text(
                      booking.car.manufacturer,
                      style:
                          TextStyle(color: AppColors.kOxfordBlue, fontSize: 12),
                    ),
                    trailing:
                        Icon(Icons.arrow_forward, color: AppColors.kOxfordBlue),
                    onTap: () {
                      _showBookingDetails(context, booking);
                    },
                  ),
                );
              },
            );
          } else if (state is AddBookingFailure) {
            return Center(
              child: Text(
                'Failed to load bookings: ${state.error}',
                style: TextStyle(color: AppColors.kOxfordBlue),
              ),
            );
          } else {
            return const Center(child: Text('No bookings found.'));
          }
        },
      ),
    );
  }

  void _showBookingDetails(BuildContext context, Booking booking) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Booking Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kOxfordBlue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                            'Start Date: ${_dateFormat.format(DateTime.parse(booking.startDate))}', style: TextStyle(color: AppColors.kOxfordBlue),),
                        Text(
                            'End Date: ${_dateFormat.format(DateTime.parse(booking.endDate))}', style: TextStyle(color: AppColors.kOxfordBlue),),
                        const SizedBox(height: 16),
                        Text(
                          'Car Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kOxfordBlue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Manufacturer: ${booking.car.manufacturer}', style: TextStyle(color: AppColors.kOxfordBlue),),
                        Text('Model: ${booking.car.model}', style: TextStyle(color: AppColors.kOxfordBlue),),
                        Text(
                            'Registration plate: ${booking.car.registrationPlate}', style: TextStyle(color: AppColors.kOxfordBlue),),
                        if (booking.status != null) ...[
                          const SizedBox(height: 16),
                          Text(
                            'Status: ${booking.status}', // Display status if present
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue,
                            ),
                          ),
                        ],
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            booking.car.url,
                          ))),
                ],
              ),
              Spacer(),
              SizedBox(
                height: 48,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent),
                  onPressed: () async {
                    final String? userIdStr = await _storage.read(key: 'user_id');
                    final int? userId = userIdStr != null ? int.tryParse(userIdStr) : null;
                    context
                        .read<AddBookingBloc>()
                        .add(CancelBooking(booking.id, userId!));
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel booking",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                child: SizedBox(
                  height: 48,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kOxfordBlue),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Go back',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
