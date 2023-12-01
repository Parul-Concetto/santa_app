import 'package:flutter_test/flutter_test.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_event.dart';

void main() {
  group("DataEvent", () {
    group("AddDataEvent", () {
      test("support value equality", () {
        expect(AddDataEvent(), AddDataEvent());
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
  });
}
