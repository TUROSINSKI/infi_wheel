part of 'add_booking_bloc.dart';

abstract class AddBookingState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddBookingInitial extends AddBookingState {}

class AddBookingLoading extends AddBookingState {}

class AddBookingSuccess extends AddBookingState {}

class AddBookingFailure extends AddBookingState {
  final String error;

  AddBookingFailure(this.error);

  @override
  List<Object> get props => [error];
}

class UserBookingsLoaded extends AddBookingState {
  final List<Booking> bookings;

  UserBookingsLoaded(this.bookings);

  @override
  List<Object> get props => [bookings];
}

class BookingCancelled extends AddBookingState {}