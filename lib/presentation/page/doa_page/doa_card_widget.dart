import 'package:aplikasi_suara_ilahi/core/constant.dart';
import 'package:aplikasi_suara_ilahi/domain/entitas/doa_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDoaWidget extends StatefulWidget {
  final int index;
  final Datum doaModel;
  final double width;
  final double height;
  const CardDoaWidget({
    super.key,
    required this.doaModel,
    required this.index,
    required this.width,
    required this.height,
  });

  @override
  State<CardDoaWidget> createState() => _CardDoaWidgetState();
}

class _CardDoaWidgetState extends State<CardDoaWidget> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: secoundColor,
                child: Text(
                  "${widget.index + 1}",
                  style: GoogleFonts.lato(
                    color: fifthColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                width: widget.width * 0.04,
              ),
              Expanded(
                child: Text(
                  widget.doaModel.judul,
                  overflow: TextOverflow.fade,
                  softWrap: true,
                  style: GoogleFonts.lato(fontSize: 16),
                ),
              ),
            ],
          ),
          if (isActive == false)
            Container()
          else
            Container(
              margin: EdgeInsets.only(left: widget.width * 0.13),
              padding: EdgeInsets.only(bottom: widget.height * 0.01),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: widget.height * 0.01),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.doaModel.arab,
                      style: GoogleFonts.lato(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: widget.height * 0.01),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.doaModel.arti,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
