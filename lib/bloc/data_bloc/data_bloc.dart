import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_app/bloc/data_bloc/data_event.dart';
import 'package:santa_app/bloc/data_bloc/data_state.dart';
import 'package:santa_app/children_model.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  List<ChildrenModel> dataList = [];
  DataBloc() : super(InitialDataState()) {
    on<AddDataEvent>((event, emit) => addData(event, emit));
    on<EditDataEvent>((event, emit) => editData(event, emit));
    on<LoadDataEvent>((event, emit) => loadData(event, emit));
  }

  addData(AddDataEvent event, Emitter<DataState> emit) {}

  editData(EditDataEvent event, Emitter<DataState> emit) {}

  loadData(LoadDataEvent event, Emitter<DataState> emit) async {
    emit(LoadingDataState());
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      dataList = [
        ChildrenModel(
          id: 1,
          name: 'Joy',
          country: 'India',
          isNaughty: true,
        ),
        ChildrenModel(
          id: 2,
          name: 'Ritik',
          country: 'India',
        ),
        ChildrenModel(
          id: 3,
          name: 'Malvika',
          country: 'Afghanistan',
          isNaughty: true,
        ),
        ChildrenModel(
          id: 4,
          name: 'Ishan',
          country: 'Australia',
          isNaughty: true,
        ),
        ChildrenModel(
          id: 5,
          name: 'Moksh',
          country: 'Bangladesh',
        ),
        ChildrenModel(
          id: 6,
          name: 'Megha',
          country: 'India',
          isNaughty: true,
        ),
        ChildrenModel(
          id: 7,
          name: 'Nistha',
          country: 'India',
        ),
      ];
    });
    emit(SuccessDataState());
  }
}
