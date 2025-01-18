part of 'surat_bloc.dart';

abstract class SuratEvent extends Equatable {
  const SuratEvent();

  @override
  List<Object> get props => [];
}

class OnFetchSurat extends SuratEvent {}
