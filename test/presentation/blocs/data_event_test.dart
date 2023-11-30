import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_bloc.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_event.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_state.dart';

void main() {
  group("DataEvent", () {
    group("AddDataEvent", () {
      test("support value equality", () {
        expect(AddDataEvent(), AddDataEvent());
      });
    });
    group("LoadDataEvent", () {
      test("support value equality", () {
        expect(LoadDataEvent(), LoadDataEvent());
      });

      test("props are correct", () {
        expect(
          LoadDataEvent().props,
          equals(<Object?>[]),
        );
      });
    });
    group("ChangeStatusEvent", () {
      test("support value equality", () {
        expect(ChangeStatusEvent(value: true).value, true);
      });
    });
    group("EditDataEvent", () {
      test("support value equality", () {
        expect(
            EditDataEvent(
                name: 'Parul', id: 5, country: 'India', isNaughty: false),
            EditDataEvent(
                name: 'Parul', id: 5, country: 'India', isNaughty: false));
      });
    });
    blocTest('',
        build: () => DataBloc(),
        act: (bloc) => bloc.add(LoadDataEvent()),
        expect: () => [LoadingDataState(), SuccessDataState()]);
  });
}
