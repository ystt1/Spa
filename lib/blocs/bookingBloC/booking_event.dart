part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

class getBranches extends BookingEvent{}

class getTimeWeek extends BookingEvent{}

class getEmployee extends BookingEvent{}

class getService extends BookingEvent{}

class Addorder extends BookingEvent{
  final order Order;

  Addorder({required this.Order});
}