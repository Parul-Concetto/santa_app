import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_bloc.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_event.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group("DataBloc", () {
    late DataBloc dataBloc;
    late GlobalKey<FormState> formKey;
    setUp(() {
      dataBloc = DataBloc();
      formKey = GlobalKey<FormState>();
    });

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
    test('Validation check for Name TextField', () {
      expect(dataBloc.validation(dataBloc.nameController.text, true),
          dataBloc.validation(dataBloc.nameController.text, true));
    });
    test('Validation check for Country TextField', () {
      expect(dataBloc.validation(dataBloc.countryController.text, false),
          dataBloc.validation(dataBloc.countryController.text, false));
    });
    blocTest<DataBloc, DataState>('Validation state is null',
        build: () => DataBloc(),
        act: (bloc) {
          bloc.add(AddDataEvent());
        },
        expect: () => [
              LoadingDataState(),
              ErrorDataState(errorMessage: ''),
            ]);
    blocTest<DataBloc, DataState>(
      'emits LoadingDataState and SuccessDataState when addData is successful',
      build: () {
        return dataBloc;
      },
      act: (bloc) {
        dataBloc.formKey = formKey;
        bloc.add(AddDataEvent());
      },
      expect: () => [
        isA<LoadingDataState>(),
        isA<SuccessDataState>(),
      ],
    );
    blocTest<DataBloc, DataState>('Validation',
        build: () => DataBloc(),
        act: (bloc) {
          bloc.nameController = TextEditingController();
          bloc.countryController = TextEditingController();
          bloc.groupValue = 1;
          bloc.add(AddDataEvent());
        },
        expect: () => [
              LoadingDataState(),
              SuccessDataState(),
            ]);

    blocTest<DataBloc, DataState>('add data in list',
        build: () => DataBloc(),
        act: (bloc) {
          // bloc.formKey = GlobalKey<FormState>();
          bloc.nameController = TextEditingController();
          bloc.countryController = TextEditingController();
          bloc.groupValue = 1;
          bloc.add(AddDataEvent());
        },
        expect: () => SuccessDataState());
    blocTest('Editing data updates state to SuccessDataState',
        build: () => DataBloc(),
        act: (bloc) {
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
