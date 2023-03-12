import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gift_card_app/widget/app_text.dart';

import '../models/card_model.dart';

class CustomGiftCard extends StatelessWidget {
  final CardModel card;
  final double width;
  final bool showLabel;
  final int? value;
  final bool showValue;

  const CustomGiftCard({
    required this.card,
    required this.width,
    this.showLabel = true,
    this.value,
    this.showValue = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Image.asset(
            card.thumnailPath,
            fit: BoxFit.cover,
          )),
          if (showLabel) ...[SizedBox(height: 10.h), AppText.medium(card.name)]
        ],
      ),
      if (showValue)
        Positioned(
            bottom: 10.0.h, right: 10.0.w, child: AppText.large('\$$value')),
    ]);
  }
}
