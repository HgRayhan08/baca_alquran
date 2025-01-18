part of 'detail_surat_bloc.dart';

abstract class DetailSuratState extends Equatable {
  const DetailSuratState();

  @override
  List<Object> get props => [];
}

class DetailSuratInitial extends DetailSuratState {}

class DetailSuratLoading extends DetailSuratState {}

class DetailSuratHasData extends DetailSuratState {
  final SuratModel suratModela;

  const DetailSuratHasData(this.suratModela);

  @override
  List<Object> get props => [suratModela];
}

class DetailSuratError extends DetailSuratState {
  final String message;

  const DetailSuratError(this.message);

  @override
  List<Object> get props => [message];
}
