import 'dart:convert';
import 'dart:math';

import 'package:bnv/core/theme/app_colors.dart';
import 'package:bnv/core/theme/app_typography.dart';
import 'package:bnv/models/course_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:flutter_svg/flutter_svg.dart';

import '../course_detail_page.dart';
import 'app_bar_widget.dart';

class CourseCategoryCardWidget extends StatelessWidget {
  CourseCategoryCardWidget({Key? key}) : super(key: key);

  final categoryName = "Cursos";
  final categoryImage = "assets/svg/course.svg";

  @override
  Widget build(BuildContext context) {
    return CourseResultList(categoryName: categoryName, categoryImage: categoryImage);
  }
}

class CourseResultList extends StatelessWidget {
  const CourseResultList({super.key, required this.categoryName, this.categoryImage});

  final categoryName;
  final categoryImage;

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  Future<List<CourseModel>> readJsonData() async {
    final jsonData = await root_bundle.rootBundle
        .loadString("assets/json/course_detail.json");

    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => CourseModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            backgroundColor: AppColors.white,
            iconTheme: const IconThemeData(color: AppColors.blue800),
            title: Text(
              categoryName,
              style: AppTypography.highlightText(context)
                  ?.copyWith(color: AppColors.blue800),
            ),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: AppBarWidget(
                catergoryName: categoryName,
                categoryImage: categoryImage,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Buscar por categoria:",),
                  SizedBox(
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: const [
                                Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Marketing Digital"),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Gestão Financeira"),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Idiomas"),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Plano de Negócios"),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Gestão de Estoque"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Com base nas categorias seguidas:", style: AppTypography.highlightText(context)!.copyWith(fontSize: 18),),
                ),
                FutureBuilder(
                  future: readJsonData(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Text("${data.error}");
                    }
                    if (data.hasData) {
                      var items = data.data as List<CourseModel>;
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseDetailPage(
                                    courseModel: items[index],
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      SizedBox(
                                        height: 220,
                                        width: double.infinity,
                                        child: SvgPicture.asset(items[index].courseUrl.toString()),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        right: 8,
                                        child: Card(
                                          elevation: 0,
                                            color: AppColors.blue300,
                                            child:
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text("${random(5, 16)} horas", style: AppTypography.subText(context)!.copyWith(color: AppColors.white),),
                                                )),
                                      ),
                                    ],
                                  ),
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          items[index].authorUrl.toString()),
                                    ),
                                    title: Text(
                                      "${items[index].courseName.toString()}",
                                      style: AppTypography.highlightText(context),
                                    ),
                                    subtitle: Text(
                                      items[index].author.toString(),
                                      style: AppTypography.subText(context),
                                    ),
                                    trailing: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("${items[index].duration.toString()} aulas", style: AppTypography.subText(context),),
                                        Text("R\$${items[index].price.toString()}.00", style: AppTypography.bodyText(context),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
