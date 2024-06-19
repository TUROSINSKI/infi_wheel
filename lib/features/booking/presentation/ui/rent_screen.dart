import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/booking/domain/entities/booking.dart';
import 'package:infi_wheel/features/booking/presentation/blocs/bloc/add_booking_bloc.dart';
import 'package:infi_wheel/features/cars/domain/entities/car.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infi_wheel/features/booking/domain/entities/booking.dart';
import 'package:infi_wheel/features/cars/domain/entities/car.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:intl/intl.dart'; // For date formatting

class RentScreen extends StatefulWidget {
  final Car? car;

  const RentScreen({super.key, this.car});

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  DateTime? _startDate;
  DateTime? _endDate;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

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
          widget.car != null
              ? '${widget.car!.manufacturer} ${widget.car!.model}'
              : 'Rent Car', style: TextStyle(color: AppColors.kOxfordBlue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.car != null ? _buildCarDetails() : _buildNoCarDetails(),
      ),
    );
  }

  Widget _buildCarDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(widget.car!.url),
        const SizedBox(height: 16),
        Text(
          'Manufacturer: ${widget.car!.manufacturer}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          'Model: ${widget.car!.model}',
          style: const TextStyle(fontSize: 16),
        ),
        // Add other car details if needed
        const SizedBox(height: 40),
        _buildDatePicker('Start Date', _startDate, (pickedDate) {
          setState(() {
            _startDate = pickedDate;
          });
        }),
        const SizedBox(height: 20),
        _buildDatePicker('End Date', _endDate, (pickedDate) {
          setState(() {
            _endDate = pickedDate;
          });
        }),
        const SizedBox(height: 40),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.kOxfordBlue),
            onPressed: _bookCar,
            child: const Text('Book Car'),
          ),
        ),
      ],
    );
  }

  Widget _buildNoCarDetails() {
    return const Center(
      child: Text('No car details provided'),
    );
  }

  Widget _buildDatePicker(
      String label, DateTime? selectedDate, Function(DateTime) onDatePicked) {
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
              selectedDate != null
                  ? _dateFormat.format(selectedDate)
                  : label,
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
      String? userIdStr = await _storage.read(key: 'user_id');
      int? userId = userIdStr != null ? int.tryParse(userIdStr) : null;
      if (userId != null) {
        Booking booking = Booking(
          id: 0,
          startDate: _startDate!.toIso8601String().split('T').first,
          endDate: _endDate!.toIso8601String().split('T').first,
          userId: userId,
          car: widget.car!, // Use the full Car object
        );
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