part of 'add_booking_bloc.dart';

abstract class AddBookingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddBookingSubmitted extends AddBookingEvent {
  final Booking booking;

  AddBookingSubmitted(this.booking);

  @override
  List<Object> get props => [booking];
}