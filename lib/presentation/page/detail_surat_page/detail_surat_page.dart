import 'package:aplikasi_suara_ilahi/core/constant.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/detail_surat/detail_surat_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/last_surat/bloc/last_surat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailSuratPage extends StatelessWidget {
  final int nomor;
  const DetailSuratPage({super.key, required this.nomor});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.microtask(
        // ignore: use_build_context_synchronously
        () => context.read<DetailSuratBloc>().add(
              OnFetchDetailSurat(nomor),
            ),
      ),
      builder: (context, snapshot) {
        return BlocBuilder<DetailSuratBloc, DetailSuratState>(
          builder: (context, state) {
            if (state is DetailSuratLoading) {
              return Scaffold(
                body: Center(
                  child: Text("Aplikasi Sedang Loading..."),
                ),
              );
            }
            if (state is DetailSuratHasData) {
              final data = state.suratModela;
              return BodyDetail(
                surat: data,
              );
            }
            if (state is DetailSuratError) {
              return Scaffold(
                body: Center(
                  child: Text("Aplikasi Sedang Maintenance..."),
                ),
              );
            }
            return Scaffold(
              body: Center(
                child: Text("Aplikasi Sedang error..."),
              ),
            );
          },
        );
      },
    );
  }
}

class CobaLocal extends StatefulWidget {
  final SuratModel surat;
  const CobaLocal({
    super.key,
    required this.surat,
  });

  @override
  State<CobaLocal> createState() => _CobaLocalState();
}

class _CobaLocalState extends State<CobaLocal> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.microtask(
        // ignore: use_build_context_synchronously
        () => context.read<LastSuratBloc>().add(
              OnGetLastSurat(),
            ),
      ),
      builder: (context, snapshot) {
        return BlocBuilder<LastSuratBloc, LastSuratState>(
          builder: (context, state) {
            if (state is LastSuratLoading) {
              return Center(
                child: Text("Aplikasi Sedang Loading..."),
              );
            }
            if (state is LastSuratHasData) {
              final data = state.suratModela;
              return Center(
                // child: Text("Aplikasi Berjalan "),
                child: Text(data["surat"]),
              );
            }
            if (state is LastSuratError) {
              return Center(
                child: Text("Aplikasi Sedang Maintenance..."),
              );
            }
            return Center(
              child: Text("Aplikasi Sedang error..."),
            );
          },
        );
      },
    );
  }
}

class BodyDetail extends StatelessWidget {
  final SuratModel surat;
  const BodyDetail({super.key, required this.surat});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: thirdColor,
        elevation: 6.0,
        shadowColor: thirdColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            Future.microtask(
              // ignore: use_build_context_synchronously
              () => context.read<LastSuratBloc>().add(
                    OnAddLastSurat(surat),
                  ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          surat.data.namaLatin,
          style: GoogleFonts.raleway(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        bottom: PreferredSize(
          preferredSize: Size(width, height * 0.08),
          child: Image.asset(
            'assets/bismilah.png',
            width: 300,
            height: 80,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.04),
        child: BodySurat(
          surat: surat,
        ),
      ),
    );
  }
}

class BodySurat extends StatelessWidget {
  final SuratModel surat;
  const BodySurat({
    super.key,
    required this.surat,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final ayat = surat.data.ayat;
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      itemCount: ayat.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.08,
                height: width * 0.08,
                decoration: BoxDecoration(
                  color: secoundColor,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Center(
                  child: Text(
                    ayat[index].nomorAyat.toString(),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ayat[index].teksArab,
                      textAlign: TextAlign.end,
                      style: GoogleFonts.lato(fontSize: 20),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      ayat[index].teksIndonesia,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
