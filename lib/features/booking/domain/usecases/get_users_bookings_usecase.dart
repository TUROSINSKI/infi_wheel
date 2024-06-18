import 'package:infi_wheel/features/booking/domain/entities/booking.dart';
import 'package:infi_wheel/features/booking/domain/repositories/booking_repository.dart';

class GetUserBookingsUseCase {
  final BookingRepository bookingRepository;

  GetUserBookingsUseCase(this.bookingRepository);

  Future<List<Booking>> call(int userId) async {
    return await bookingRepository.getUserBookings(userId);
  }
}
