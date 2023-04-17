import 'dart:math';

import 'package:bnv/core/theme/app_colors.dart';
import 'package:bnv/core/theme/app_typography.dart';
import 'package:bnv/models/service_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceDetailPage extends StatelessWidget {
  const ServiceDetailPage({Key? key, required this.serviceModel})
      : super(key: key);

  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.blue800,
            pinned: true,
            iconTheme: const IconThemeData(color: AppColors.white),
            expandedHeight: 300,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.bookmark_border),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppColors.blue500,
                child: Center(
                  child: SvgPicture.asset(
                    serviceModel.serviceUrl.toString(),
                    height: 200,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(color: AppColors.white),
              height: MediaQuery.of(context).size.height - 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 1000,
                      child: Column(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  serviceModel.serviceName.toString(),
                                  style: AppTypography.highlightText(context)!
                                      .copyWith(fontSize: 32),
                                ),
                                subtitle: Text(
                                  serviceModel.serviceDescription.toString(),
                                  style: AppTypography.bodyText(context),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      serviceModel.authorUrl.toString())),
                              title: Text(
                                serviceModel.author.toString(),
                                style: AppTypography.highlightText(context),
                              ),
                              trailing: Text("Seguir",
                                  style: AppTypography.bodyText(context)!
                                      .copyWith(color: AppColors.blue300)),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Column(
                                children: [
                                  Text(
                                    "Benefícios",
                                    style: AppTypography.highlightText(context),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            serviceModel.benefits?.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            horizontalTitleGap: 0,
                                            leading: Icon(Icons.check),
                                            title: Text(
                                                serviceModel.benefits![index]
                                                    .toString(),
                                                style: AppTypography.bodyText(
                                                    context)),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.blue300,
                                    ),
                                    Text(
                                      "4.${random(0, 9)}",
                                      style: AppTypography.bodyText(context)!
                                          .copyWith(color: AppColors.blue300),
                                    )
                                  ],
                                ),
                                Text(
                                  "R\$${serviceModel.price.toString()}.00",
                                  style: AppTypography.highlightText(context),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  random(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}
