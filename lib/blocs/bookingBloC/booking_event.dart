part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

class getBranches extends BookingEvent{}

class getTimeWeek extends BookingEvent{}
