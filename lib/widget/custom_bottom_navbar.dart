import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gift_card_app/screens/home_screen.dart';

import '../util/app_color.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
      child: SizedBox(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavbarIcon(icon: Icons.home,isSelected: index == 0,onTap: index != 0 ? (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomeScreen()));
            }: null,),
            const _NavbarIcon(icon: Icons.card_giftcard),
            const _NavbarIcon(icon: Icons.shopping_cart_sharp),
            const _NavbarIcon(icon: Icons.person),
          ],
        ),
      ),
    );
  }
}
class _NavbarIcon extends StatelessWidget {
  const _NavbarIcon({
    Key? key,
    required this.icon,
    this.isSelected = false,
    this.onTap

  }) : super(key: key);
  final IconData icon;
  final Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primary : AppColors.lightGrey;
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Icon(icon,color: color,),
      ),
    );
  }
}
