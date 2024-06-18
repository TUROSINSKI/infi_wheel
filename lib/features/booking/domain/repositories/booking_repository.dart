import 'package:infi_wheel/features/booking/domain/entities/booking.dart';

abstract class BookingRepository {
  Future<bool> addBooking(Booking booking);
  // Add other booking-related methods as needed, like fetching bookings, updating, etc.
}
