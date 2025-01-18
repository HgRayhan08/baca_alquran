part of 'detail_surat_bloc.dart';

abstract class DetailSuratEvent extends Equatable {
  const DetailSuratEvent();

  @override
  List<Object> get props => [];
}

class OnFetchDetailSurat extends DetailSuratEvent {
  final int nomor;

  const OnFetchDetailSurat(this.nomor);

  @override
  List<Object> get props => [nomor];
}
