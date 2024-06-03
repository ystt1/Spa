import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/blocs/ServicesBLoC/services_event.dart';
import 'package:tbdd/blocs/ServicesBLoC/services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent,ServicesState>{
  ServicesBloc():super(ServicesInitial());
}