import 'package:dio/dio.dart';

class Superhero {
  final String name;
  final String power;
  final String url;

  Superhero({required this.name, required this.power, required this.url});

  factory Superhero.fromJson(Map<String, dynamic> json) {
    return Superhero(
      name: json['name'],
      power: json['power'],
      url: json['url'],
    );
  }
}

class SuperheroList {
  final List<Superhero> superheros;

  SuperheroList({required this.superheros});

  factory SuperheroList.fromJson(Map<String, dynamic> json) {
    List<dynamic> superherosJson = json['superheros'];
    List<Superhero> superheros =
        superherosJson.map((heroJson) => Superhero.fromJson(heroJson)).toList();
    return SuperheroList(superheros: superheros);
  }
}
