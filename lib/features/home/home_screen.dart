import 'package:bnv/core/theme/app_colors.dart';
import 'package:bnv/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.blue800),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "BNV",
          style: AppTypography.highlightText(context)!
              .copyWith(color: AppColors.blue800),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(32),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 300,
                        child: SvgPicture.asset("assets/svg/bnv3.svg"),
                      ),
                      Text(
                        "Os seus cursos recentes ficam aqui. Que tal começar algo novo hoje?",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: AppColors.blue800,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
