part of 'asmaul_husna_bloc.dart';

abstract class AsmaulHusnaEvent extends Equatable {
  const AsmaulHusnaEvent();

  @override
  List<Object> get props => [];
}

class OnFetchAsmaulHusna extends AsmaulHusnaEvent {}
