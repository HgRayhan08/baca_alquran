// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aplikasi_suara_ilahi/presentation/page/surat_page/card_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:aplikasi_suara_ilahi/core/constant.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/surat/surat_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/page/detail_surat_page/detail_surat_page.dart';

class SuratPage extends StatefulWidget {
  const SuratPage({super.key});

  @override
  State<SuratPage> createState() => _SuratPageState();
}

class _SuratPageState extends State<SuratPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
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
                                      boxShadow: [
                                        BoxShadow(
                                          color: secoundColor,
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: Offset(2, 2),
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: -1,
                                          blurRadius: 3,
                                          offset: Offset(-2, -2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${index + 1}",
                                        style: GoogleFonts.lato(
                                          color: fifthColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                    style: GoogleFonts.lato(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
