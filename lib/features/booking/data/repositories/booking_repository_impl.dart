import 'package:infi_wheel/features/booking/data/models/booking_model.dart';
import 'package:infi_wheel/features/booking/data/services/booking_service.dart';
import 'package:infi_wheel/features/booking/domain/entities/booking.dart';
import 'package:infi_wheel/features/booking/domain/repositories/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingService bookingService;

  BookingRepositoryImpl(this.bookingService);

  @override
  Future<bool> addBooking(Booking booking) async {
    try {
      final bookingModel = BookingModel.fromEntity(booking);
      return await bookingService.addBooking(bookingModel);
    } catch (e) {
      throw Exception('Error adding booking: $e');
    }
  }

  @override
  Future<List<Booking>> getUserBookings(int userId) async {
    try {
      List<BookingModel> bookingModels = await bookingService.fetchUserBookings(userId);
      return bookingModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Error fetching user bookings: $e');
    }
  }

  @override
  Future<bool> cancelBooking(int bookingId) async {
    try {
      return await bookingService.cancelBooking(bookingId);
    } catch (e) {
      throw Exception('Error cancelling booking: $e');
    }
  }

  @override
  Future<bool> acceptBooking(int bookingId) async {
    try {
      return await bookingService.acceptBooking(bookingId);
    } catch (e) {
      throw Exception('Error accepting booking: $e');
    }
  }
}
