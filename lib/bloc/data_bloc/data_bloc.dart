import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_app/bloc/data_bloc/data_event.dart';
import 'package:santa_app/bloc/data_bloc/data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(InitialDataState()) {
    on<AddDataEvent>((event, emit) => addData(event, emit));
    on<EditDataEvent>((event, emit) => editData(event, emit));
  }

  addData(AddDataEvent event, Emitter<DataState> emit) {}

  editData(EditDataEvent event, Emitter<DataState> emit) {}
}
