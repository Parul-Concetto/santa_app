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
      expect(bloc.state, equals(LoadingDataState()));
      expect(bloc.state, equals(SuccessDataState()));
      expect(bloc.state, equals(InitialDataState()));
      bloc.close();
    });
  });
}
