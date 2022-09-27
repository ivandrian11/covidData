// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.provinsi,
    required this.kasus,
    required this.dirawat,
    required this.sembuh,
    required this.meninggal,
  });

  String provinsi;
  int kasus;
  int dirawat;
  int sembuh;
  int meninggal;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        provinsi: json["provinsi"],
        kasus: json["kasus"],
        dirawat: json["dirawat"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
      );

  Map<String, dynamic> toJson() => {
        "provinsi": provinsi,
        "kasus": kasus,
        "dirawat": dirawat,
        "sembuh": sembuh,
        "meninggal": meninggal,
      };
}
