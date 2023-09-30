import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_app_bar.dart';
import 'featured_book_list_view.dart';
import 'newest_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 15, left: 30, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(
                  height: 20,
                ),
                FeaturedBookListView(),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 5),
                  child: Text(
                    "Newest",
                    style: Styles.textStyle18,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: NewestBookListView(),
          ),
        )
      ],
    );
  }
}
