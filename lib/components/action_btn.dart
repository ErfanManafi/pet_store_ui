import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_store/colors.dart';

class ActionButton extends StatelessWidget {
  final String img;
  final Function() onTap;
  final Color color;
  final bool hasBadge;
  final int badgeValue;
  const ActionButton({
    super.key,
    required this.img,
    required this.onTap,
    this.color = Colors.black,
    this.hasBadge = false,
    this.badgeValue = 1,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: SolidColors.darkRed,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5)
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: hasBadge
            ? badges.Badge(
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.black,
                ),
                badgeContent: Text(
                  '$badgeValue',
                  style: const TextStyle(color: Colors.white),
                ),
                child: SvgPicture.asset(
                  img,
                  color: color,
                  width: 24,
                  height: 24,
                ),
              )
            : SvgPicture.asset(
                img,
                color: color,
                width: 24,
                height: 24,
              ),
      ),
    );
  }
}
