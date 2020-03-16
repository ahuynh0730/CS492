import 'package:test/test.dart';
import '../lib/models/foodWastePost.dart';


void main(){

  test('FoodWastePost has no information', () {
    final foodWastePost = FoodWastePost();
    expect(foodWastePost.date, null);
    expect(foodWastePost.imageURL, null);
    expect(foodWastePost.latitude, null);
    expect(foodWastePost.longitude, null);
    expect(foodWastePost.quantity, null);
  });

}