import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';
import 'package:aplikasi_suara_ilahi/domain/usecase/get_detail_surat/get_detail_surat.dart';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_surat_event.dart';
part 'detail_surat_state.dart';

class DetailSuratBloc extends Bloc<DetailSuratEvent, DetailSuratState> {
  final GetDetailSurat getDetailSurat;

  DetailSuratBloc(
    this.getDetailSurat,
  ) : super(DetailSuratInitial()) {
    on<OnFetchDetailSurat>(
      (event, emit) async {
        emit(DetailSuratLoading());
        final nomor = event.nomor;
        final result = await getDetailSurat.execute(nomor);

        result.fold((failure) {
          emit(DetailSuratError(failure.message));
        }, (data) {
          emit(DetailSuratHasData(data));
        });
      },
    );
  }
}
