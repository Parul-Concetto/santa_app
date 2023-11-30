import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_app/data/models/children_model.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_event.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int? groupValue;
  List<ChildrenModel> dataList = [];

  @override
  Future<void> close() {
    countryController.dispose();
    nameController.dispose();
    return super.close();
  }

  DataBloc() : super(InitialDataState()) {
    on<AddDataEvent>((event, emit) => addData(event, emit));
    on<EditDataEvent>((event, emit) => editData(event, emit));
    on<LoadDataEvent>((event, emit) => loadData(event, emit));
    on<ChangeStatusEvent>((event, emit) => changeStatus(event, emit));
  }

  addData(AddDataEvent event, Emitter<DataState> emit) {
    emit(LoadingDataState());
    if (formKey.currentState!.validate()) {
      dataList.add(
        ChildrenModel(
          id: dataList.length,
          name: nameController.text.trim(),
          country: countryController.text.trim(),
          isNaughty: groupValue == null ? false : true,
        ),
      );
      clearController();
      emit(SuccessDataState());
    } else {
      emit(ErrorDataState(errorMessage: ''));
    }
  }

  editData(EditDataEvent event, Emitter<DataState> emit) {}

  loadData(LoadDataEvent event, Emitter<DataState> emit) async {
    emit(LoadingDataState());
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      dataList = [
        const ChildrenModel(
          id: 1,
          name: 'Joy',
          country: 'India',
          isNaughty: true,
        ),
        const ChildrenModel(
          id: 2,
          name: 'Ritik',
          country: 'India',
        ),
        const ChildrenModel(
          id: 3,
          name: 'Malvika',
          country: 'Afghanistan',
          isNaughty: true,
        ),
        const ChildrenModel(
          id: 4,
          name: 'Ishan',
          country: 'Australia',
          isNaughty: true,
        ),
        const ChildrenModel(
          id: 5,
          name: 'Moksh',
          country: 'Bangladesh',
        ),
        const ChildrenModel(
          id: 6,
          name: 'Megha',
          country: 'India',
          isNaughty: true,
        ),
        const ChildrenModel(
          id: 7,
          name: 'Nistha',
          country: 'India',
        ),
      ];
    });
    emit(SuccessDataState());
  }

  void clearController() {
    nameController.clear();
    countryController.clear();
    groupValue = null;
  }

  changeStatus(ChangeStatusEvent event, Emitter<DataState> emit) {
    emit(LoadingDataState());
    groupValue = event.value ?? false ? 1 : 0;
    emit(StatusChange());
  }
}
