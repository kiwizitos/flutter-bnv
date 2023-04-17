import 'package:bnv/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

import 'package:bnv/core/theme/app_colors.dart';

import 'pages/widgets/course_category_card_widget.dart';
import 'pages/widgets/service_category_card_widget.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Icon searchIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text("Pesquisa");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const TabBar(
              tabs: [Tab(text: "Cursos"), Tab(text: "Serviços")],
              labelColor: AppColors.black,
              unselectedLabelColor: AppColors.blue100,
              indicatorColor: AppColors.blue800,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: TabBarView(
            children: [CourseCategoryCardWidget(), ServiceCategoryCardWidget()],
          ),
        ));
  }
}
