import 'package:project_2/project_2.dart';
import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) async{
  
  //waits for file content
  var fileContent = await readFromFile(arguments[0]);

  //extract planet data from json
  //var planetObjsJson = jsonDecode(fileContent)['planets'] as List;
  //List planetData = planetObjsJson.map((planetJson) => Planet.fromJson(planetJson)).toList();

  SpaceAdventure(
    planetarySystem: PlanetarySystem(
      name: jsonDecode(fileContent)['name'] as String,
      planets: (
        jsonDecode(fileContent)['planets'] as List
      ).map((planetJson) => Planet.fromJson(planetJson)).toList()
    )
  ).start();

}


Future<String> readFromFile(String fileName) async{
  var file = File(fileName);
  String fileContents;

  //makes sure file exists before reading content into fileContents as a String
  if (await file.exists()){
    fileContents = await file.readAsString();
  }

  return fileContents;
}