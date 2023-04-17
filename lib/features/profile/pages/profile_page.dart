import 'package:bnv/core/theme/app_colors.dart';
import 'package:bnv/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.blue800,
            pinned: true,
            iconTheme: const IconThemeData(color: AppColors.white),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              color: AppColors.blue800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 50,
                      child: SvgPicture.asset("assets/svg/profile.svg")),
                  Text(
                    "Matheus Pinheiro",
                    style: AppTypography.highlightText(context)!
                        .copyWith(color: AppColors.white),
                  ),
                  Text(
                    "@Kiwizitos",
                    style: AppTypography.subText(context)!
                        .copyWith(color: AppColors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: AppColors.white,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Horas assistidas",
                                style: AppTypography.highlightText(context)!
                                    .copyWith(fontSize: 16),
                              ),
                              Text(
                                "0h",
                                style: AppTypography.highlightText(context)!
                                    .copyWith(
                                        fontSize: 16, color: AppColors.blue300),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Serviços contratados",
                                style: AppTypography.highlightText(context)!
                                    .copyWith(fontSize: 16),
                              ),
                              Text(
                                "0",
                                style: AppTypography.highlightText(context)!
                                    .copyWith(
                                        fontSize: 16, color: AppColors.blue300),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Atividade Recente",
                                style: AppTypography.highlightText(context),
                              )),
                          SizedBox(
                            height: 100,
                            child: SvgPicture.asset("assets/svg/bnv3.svg"),
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              "Ops, parece que você ainda não acessou nenhum conteúdo.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tags seguidas", style: AppTypography.highlightText(context),),
                          Wrap(
                            children: [
                              Card(
                                 color: AppColors.blue300,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Marketing", style: AppTypography.subText(context)!.copyWith(color: AppColors.white),),
                                ),
                              ),
                              Card(
                                color: AppColors.blue300,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Administração", style: AppTypography.subText(context)!.copyWith(color: AppColors.white),),
                                ),
                              ),
                              Card(
                                color: AppColors.blue300,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Empreendedorismo", style: AppTypography.subText(context)!.copyWith(color: AppColors.white),),
                                ),
                              ),
                              Card(
                                color: AppColors.blue300,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Carreira", style: AppTypography.subText(context)!.copyWith(color: AppColors.white),),
                                ),
                              ),
                              Card(
                                color: AppColors.blue300,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Design", style: AppTypography.subText(context)!.copyWith(color: AppColors.white),),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
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
