import 'dart:convert';

List<Teams> teamsFromJson(String str) => List<Teams>.from(json.decode(str).map((x) => Teams.fromJson(x)));

String teamsToJson(List<Teams> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Teams {
  Teams({
    this.image,
    this.year,
    this.title,
  });

  String image;
  int year;
  String title;

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
    image: json["image"],
    year: json["year"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "year": year,
    "title": title,
  };

}