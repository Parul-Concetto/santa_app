import 'package:flutter_test/flutter_test.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_bloc.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_event.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_state.dart';

void main() {
  group("DataBloc", () {
    final bloc = DataBloc();

    test("Name TextField is empty", () {
      expect(bloc.nameController.text = '', '');
    });

    test("Name TextField is not empty", () {
      expect(bloc.nameController.text = 'demo', 'demo');
    });

    test("Country TextField is empty", () {
      expect(bloc.countryController.text = '', '');
    });

    test("Country TextField is not empty", () {
      expect(bloc.countryController.text = 'demo', 'demo');
    });

    test("added item in Children List", () {
      expect(bloc.state, equals(LoadingDataState()));
      bloc.add(AddDataEvent());
      expect(bloc.state, equals(SuccessDataState()));
      bloc.close();
    });
  });
}
