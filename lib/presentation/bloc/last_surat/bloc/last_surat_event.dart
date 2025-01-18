part of 'last_surat_bloc.dart';

abstract class LastSuratEvent extends Equatable {
  const LastSuratEvent();

  @override
  List<Object> get props => [];
}

class OnGetLastSurat extends LastSuratEvent {}

class OnAddLastSurat extends LastSuratEvent {
  final SuratModel surat;

  const OnAddLastSurat(this.surat);

  @override
  List<Object> get props => [surat];
}

class OnRemoveLastSurat extends LastSuratEvent {
  final SuratModel surat;

  const OnRemoveLastSurat(this.surat);

  @override
  List<Object> get props => [surat];
}
