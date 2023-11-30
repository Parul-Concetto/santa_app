import 'package:flutter_test/flutter_test.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_bloc.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_event.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_state.dart';

void main() {
  group("DataState", () {
    final bloc = DataBloc();
    test("added item in Children List", () {
      expect(bloc.state, equals(InitialDataState()));
      bloc.add(AddDataEvent());
      expectLater(bloc.state, equals(LoadingDataState()));
      expectLater(bloc.state, equals(SuccessDataState()));
      expectLater(bloc.state, equals(InitialDataState()));
      bloc.close();
    });
  });
}
