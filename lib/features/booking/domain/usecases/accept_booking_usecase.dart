import 'package:infi_wheel/features/booking/domain/repositories/booking_repository.dart';

class AcceptBookingUseCase {
  final BookingRepository bookingRepository;

  AcceptBookingUseCase(this.bookingRepository);

  Future<bool> call(int bookingId) async {
    return await bookingRepository.acceptBooking(bookingId);
  }
}
