import 'package:aplikasi_suara_ilahi/core/constant.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/last_surat/bloc/last_surat_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/page/detail_surat_page/detail_surat_page.dart';
import 'package:aplikasi_suara_ilahi/presentation/page/surat_page/button_continue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CardInformation extends StatefulWidget {
  final double width;
  final double height;
  const CardInformation({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<CardInformation> createState() => _CardInformationState();
}

class _CardInformationState extends State<CardInformation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: EdgeInsets.only(
        top: widget.height * 0.01,
        left: widget.width * 0.05,
        right: widget.width * 0.05,
      ),
      padding: EdgeInsets.all(widget.width * 0.05),
      height: widget.height * 0.2,
      decoration: BoxDecoration(
          // color: secoundColor,
          gradient: LinearGradient(
            colors: [secoundColor, firstColor], // Warna gradasi
            begin: Alignment.bottomCenter, // Mulai dari kiri atas
            end: Alignment.topCenter, // Berakhir di kanan bawah
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(widget.width * 0.05),
          ),
          boxShadow: [
            BoxShadow(
              color: firstColor,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(2, 3),
            ),
          ]),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                "assets/logo.png",
                width: widget.width * 0.4,
              ),
            ),
          ),
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
                            width: widget.width * 0.4,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.5,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: widget.height * 0.005),
                              child: Text(
                                "Last Reading",
                                style: GoogleFonts.lato(
                                  fontSize: 25,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Surat ${data["surat"] ?? ""}",
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800]),
                          ),
                          ButtonContinue(
                            width: widget.width,
                            height: widget.height,
                            onTap: () async {
                              bool result = await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailSuratPage(nomor: data["code"]),
                                ),
                              );
                              if (result == true) {
                                setState(() {});
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
                    child: Text("Terjadi Error"),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
