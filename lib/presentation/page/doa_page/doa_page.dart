import 'package:aplikasi_suara_ilahi/core/constant.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/doa/doa_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/page/doa_page/doa_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DoaPage extends StatelessWidget {
  const DoaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Kumpulan Doa",
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
          () => context.read<DoaBloc>().add(
                OnFetchDoa(),
              ),
        ),
        builder: (context, snapshot) {
          return BlocBuilder<DoaBloc, DoaState>(
            builder: (context, state) {
              if (state is DoaLoading) {
                return Center(
                  child: Text("Aplikasi Sedang Loading"),
                );
              }
              if (state is DoaHasdata) {
                var data = state.doaModel.data;
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.005),
                      child: CardDoaWidget(
                        doaModel: data[index],
                        index: index,
                        height: height,
                        width: width,
                      ),
                    );
                  },
                );
              }
              return Center(
                child: Text("Aplikasi sedang Error dan tidak diketahui"),
              );
            },
          );
        },
      ),
    );
  }
}
