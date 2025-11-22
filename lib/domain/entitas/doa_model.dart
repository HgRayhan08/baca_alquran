// To parse this JSON data, do
//
//     final doaModel = doaModelFromJson(jsonString);

import 'dart:convert';

DoaModel doaModelFromJson(String str) => DoaModel.fromJson(json.decode(str));

String doaModelToJson(DoaModel data) => json.encode(data.toJson());

class DoaModel {
  String nama;
  List<Datum> data;

  DoaModel({
    required this.nama,
    required this.data,
  });

  factory DoaModel.fromJson(Map<String, dynamic> json) => DoaModel(
        nama: json["nama"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String judul;
  String arab;
  String latin;
  String arti;

  Datum({
    required this.judul,
    required this.arab,
    required this.latin,
    required this.arti,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        judul: json["judul"],
        arab: json["arab"],
        latin: json["latin"],
        arti: json["arti"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "arab": arab,
        "latin": latin,
        "arti": arti,
      };
}
