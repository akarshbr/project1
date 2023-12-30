import 'package:flutter/material.dart';
import '../model/hotel.dart';

List<Hotel> hotelList = [
  Hotel(name: "Savoy", image: "assets/hotel/savoy1.jpg", price: 1200, rating: 4.1, place: "Kannur,Kerala")
];

class HotelProvider extends ChangeNotifier {
  final List<Hotel> _hotel = hotelList;

  List<Hotel> get hotel => _hotel;

  final List<Hotel> _wishList = [];

  List<Hotel> get wishList => _wishList;
}
