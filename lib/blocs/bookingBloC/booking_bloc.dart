import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tbdd/Models/Branch.dart';
import 'package:tbdd/repositories/BookingRepository.dart';
import 'package:tbdd/repositories/BranchRepository.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BranchRepository _branchRepository;
  final BookingRepository _bookingRepository;
  BookingBloc(this._branchRepository, this._bookingRepository)
      : super(BookingInitial()) {
    on<getBranches>((event, emit) async {
      emit(BookingLoading());
      try {
        final branches = await _branchRepository.getBranches();
        emit(BookingSuccess(branches: branches));
      } catch (e) {
        emit(BookingFailure(message: "error fetch branches"));
      }
    });

    on<getTimeWeek>(
      (event, emit) {
        try {
          final listTime = _bookingRepository.getTimeWeek();
          emit(DataTimeSuccess(times: listTime));
        } catch (e) {
          emit(BookingFailure(message: "error fetch data time"));
        }
      },
    );
  }
}
