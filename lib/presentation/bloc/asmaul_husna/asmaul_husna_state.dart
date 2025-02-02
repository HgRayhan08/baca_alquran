part of 'asmaul_husna_bloc.dart';

abstract class AsmaulHusnaState extends Equatable {
  const AsmaulHusnaState();

  @override
  List<Object> get props => [];
}

class AsmaulHusnaInitial extends AsmaulHusnaState {}

class Loading extends AsmaulHusnaState {}

class HasData extends AsmaulHusnaState {
  final AsmaulHusnaModel asmaulHusna;

  const HasData(this.asmaulHusna);

  @override
  List<Object> get props => [asmaulHusna];
}

class Error extends AsmaulHusnaState {}
