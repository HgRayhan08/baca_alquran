part of 'doa_bloc.dart';

abstract class DoaState extends Equatable {
  const DoaState();

  @override
  List<Object> get props => [];
}

class DoaInitial extends DoaState {}

class DoaLoading extends DoaState {}

class DoaHasdata extends DoaState {
  final DoaModel doaModel;

  const DoaHasdata({required this.doaModel});

  @override
  List<Object> get props => [doaModel];
}

class DoaError extends DoaState {}
