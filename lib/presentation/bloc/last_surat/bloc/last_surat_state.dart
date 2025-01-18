part of 'last_surat_bloc.dart';

abstract class LastSuratState extends Equatable {
  const LastSuratState();

  @override
  List<Object> get props => [];
}

class LastSuratInitial extends LastSuratState {}

class LastSuratLoading extends LastSuratState {}

class LastSuratHasData extends LastSuratState {
  final Map<String, dynamic> suratModela;

  const LastSuratHasData(this.suratModela);

  @override
  List<Object> get props => [suratModela];
}

class LastSuratSuccses extends LastSuratState {
  final String message;

  const LastSuratSuccses(this.message);

  @override
  List<Object> get props => [message];
}

class LastSuratError extends LastSuratState {
  final String message;

  const LastSuratError(this.message);

  @override
  List<Object> get props => [message];
}
