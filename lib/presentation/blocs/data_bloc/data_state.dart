import 'package:equatable/equatable.dart';

abstract class DataState extends Equatable  {
  @override
  List<Object?> get props => [];
}

class InitialDataState extends DataState {}

class LoadingDataState extends DataState {}

class SuccessDataState extends DataState {}

class StatusChange extends DataState {}

class ErrorDataState extends DataState {
  final String? errorMessage;

  ErrorDataState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
