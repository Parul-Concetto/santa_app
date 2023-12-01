import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_app/data/models/children_model.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_event.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  int? groupValue;
  List<ChildrenModel> dataList = [];
  final formKey = GlobalKey<FormState>();

  @override
  Future<void> close() {
    /// dispose all controller
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

  ///function to add data in list
  addData(AddDataEvent event, Emitter<DataState> emit) {
    emit(LoadingDataState());
    if (formKey.currentState!.validate()) {
      dataList.add(
        ChildrenModel(
          id: dataList.length + 1,
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

  ///function to edit data in list
  editData(EditDataEvent event, Emitter<DataState> emit) {
    emit(LoadingDataState());
    dataList.removeAt(event.index as int);
    dataList.insert(
        event.index as int,
        ChildrenModel(
            id: event.id,
            name: event.name,
            country: event.country,
            isNaughty: event.isNaughty));
    emit(SuccessDataState());
  }

  /// function to to load data in list
  loadData(LoadDataEvent event, Emitter<DataState> emit) {
    emit(LoadingDataState());
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
    emit(SuccessDataState());
  }

  /// function to update status of child
  changeStatus(ChangeStatusEvent event, Emitter<DataState> emit) {
    emit(LoadingDataState());
    groupValue = event.value ?? false ? 1 : 0;
    emit(StatusChange());
  }

  /// clear controllers
  void clearController() {
    nameController.clear();
    countryController.clear();
    groupValue = null;
  }

  ///add data to controllers
  void addEditData(int? index) {
    if (index != null) {
      nameController.text = dataList[index].name;
      countryController.text = dataList[index].country;
      groupValue = dataList[index].isNaughty ?? false ? 1 : 0;
    }
  }

  validation(String? value, bool isNameController) {
    if (value == null || value.isEmpty) {
      return isNameController ? 'Please Enter Name' : 'Please Enter Country';
    }
    return null;
  }
}
