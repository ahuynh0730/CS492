import 'planet.dart';

class PlanetarySystem{
  final String name;
  final List<Planet> planets;

  PlanetarySystem({this.name = 'Unnamed System', this.planets = const[] });

  int get NumberOfPlanets => planets.length;
  bool get hasPlanets => planets.isNotEmpty;
  
}

