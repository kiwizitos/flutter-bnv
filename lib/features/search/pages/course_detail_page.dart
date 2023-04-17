import 'dart:math';

import 'package:bnv/core/theme/app_colors.dart';
import 'package:bnv/core/theme/app_typography.dart';
import 'package:bnv/models/course_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({Key? key, required this.courseModel})
      : super(key: key);
  final CourseModel courseModel;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
              child: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      widget.courseModel.courseUrl.toString(),
                      height: 200,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const Center(
                      child: Icon(
                    Icons.play_arrow,
                    color: AppColors.white,
                    size: 64,
                  ))
                ],
              ),
            )),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(color: AppColors.white),
              height: MediaQuery.of(context).size.height - 80,
              child: Column(
                children: [
                  TabBar(
                    labelColor: AppColors.black,
                    unselectedLabelColor: AppColors.blue100,
                    indicatorColor: AppColors.blue800,
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'Detalhes',
                      ),
                      Tab(
                        text: 'Vídeos',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        SizedBox(
                          height: 1000,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        title: Text(
                                          widget.courseModel.courseName.toString(),
                                          style:
                                              AppTypography.highlightText(context)!
                                                  .copyWith(fontSize: 32),
                                        ),
                                        trailing: Text(
                                          "${widget.courseModel.duration.toString()} aulas",
                                          style: AppTypography.bodyText(context),
                                        ),
                                        subtitle: Text(
                                          widget.courseModel.courseDescription
                                              .toString(),
                                          style: AppTypography.bodyText(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                          backgroundImage: AssetImage(widget
                                              .courseModel.authorUrl
                                              .toString())),
                                      title: Text(
                                        widget.courseModel.author.toString(),
                                        style: AppTypography.highlightText(context),
                                      ),
                                      trailing: Text("Seguir",
                                          style:
                                              AppTypography.bodyText(context)!
                                                  .copyWith(
                                                      color: AppColors.blue300)),
                                    ),
                                  ),
                                ],
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
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "R\$${widget.courseModel.price.toString()}.00",
                                      style: AppTypography.highlightText(context),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.courseModel.lessons?.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  "${index + 1}. ${widget.courseModel.lessons![index].toString()}",
                                  style: AppTypography.bodyText(context),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  random(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}
