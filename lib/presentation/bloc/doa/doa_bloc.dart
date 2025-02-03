import 'dart:async';

import 'package:aplikasi_suara_ilahi/domain/entitas/doa_model.dart';
import 'package:aplikasi_suara_ilahi/domain/usecase/get_doa/get_doa.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doa_event.dart';
part 'doa_state.dart';

class DoaBloc extends Bloc<DoaEvent, DoaState> {
  final GetDoa getDoa;
  DoaBloc(this.getDoa) : super(DoaInitial()) {
    on<OnFetchDoa>(_getData);
  }

  Future<void> _getData(OnFetchDoa event, Emitter<DoaState> emit) async {
    emit(DoaLoading());
    final result = await getDoa.execute();
    result.fold((failure) {
      emit(DoaError());
    }, (data) {
      emit(DoaHasdata(doaModel: data));
    });
  }
}
