import 'package:aplikasi_suara_ilahi/core/constant.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/asmaul_husna_model.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/asmaul_husna/asmaul_husna_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AsmaulHusnaPage extends StatelessWidget {
  const AsmaulHusnaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Asmaul Husna",
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
      body: FutureBuilder(
          future: Future.microtask(
            // ignore: use_build_context_synchronously
            () => context.read<AsmaulHusnaBloc>().add(
                  OnFetchAsmaulHusna(),
                ),
          ),
          builder: (context, snapshot) {
            return BlocBuilder<AsmaulHusnaBloc, AsmaulHusnaState>(
                builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: Text("Loading..."),
                );
              }
              if (state is HasData) {
                var data = state.asmaulHusna.data;
                return ListAsmaulHusna(data: data);
              } else {
                return Center(
                  child: Text("Loading..."),
                );
              }
            });
          }),
    );
  }
}

class ListAsmaulHusna extends StatelessWidget {
  final List<Datum> data;
  const ListAsmaulHusna({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: secoundColor,
                    child: Text(
                      data[index].urutan.toString(),
                      style: GoogleFonts.lato(
                        color: fifthColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width * 0.04),
                    width: width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index].latin,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data[index].arti,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: GoogleFonts.lato(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                data[index].arab,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
