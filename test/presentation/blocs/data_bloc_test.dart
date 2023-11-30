import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_bloc.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_event.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_state.dart';

void main() {
  group("DataBloc", () {
    final dataBloc = DataBloc();
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
    blocTest('list is added',
        build: () => DataBloc(),
        act: (bloc) => bloc.add(LoadDataEvent()),
        expect: () => [LoadingDataState(), SuccessDataState()]);
    blocTest('Editing data updates state to SuccessDataState',
        build: () => DataBloc(),
        act: (bloc) {
          bloc.add(LoadDataEvent());
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
