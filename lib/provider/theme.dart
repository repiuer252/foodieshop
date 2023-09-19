import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'package:uts_asli/model/product_model.dart';

class MyProvider extends ChangeNotifier {
  int _ordersNumber = 0;

  double _totalNumber = 0;

  int _selectedBNBItem = 0;

  int _selectedIndexOfMenuList = 0;

  int _amountOfShoes = 1;

  String _selectedukuran = '41';

  MyProvider(bool isDarkTheme);

  String get selected {
    return _selectedukuran;
  }

  set selected(final String sizesepa) {
    _selectedukuran = sizesepa;

    notifyListeners();
  }

  List<Shoesproduct> listOfShoes = [
    Shoesproduct(
        nameOfShoes: 'kyrie 8',
        describeshoes: 'NEW shoes of kyrie',
        pathOfImage: [
          'images/sepatu 1.jpg',
          'images/sepatu 1-1.jpg',
          'images/sepatu 1-2.jpg',
          
        ],
        sizesepa: ['41', '42', '43'],
        price: '1970000',
        details:
            'The faster Kyrie slows down, the quicker he can speed up or change direction. His ability to control his movement keeps defenders guessing—and him in control. The Kyrie Infinity EP provides a cushioned, custom fit and traction up the sides, allowing players to accelerate and decelerate on demand and take advantage of the separation they create.',
        stars: '⭐ 4.5'),
    Shoesproduct(
        nameOfShoes: 'lebron 18',
        describeshoes: 'good for flat food',
        pathOfImage: ['images/sepatu 2.jpg', 'images/sepatu 2-1.jpg', ''],
        sizesepa: ['41', '42', '43'],
        price: '1870000',
        details:
            'When LeBron accelerates down the court, he produces tremendous force.The LeBron 18 is designed to harness his abilities while helping with the stress he puts on his body.Combined cushioning underfoot allows him to use his power for unstoppable bursts of speed.',
        stars: '⭐ 3.6'),
    Shoesproduct(
        nameOfShoes: 'Nike Lebron 19',
        describeshoes: 'power of stronger',
        pathOfImage: ['images/sepatu 3.jpg', 'images/sepatu 3-1.jpg', ''],
        sizesepa: ['41', '42', '43'],
        price: '2700000',
        details:
            'A Micro-engineered Blade Pattern On The Rubber Outsole Adds Multi-directional Traction Cushlon Foam Feels Soft, Stable And Responsive Flywire Cables Work With The Laces To Provide More Support As You Tighten ThemCushioned Pods Around The Collar And',
        stars: '⭐ 4.3'),
    Shoesproduct(
        nameOfShoes: 'UA Curry 3z5',
        describeshoes: 'bast on the bast',
        pathOfImage: ['images/sepatu 4.jpg', 'images/sepatu 4-1.jpg', ''],
        sizesepa: ['41', '42', '43'],
        price: '4070000',
        details:
            'Lightweight, Breathable Mesh Upper With Durable Leather Overlays Durable Rubber Outsole For Excellent Traction, Micro G Midsole Reduces The Impact Of Each Step When Walking',
        stars: '⭐ 4.4'),
  ];

  final List<Warna> screecard = [];

  List<Warna> get myList => screecard;

  void tambahkeranjang(Shoesproduct product) {
    var warna = Warna(
        size: _selectedukuran,
        warna: gantiwarna,
        stars: product.stars,
        details: product.details,
        price: product.price,
        describeshoes: product.describeshoes,
        nameOfShoes: product.nameOfShoes,
        pathOfImage: product.pathOfImage,
        sizesepa: product.sizesepa);

    _ordersNumber++;

    screecard.add(warna);

    notifyListeners();
  }

  void hapuskeranjang(
    Shoesproduct product,
  ) {
    _ordersNumber--;

    _totalNumber -= _amountOfShoes * double.parse(product.price);

    screecard.remove(product);

    notifyListeners();
  }

  int get ordersNumber => _ordersNumber;

  void calculateTotalPrice(int amount, double price) {
    _totalNumber += amount * price;

    notifyListeners();
  }

  void calculateminPrice(int amount, double price) {
    _totalNumber -= amount * price;

    notifyListeners();
  }

  double get totalNumber => _totalNumber;

  void bnBItem(int index) {
    _selectedBNBItem = index;

    notifyListeners();
  }

  int get selectedBNBItem => _selectedBNBItem;
  void setSelectedIndex(int i) {
    _selectedIndexOfMenuList = i;

    notifyListeners();
  }

  int get selectedIndexOfMenuList => _selectedIndexOfMenuList;

  int get amountOfShoes => _amountOfShoes;
  
  int get metoNumber => _ordersNumber = 0;

  String gantiwarna = 'awal';

  set red(val) {
    gantiwarna = val;

    notifyListeners();
  }

  set green(val) {
    gantiwarna = val;

    notifyListeners();
  }

  set abuabu(val) {
    gantiwarna = val;

    notifyListeners();
  }
  
  ThemeData? _selectedTheme;
  Typography? defaultTypography;
  SharedPreferences? prefs;

  ThemeData dark = ThemeData.dark().copyWith();

  ThemeData light = ThemeData.light().copyWith();

  ThemeProvider(bool darkThemeOn) {
    _selectedTheme = darkThemeOn ? dark : light;
  }

  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs?.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      await prefs?.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  ThemeData? getTheme() => _selectedTheme;
}


class ThemeProvider extends ChangeNotifier {
  
}
