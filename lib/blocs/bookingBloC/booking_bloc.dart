import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tbdd/Models/Branch.dart';
import 'package:tbdd/Models/Employee.dart';
import 'package:tbdd/Models/Service.dart';
import 'package:tbdd/repositories/BookingRepository.dart';
import 'package:tbdd/repositories/BranchRepository.dart';
import 'package:tbdd/repositories/EmployeeRepository.dart';
import 'package:tbdd/repositories/ServiceRepository.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BranchRepository _branchRepository;
  final BookingRepository _bookingRepository;
  final EmployeeRepository _employeeRepository;
  final ServiceRepository _serviceRepository;
  BookingBloc(this._branchRepository, this._bookingRepository,
      this._employeeRepository, this._serviceRepository)
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
    on<getService>((event, emit) async {
      emit(BookingLoading());
      try {
        final services = await _serviceRepository.getHighlighBranches();
        emit(GetServiceSuccess(sv: services));
      } catch (e) {
        emit(BookingFailure(message: "error fetch branches"));
      }
    });
    on<getTimeWeek>(
      (event, emit) {
        try {
          final listTime = _bookingRepository.getTimeWeek();
          emit(GetDataTimeSuccess(times: listTime));
        } catch (e) {
          emit(BookingFailure(message: "error fetch data time"));
        }
      },
    );

    on<getEmployee>(
      (event, emit) async {
        emit(BookingLoading());
        try {
          final listEmployee = await _employeeRepository.getEmployees();
          emit(GetEmployeeSuccess(em: listEmployee));
        } catch (e) {
          emit(BookingFailure(message: "error fetch data time"));
        }
      },
    );
  }
}
