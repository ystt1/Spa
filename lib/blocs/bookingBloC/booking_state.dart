part of 'booking_bloc.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingSuccess extends BookingState {
  final List<Branch> branches;
  BookingSuccess({required this.branches});
}

final class BookingLoading extends BookingState {}

final class BookingFailure extends BookingState {
  final String message;

  BookingFailure({required this.message});
}

final class DataTimeSuccess extends BookingState{
  final List<DateTime> times;

  DataTimeSuccess({required this.times});
  
}