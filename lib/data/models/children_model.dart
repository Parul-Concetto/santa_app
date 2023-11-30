import 'package:equatable/equatable.dart';

class ChildrenModel extends Equatable {
  final int id;
  final String name;
  final String country;
  final bool? isNaughty;

  const ChildrenModel(
      {required this.id,
      required this.name,
      required this.country,
      this.isNaughty});

  @override
  List<Object?> get props => [id, name, country, isNaughty];
}
