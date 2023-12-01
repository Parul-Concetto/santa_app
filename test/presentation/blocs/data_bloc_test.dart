import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_bloc.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_event.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group("DataBloc", () {
    DataBloc dataBloc = DataBloc();

    test("Name TextField is empty", () {
      expect(dataBloc.nameController.text = '', '');
    });

    test("Name TextField is not empty", () {
      expect(dataBloc.nameController.text = 'demo', 'demo');
    });

    test("Country TextField is empty", () {
      expect(dataBloc.countryController.text = '', '');
    });

    test("Country TextField is not empty", () {
      expect(dataBloc.countryController.text = 'demo', 'demo');
    });

    blocTest<DataBloc, DataState>('Validation state is null',
        build: () => DataBloc(),
        act: (bloc) {
          bloc.add(AddDataEvent());
        },
        expect: () => [
              LoadingDataState(),
              ErrorDataState(),
            ]);

    blocTest<DataBloc, DataState>(
      'emits LoadingDataState and SuccessDataState when form is valid',
      build: () => dataBloc,
      act: (bloc) {
        bloc.countryController.text = 'h';
        bloc.nameController.text = 'h';
        bloc.add(AddDataEvent());
      },
      expect: () => [
        LoadingDataState(),
        SuccessDataState(),
      ],
    );

    blocTest('Editing data updates state to SuccessDataState',
        build: () => DataBloc(),
        act: (bloc) {
          bloc.countryController.text = 'h';
          bloc.nameController.text = 'h';
          bloc.add(AddDataEvent());
          bloc.add(EditDataEvent(
              index: 0,
              id: 1,
              name: 'Updated',
              country: 'Updated',
              isNaughty: false));
        },
        expect: () => [
              LoadingDataState(),
              SuccessDataState(),
              LoadingDataState(),
              SuccessDataState()
            ]);
  });
}
