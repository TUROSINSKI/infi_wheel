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
      final bookingModel = _mapBookingToModel(booking);
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

  BookingModel _mapBookingToModel(Booking booking) {
    return BookingModel(
      startDate: booking.startDate,
      endDate: booking.endDate,
      userId: booking.userId,
      carId: booking.carId,
    );
  }

  // Implement other booking methods if needed
}
