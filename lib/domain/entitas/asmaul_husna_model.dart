// To parse this JSON data, do
//
//     final asmaulHusnaModel = asmaulHusnaModelFromJson(jsonString);

import 'dart:convert';

AsmaulHusnaModel asmaulHusnaModelFromJson(String str) =>
    AsmaulHusnaModel.fromJson(json.decode(str));

String asmaulHusnaModelToJson(AsmaulHusnaModel data) =>
    json.encode(data.toJson());

class AsmaulHusnaModel {
  String nama;
  List<Datum> data;

  AsmaulHusnaModel({
    required this.nama,
    required this.data,
  });

  factory AsmaulHusnaModel.fromJson(Map<String, dynamic> json) =>
      AsmaulHusnaModel(
        nama: json["nama"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int urutan;
  String latin;
  String arab;
  String arti;

  Datum({
    required this.urutan,
    required this.latin,
    required this.arab,
    required this.arti,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        urutan: json["urutan"],
        latin: json["latin"],
        arab: json["arab"],
        arti: json["arti"],
      );

  Map<String, dynamic> toJson() => {
        "urutan": urutan,
        "latin": latin,
        "arab": arab,
        "arti": arti,
      };
}
