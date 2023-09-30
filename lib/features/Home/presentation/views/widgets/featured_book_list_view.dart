import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator_widget.dart';
import 'package:bookly_app/features/Home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'custom_book_image.dart';


class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                itemCount: state.books.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push("/bookDetailsView",
                            extra: state.books[index]);
                      },
                      child: CustomBookImage(
                        imageUrl: state.books[index].volumeInfo.imageLinks!
                                .thumbnail ??
                            "",
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksError) {
          return CustomErrorWidget(errMessage: state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
