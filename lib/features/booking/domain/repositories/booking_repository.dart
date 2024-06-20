import 'package:infi_wheel/features/booking/domain/entities/booking.dart';

abstract class BookingRepository {
  Future<bool> addBooking(Booking booking);
  
  Future<List<Booking>> getUserBookings(int userId);

  Future<bool> cancelBooking(int bookingId);

  Future<bool> acceptBooking(int bookingId);
}
