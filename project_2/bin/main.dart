import 'package:project_2/project_2.dart';

void main(List<String> arguments) {
  SpaceAdventure(
    planetarySystem: PlanetarySystem(
      name: 'Solar System',
      planets: mockPlanets()
    )
  ).start(); 
}

List<Planet> mockPlanets(){
  return [
    Planet(
      name: 'Mercury',
      description: 'A very hot planet, closest to the sun.'
    ),
    Planet(
      name: 'Venus',
      description: 'It\'s very ccloudy here!'
    )
  ];
}