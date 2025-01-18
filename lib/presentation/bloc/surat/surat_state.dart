part of 'surat_bloc.dart';

abstract class SuratState extends Equatable {
  const SuratState();

  @override
  List<Object> get props => [];
}

class SuratInitial extends SuratState {}

class SuratLoading extends SuratState {}

class SuratHasData extends SuratState {
  final AlquranModel alquranModel;

  const SuratHasData(this.alquranModel);

  @override
  List<Object> get props => [alquranModel];
}

class SuratError extends SuratState {
  final String message;

  const SuratError(this.message);

  @override
  List<Object> get props => [message];
}
