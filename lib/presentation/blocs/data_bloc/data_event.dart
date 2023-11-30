import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddDataEvent extends DataEvent {
  final bool? isNaughty;

  AddDataEvent({this.isNaughty});
}

class LoadDataEvent extends DataEvent {}

class ChangeStatusEvent extends DataEvent {
  final bool? value;

  ChangeStatusEvent({required this.value});
}

class EditDataEvent extends DataEvent {
  final int id;
  final String name;
  final String country;
  final bool? isNaughty;

  EditDataEvent({
    required this.id,
    required this.name,
    required this.country,
    this.isNaughty,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        country,
        isNaughty,
      ];
}