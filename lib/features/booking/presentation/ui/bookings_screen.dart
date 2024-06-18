import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/booking/presentation/blocs/add_booking/add_booking_bloc.dart';
import 'package:infi_wheel/features/booking/domain/entities/booking.dart';
import 'package:intl/intl.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd'); 

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
                final String formattedStartDate = _dateFormat.format(DateTime.parse(booking.startDate));
                final String formattedEndDate = _dateFormat.format(DateTime.parse(booking.endDate));
                return ListTile(
                  title: Text(
                    'Booking from ${formattedStartDate} to ${formattedEndDate}',
                    style: TextStyle(color: AppColors.kOxfordBlue),
                  ),
                  subtitle: Text('Car ID: ${booking.carId}', style: TextStyle(color: AppColors.kOxfordBlue),),
                  trailing: Icon(Icons.arrow_forward, color: AppColors.kOxfordBlue),
                  onTap: () {
                    // Handle tap if necessary, e.g., navigate to booking details
                  },
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
}
