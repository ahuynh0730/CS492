import 'dart:io';
import 'dart:math';

import 'planetary_system.dart';

class SpaceAdventure{
  
  final PlanetarySystem planetarySystem;

  SpaceAdventure({this.planetarySystem});

  void start(){
    printGreeting();
    printIntroduction(responseToPrompt('What is your name?'));
    print('Let\'s go on an adventure!');
    if (planetarySystem.hasPlanets){
      travel(
        promptForRandomOrSpecificDestination(
          'Shall I randomly choose a planet for you to visit? (Y or N)'
        )
      );
    } else {
      print('Aw, there are no planets to explore.');
    }
  }

  void printGreeting(){
    print('Welcome to the ${planetarySystem.name}!');
    print('There are ${planetarySystem.NumberOfPlanets} planets to explore.');
  } 



  void printIntroduction(String name){
    print('Nice to meet you, $name. My name is Eliza, I\'m an old friend of Alexa.');
  }


  String responseToPrompt(String prompt){
    print(prompt);
    return stdin.readLineSync();
  }

  void travelToRandomPlanet(){
    if (!planetarySystem.hasPlanets) return;
    final index = Random().nextInt(planetarySystem.NumberOfPlanets);
    travelTo(planetarySystem.planets[index].name);
  }

  void travelTo(String planetName){
    print('Traveling to $planetName...');
    planetarySystem.planets.forEach( (planet) {
      if (planet.name == planetName){
        print('Arrived at ${planet.name}. ${planet.description}');
      }
    });
  }

  void travel(bool randomDestination){
    if (randomDestination){
      travelToRandomPlanet();
    }
    else{
      travelTo(responseToPrompt('Name the planet you would like to visit.'));
    }
  }

  bool promptForRandomOrSpecificDestination(String prompt){
    
    String answer;
    while (answer != 'Y' && answer != 'N'){
      answer = responseToPrompt(prompt);
      if (answer == 'Y'){
        return true;
      } 
      else if (answer == 'N') {
        return false;
      }
      else {
        print('Sorry, I didn\'t get that.');
      }
    }
    return false;
  }
}

