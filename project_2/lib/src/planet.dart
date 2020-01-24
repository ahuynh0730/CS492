class Planet {
  final String name;
  final String description;

  Planet({this.name, this.description});
  Planet.nullPlanet() : name = 'Null', description = 'Null';

  factory Planet.fromJson(dynamic json) {
    return Planet(name: json['name'] as String, description: json['description'] as String);
  }
}