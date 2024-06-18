import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infi_wheel/features/booking/domain/entities/booking.dart';
import 'package:infi_wheel/features/booking/domain/usecases/add_booking_usecase.dart';

part 'add_booking_event.dart';
part 'add_booking_state.dart';

class AddBookingBloc extends Bloc<AddBookingEvent, AddBookingState> {
  final AddBookingUseCase addBookingUseCase;

  AddBookingBloc({required this.addBookingUseCase}) : super(AddBookingInitial()) {
    on<AddBookingSubmitted>(_onBookingSubmitted);
  }

  Future<void> _onBookingSubmitted(
    AddBookingSubmitted event, Emitter<AddBookingState> emit) async {
      emit(AddBookingLoading());
      try {
        bool success = await addBookingUseCase(event.booking);
        if (success) {
          emit(AddBookingSuccess());
        } else {
          emit(AddBookingFailure("Booking failed with response code other than 200."));
        }
      } catch (e) {
        emit(AddBookingFailure(e.toString()));
      }
    }
}