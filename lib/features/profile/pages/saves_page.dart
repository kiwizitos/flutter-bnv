import 'package:bnv/core/theme/app_colors.dart';
import 'package:bnv/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SavesPage extends StatelessWidget {
  const SavesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.blue800),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Itens salvos",
          style: AppTypography.highlightText(context)!
              .copyWith(color: AppColors.blue800),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: SvgPicture.asset("assets/svg/bnv1.svg"),
            ),
            Text("Seus itens salvos ficam aqui.", style: AppTypography.highlightText(context)!.copyWith(fontSize: 18),)
          ],
        ),
      ),
    );
  }
}
