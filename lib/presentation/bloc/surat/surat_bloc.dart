import 'package:aplikasi_suara_ilahi/domain/entitas/al_quran_model.dart';
import 'package:aplikasi_suara_ilahi/domain/usecase/get_surat/get_surat.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'surat_event.dart';
part 'surat_state.dart';

class SuratBloc extends Bloc<SuratEvent, SuratState> {
  final GetSurat getSurat;

  SuratBloc(this.getSurat) : super(SuratInitial()) {
    on<SuratEvent>((event, emit) async {
      emit(SuratLoading());
      final result = await getSurat.execute();

      result.fold((failure) {
        emit(SuratError(failure.message));
      }, (data) {
        emit(SuratHasData(data));
      });
    });
  }
}
