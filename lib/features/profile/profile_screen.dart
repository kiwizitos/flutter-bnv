import 'package:bnv/core/theme/app_colors.dart';
import 'package:bnv/core/theme/app_typography.dart';
import 'package:bnv/features/profile/pages/profile_page.dart';
import 'package:bnv/features/profile/pages/saves_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'pages/info_page.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var profileListName = ProfileData.profileList;
    var profileListIcon = ProfileData.profileIcon;
    var profileListPage = ProfileData.profilePage;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue800,
        elevation: 0,
        toolbarHeight: 200,
        title: Center(
          child: Column(
            children: [
              CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 30,
                  child: SvgPicture.asset("assets/svg/profile.svg")),
              Text(
                'Matheus Pinheiro',
                style: AppTypography.highlightText(context)!
                    .copyWith(color: AppColors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppColors.white),
                child: Text(
                  'Ver perfil',
                  style: AppTypography.bodyText(context)!
                      .copyWith(color: AppColors.blue800),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: AppColors.white,
        child: ListView.builder(
            itemCount: profileListName.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  profileListName[index],
                  style: AppTypography.bodyText(context),
                ),
                leading: Icon(profileListIcon[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => profileListPage[index]),
                  );
                },
              );
            }),
      ),
    );
  }
}

class ProfileData {
  static final profileList = [
    'Informações',
    'Itens Salvos',
  ];
  static final profileIcon = [
    Icons.sticky_note_2,
    Icons.bookmark,
  ];
  static final profilePage = [
    InfoPage(),
    SavesPage(),
  ];
}
