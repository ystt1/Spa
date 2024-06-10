import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tbdd/Models/Branch.dart';
import 'package:tbdd/repositories/BranchRepository.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BranchRepository _branchRepository;
  BookingBloc(this._branchRepository) : super(BookingInitial()) {
    on<getBranches>((event, emit) async {
      emit(BookingLoading());
      try {
        final branches = await _branchRepository.getBranches();
        emit(BookingSuccess(branches: branches));
      } catch (e) {
        emit(BookingFailure(message: "error fetch branches"));
      }
    });
  }
}
