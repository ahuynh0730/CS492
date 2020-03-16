class FoodWastePost{
  DateTime date;
  String imageURL;
  int quantity;
  double latitude;
  double longitude;

  void addDateToPost(){
    date = new DateTime.now();
  }

  
}