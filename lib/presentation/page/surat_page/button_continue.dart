import 'package:aplikasi_suara_ilahi/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: thirdColor,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(2, 2),
            ),
            BoxShadow(
              color: Colors.white, // Shadow putih untuk efek 3D
              spreadRadius: -1,
              blurRadius: 3,
              offset: Offset(-2, -2),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Continue",
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  color: fifthColor,
                ),
              ),
              Icon(
                Icons.arrow_right_alt_sharp,
                size: 30,
                color: fifthColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
