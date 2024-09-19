class CardModel{
  String imgURL;
  String name;
  String text;
  double price;
  int quantity;
  double rating;
  bool myFav;
  double totalPrice;


  CardModel({
    required this.imgURL,
    required this.name,
    required this.text,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.myFav,
    required this.totalPrice,
 });
}