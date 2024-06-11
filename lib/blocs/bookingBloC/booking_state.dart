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

final class GetDataTimeSuccess extends BookingState {
  final List<DateTime> times;

  GetDataTimeSuccess({required this.times});
}

final class GetEmployeeSuccess extends BookingState {
  final List<Employee> em;

  GetEmployeeSuccess({required this.em});
}

final class GetServiceSuccess extends BookingState {
  final List<Service> sv;

  GetServiceSuccess({required this.sv});

}
