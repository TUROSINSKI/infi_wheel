import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infi_wheel/features/booking/domain/entities/booking.dart';
import 'package:infi_wheel/features/booking/domain/usecases/add_booking_usecase.dart';
import 'package:infi_wheel/features/booking/domain/usecases/get_users_bookings_usecase.dart';

part 'add_booking_event.dart';
part 'add_booking_state.dart';

class AddBookingBloc extends Bloc<AddBookingEvent, AddBookingState> {
  final AddBookingUseCase addBookingUseCase;
  final GetUserBookingsUseCase getUserBookingsUseCase;

  AddBookingBloc({required this.addBookingUseCase, required this.getUserBookingsUseCase,}) : super(AddBookingInitial()) {
    on<AddBookingSubmitted>(_onBookingSubmitted);
    on<FetchUserBookings>(_onFetchUserBookings);
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

  Future<void> _onFetchUserBookings(
    FetchUserBookings event, Emitter<AddBookingState> emit) async {
      emit(AddBookingLoading());
      try {
        List<Booking> bookings = await getUserBookingsUseCase(event.userId);
        emit(UserBookingsLoaded(bookings));
      } catch (e) {
        emit(AddBookingFailure(e.toString()));
      }
  }
}