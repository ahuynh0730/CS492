import 'dart:math';

class Magic8Ball{
  
  final Random random = Random();
  final int numberOptions = 8;

  Magic8Ball();

  String shake(){
    int currentValue = random.nextInt(numberOptions);
    switch (currentValue){
      case 0: 
        return 'As I see it, yes.';
      case 1:
        return 'Ask again later.';
      case 2:
        return 'Better not tell you now.';
      case 3:
        return 'Cannot predict now.';
      case 4:
        return 'Don\'t count on it.';
      case 5:
        return 'It is certain.';
      case 6:
        return 'It is decidedly so.';
      default:
        return 'Most likely.';
    }
  }

}