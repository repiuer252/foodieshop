class Shoesproduct {
  Shoesproduct({
    required this.nameOfShoes,
    required this.describeshoes,
    required this.pathOfImage,
    required this.price,
    required this.details,
    required this.stars,
    required this.sizesepa,
  });

  List<String> pathOfImage;

  String nameOfShoes;

  String describeshoes;

  String price;

//

  String details;

  String stars;

  List<String> sizesepa;
}

class Warna extends Shoesproduct {
  String warna;

  String size;

  Warna({
    required this.size,
    required this.warna,
    stars,
    ingredients,
    details,
    price,
    describeshoes,
    nameOfShoes,
    greenOfImage,
    pathOfImage,
    ukuran,
    sizesepa,
  }) : super(
          sizesepa: sizesepa,
          stars: stars,
          details: details,
          price: price,
          describeshoes: describeshoes,
          nameOfShoes: nameOfShoes,
          pathOfImage: pathOfImage,
        );
}
