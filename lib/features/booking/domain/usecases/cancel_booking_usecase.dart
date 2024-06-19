import 'package:infi_wheel/features/booking/domain/repositories/booking_repository.dart';

class CancelBookingUseCase {
  final BookingRepository bookingRepository;

  CancelBookingUseCase(this.bookingRepository);

  Future<bool> call(int bookingId) async {
    return await bookingRepository.cancelBooking(bookingId);
  }
}
