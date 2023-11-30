import 'package:flutter_test/flutter_test.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_state.dart';

void main() {
  group("DataState", () {
    group('DataState', () {
      test('InitialDataState should be equal', () {
        expect(InitialDataState(), InitialDataState());
      });

      test('LoadingDataState should be equal', () {
        expect(LoadingDataState(), LoadingDataState());
      });

      test('SuccessDataState should be equal', () {
        expect(SuccessDataState(), SuccessDataState());
      });

      test('StatusChange should be equal', () {
        expect(StatusChange(), StatusChange());
      });

      test('ErrorDataState should be equal with the same errorMessage', () {
        expect(ErrorDataState(errorMessage: 'Error 1'),
            ErrorDataState(errorMessage: 'Error 1'));
      });

      test('ErrorDataState should not be equal with different errorMessage',
          () {
        expect(
          ErrorDataState(errorMessage: 'Error 1'),
          ErrorDataState(errorMessage: 'Error 2'),
        );
      });
    });
  });
}
