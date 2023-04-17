import 'dart:convert';

import 'package:bnv/core/theme/app_colors.dart';
import 'package:bnv/core/theme/app_typography.dart';
import 'package:bnv/features/search/pages/service_detail_page.dart';
import 'package:bnv/models/service_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:flutter_svg/svg.dart';

import 'app_bar_widget.dart';

class ServiceCategoryCardWidget extends StatelessWidget {
  ServiceCategoryCardWidget({Key? key}) : super(key: key);

  final categoryName = "Serviços";
  final categoryImage = "assets/svg/service.svg";

  @override
  Widget build(BuildContext context) {
    return ServiceResultList(categoryName: categoryName, categoryImage: categoryImage,);
  }
}

class ServiceResultList extends StatelessWidget {
  const ServiceResultList({super.key, required this.categoryName, required this.categoryImage});

  final categoryName;
  final categoryImage;

  Future<List<ServiceModel>> readJsonData() async {
    final jsonData = await root_bundle.rootBundle
        .loadString("assets/json/service_detail.json");

    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => ServiceModel.fromJson(e)).toList();
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
                                      child: Text("Fonoaudióloga"),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Psicólogo"),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Ginástica Laboral"),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Departamento Pessoal"),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Contabilidade"),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Administrativo"),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Marketing"),
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
                      var items = data.data as List<ServiceModel>;
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          var plans = items[index].benefits;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ServiceDetailPage(
                                    serviceModel: items[index],
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
                                        child: SvgPicture.asset(items[index].serviceUrl.toString()),
                                      ),
                                    ],
                                  ),
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: AssetImage(items[index].authorUrl.toString()),
                                    ),
                                    title: Text(
                                      "${items[index].serviceName.toString()}",
                                      style: AppTypography.highlightText(context),
                                    ),
                                    subtitle: Text(
                                      items[index].author.toString(),
                                      style: AppTypography.subText(context),
                                    ),
                                    trailing: Text("R\$${items[index].price.toString()}.00", style: AppTypography.bodyText(context),),
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
