import 'package:aplikasi_suara_ilahi/domain/entitas/al_quran_model.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/surat/surat_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/page/detail_surat_page/detail_surat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TiddakTahu extends StatelessWidget {
  const TiddakTahu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surat"),
      ),
      body: FutureBuilder(
        future: Future.microtask(
          // ignore: use_build_context_synchronously
          () => context.read<SuratBloc>().add(
                OnFetchSurat(),
              ),
        ),
        builder: (context, snapshot) {
          return BlocBuilder<SuratBloc, SuratState>(
            builder: (context, state) {
              if (state is SuratLoading) {
                return Center(child: Text("Aplikasi Sedang Loading..."));
              }
              if (state is SuratHasData) {
                final data = state.alquranModel;
                return ListSurat(alquranModel: data);
              }
              if (state is SuratError) {
                return Center(child: Text("Aplikasi Sedang Error..."));
              }
              return Center(
                child: Text(
                  "Aplikasi Sedang error dan tidak diketahui ...",
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ListSurat extends StatelessWidget {
  final AlquranModel alquranModel;
  const ListSurat({super.key, required this.alquranModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alquranModel.data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailSuratPage(
                  nomor: alquranModel.data[index].nomor,
                ),
              ),
            );
          },
          child: Text(alquranModel.data[index].namaLatin),
        );
      },
    );
  }
}
