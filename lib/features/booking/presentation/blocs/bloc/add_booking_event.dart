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

class FetchUserBookings extends AddBookingEvent {
  final int userId;

  FetchUserBookings(this.userId);

  @override
  List<Object> get props => [userId];
}

class CancelBooking extends AddBookingEvent { 
  final int bookingId;
  final int userId;

  CancelBooking(this.bookingId, this.userId);

  @override
  List<Object> get props => [bookingId];
}

class AcceptBooking extends AddBookingEvent {
  final int bookingId;
  final int userId;

  AcceptBooking(this.bookingId, this.userId);

  @override
  List<Object> get props => [bookingId];
}