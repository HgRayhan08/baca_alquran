// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:aplikasi_suara_ilahi/core/constant.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/last_surat/bloc/last_surat_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/surat/surat_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/page/detail_surat_page/detail_surat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(
          "Baca Al-Quran",
          style: GoogleFonts.raleway(
            color: fifthColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardInformation(width: width, height: height),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.05,
              top: height * 0.01,
              bottom: height * 0.01,
            ),
            child: Text(
              "Surah",
              style: GoogleFonts.raleway(
                color: fifthColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FutureBuilder(
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
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SuratHasData) {
                    final data = state.alquranModel.data;
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.05,
                          ),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                bool result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailSuratPage(
                                      nomor: data[index].nomor,
                                    ),
                                  ),
                                );
                                if (result == true) {
                                  setState(() {});
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: height * 0.02),
                                padding: EdgeInsets.only(bottom: height * 0.01),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: secoundColor),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width * 0.12,
                                      height: height * 0.05,
                                      decoration: BoxDecoration(
                                        color: firstColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${index + 1}",
                                          style: GoogleFonts.lato(
                                              color: fifthColor),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          data[index].namaLatin,
                                          style: GoogleFonts.lato(fontSize: 14),
                                        ),
                                        Text(
                                          "Berjumlah ${data[index].jumlahAyat.toString()}",
                                          style: GoogleFonts.lato(fontSize: 12),
                                        )
                                      ],
                                    ),
                                    Text(
                                      data[index].nama,
                                      style: GoogleFonts.lato(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                  if (state is SuratError) {
                    return Center(child: Text("Aplikasi Sedang Mintenance..."));
                  }
                  return Center(
                      child: Text(
                          "Aplikasi Sedang error dan tidak diketahui ..."));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ButtonContinue extends StatelessWidget {
  const ButtonContinue({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
  });
  final Function() onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.3,
        height: height * 0.04,
        decoration: BoxDecoration(
          color: fifthColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Continue",
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_right_alt_sharp,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardInformation extends StatelessWidget {
  final double width;
  final double height;
  const CardInformation({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: height * 0.01,
        left: width * 0.05,
        right: width * 0.05,
      ),
      padding: EdgeInsets.all(width * 0.05),
      height: height * 0.2,
      decoration: BoxDecoration(
        color: secoundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(width * 0.05),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder(
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
                      child: Text("Loading..."),
                    );
                  }
                  if (state is LastSuratHasData) {
                    final data = state.suratModela;
                    if (data["surat"] != null) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.4,
                            decoration: BoxDecoration(
                              // color: secoundColor,
                              border: Border(
                                bottom: BorderSide(),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: height * 0.005),
                              child: Text(
                                "Last Reading",
                                style: GoogleFonts.lato(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Surat ${data["surat"] ?? ""}",
                            style: GoogleFonts.lato(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          ButtonContinue(
                            width: width,
                            height: height,
                            onTap: () async {
                              bool result = await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailSuratPage(nomor: data["code"]),
                                ),
                              );
                              if (result == true) {
                                // setState(() {});
                              }
                            },
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Assalamualaikum ",
                            style: GoogleFonts.raleway(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "selamat datang di aplikasi",
                            style: GoogleFonts.raleway(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      );
                    }
                  }
                  if (state is LastSuratError) {
                    return Center(
                      child: Text("Error..."),
                    );
                  }
                  return Center(
                    child: Text("Terjadi"),
                  );
                },
              );
            },
          ),
          Image.asset(
            "assets/logo.png",
            width: width * 0.35,
          ),
        ],
      ),
    );
  }
}
