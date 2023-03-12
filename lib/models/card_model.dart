import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:gift_card_app/util/app_color.dart';

enum CardCategory { birthday, general, congratulation, christmas, halloween }

class CardModel {
  final int id;
  final String name;
  final String thumnailPath;
  final Color bgColor;
  final List<CardCategory> category;

  CardModel(
      {required this.id,
      required this.name,
      required this.thumnailPath,
      required this.bgColor,
      required this.category});
  static List<CardModel> sampleCards = [
    CardModel(
        id: 1,
        name: 'Congratulation',
        thumnailPath: 'assets/image/foryou.jpg',
        bgColor: AppColors.bgBlue,
        category: [CardCategory.congratulation, CardCategory.birthday]),
    CardModel(
        id: 2,
        name: 'Give For you',
        thumnailPath: 'assets/image/thank-you.gif',
        bgColor: AppColors.bgBlue,
        category: [CardCategory.general, CardCategory.congratulation]),
    CardModel(
        id: 3,
        name: 'Christmas',
        thumnailPath: 'assets/image/Christmas-Gift-Card-Holders.jpeg',
        bgColor:  AppColors.bgBlue,
        category:[CardCategory.christmas]),
    CardModel(
        id: 4,
        name: 'Happy BirthDay',
        thumnailPath: 'assets/image/foryou.jpg',
        bgColor:  AppColors.bgBlue,
        category:[CardCategory.birthday,CardCategory.general]),
    CardModel(
        id:5,
        name: 'General gift',
        thumnailPath: 'assets/image/gift.png',
        bgColor:  AppColors.bgBlue,
        category:[CardCategory.congratulation,CardCategory.general]),
    CardModel(
        id:6,
        name: 'Personal gift',
        thumnailPath: 'assets/image/person.gif',
        bgColor:  AppColors.bgBlue,
        category:[CardCategory.congratulation,CardCategory.general]),
    CardModel(
        id:7,
        name: 'Halloween gift',
        thumnailPath: 'assets/image/halloween-gift-box_1935257.jpg',
        bgColor:  AppColors.bgBlue,
        category:[CardCategory.halloween]),
    CardModel(
        id:8,
        name: 'Halloween trick-or-treat',
        thumnailPath: 'assets/image/trick-or-treat-halloween-large.jpg',
        bgColor:  AppColors.bgBlue,
        category:[CardCategory.halloween]),
    CardModel(
        id:9,
        name: 'Congratulation for you',
        thumnailPath: 'assets/image/congratulation.jpeg',
        bgColor:  AppColors.bgBlue,
        category:[CardCategory.congratulation]),

  ];

}
