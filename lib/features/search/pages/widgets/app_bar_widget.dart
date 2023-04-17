import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget {
  final double appBarHeight = 66.0;

  const AppBarWidget({super.key, required this.catergoryName, required this.categoryImage});

  final catergoryName;
  final categoryImage;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.symmetric(vertical: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset(categoryImage),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
