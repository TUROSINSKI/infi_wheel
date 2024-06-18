import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/booking/domain/entities/booking.dart';
import 'package:infi_wheel/features/booking/presentation/blocs/add_booking/add_booking_bloc.dart';
import 'package:infi_wheel/features/cars/domain/entities/car.dart';
import 'package:intl/intl.dart';

class RentScreen extends StatefulWidget {
  final Car? car;

  const RentScreen({super.key, this.car});

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {

  final storage = const FlutterSecureStorage();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).go("/home"),
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: AppColors.kOxfordBlue,
          ),
        ),
        title: Text(
          "Rent",
          style: TextStyle(color: AppColors.kOxfordBlue),
        ),
      ),
    body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (widget.car != null) ...[
              Image.network(widget.car!.url),
              Text('Manufacturer: ${widget.car!.manufacturer}'),
              Text('Model: ${widget.car!.model}'),
              // Add more details as needed
              const SizedBox(height: 16),
              _buildDatePicker('Start Date', _startDate, (pickedDate) {
                setState(() {
                  _startDate = pickedDate;
                });
              }),
              _buildDatePicker('End Date', _endDate, (pickedDate) {
                setState(() {
                  _endDate = pickedDate;
                });
              }),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _bookCar,
                child: const Text('Book Car', style: TextStyle(color: AppColors.kOxfordBlue),),
              ),
            ] else
              const Center(child: Text('No car details provided', style: TextStyle(color: AppColors.kOxfordBlue),)),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(String label, DateTime? selectedDate, Function(DateTime) onDatePicked) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.blue, // Header background color
                  onPrimary: Colors.white, // Header text color
                  onSurface: Colors.black, // Body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue, // Button text color
                  ),
                ),
                dialogBackgroundColor: Colors.white, // Dialog background color
              ),
              child: child!,
            );
          },
        );
        if (pickedDate != null) {
          onDatePicked(pickedDate);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null ? DateFormat.yMMMd().format(selectedDate) : label,
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.calendar_today, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Future<void> _bookCar() async {
    if (_startDate != null && _endDate != null && widget.car != null) {
      print('here');
      String? userId = await storage.read(key: 'user_id');
      print(userId);
      if (userId != null) {
        Booking booking = Booking(
          startDate: _startDate!.toIso8601String().split('T').first,
          endDate: _endDate!.toIso8601String().split('T').first,
          userId: int.parse(userId),
          carId: widget.car!.id,
        );
        print('here2');
        context.read<AddBookingBloc>().add(AddBookingSubmitted(booking));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User ID not found. Please login again.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both start and end dates.')),
      );
    }
  }
}