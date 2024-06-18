import 'package:infi_wheel/features/booking/domain/entities/booking.dart';
import 'package:infi_wheel/features/booking/domain/repositories/booking_repository.dart';

class AddBookingUseCase {
  final BookingRepository bookingRepository;

  AddBookingUseCase(this.bookingRepository);

  Future<bool> call(Booking booking) async {
    return await bookingRepository.addBooking(booking);
  }
}
