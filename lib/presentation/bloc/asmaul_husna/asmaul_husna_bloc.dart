import 'dart:async';

import 'package:aplikasi_suara_ilahi/domain/entitas/asmaul_husna_model.dart';
import 'package:aplikasi_suara_ilahi/domain/usecase/get_asmaul_husna/get_asmaul_husna.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'asmaul_husna_event.dart';
part 'asmaul_husna_state.dart';

class AsmaulHusnaBloc extends Bloc<AsmaulHusnaEvent, AsmaulHusnaState> {
  final GetAsmaulHusna getAsmaulHusna;
  AsmaulHusnaBloc(this.getAsmaulHusna) : super(AsmaulHusnaInitial()) {
    on<OnFetchAsmaulHusna>(_getData);
  }

  Future<void> _getData(
    OnFetchAsmaulHusna event,
    Emitter<AsmaulHusnaState> emit,
  ) async {
    emit(Loading());
    final result = await getAsmaulHusna.execute();
    result.fold((failure) {
      emit(Error());
    }, (data) {
      emit(HasData(data));
    });
  }
}
