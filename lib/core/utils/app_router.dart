import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/Home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/Home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_implementation.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/search/presentation/views_models/search_books_cubit/search_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/Home/data/repo/home_repo_implement.dart';
import '../../features/Home/presentation/views/home_view.dart';
import '../../features/Splash/presentation/views/splash_view.dart';
import '../models/BookModel.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const SplashView()),
      GoRoute(
          path: "/searchView",
          builder: (context, state) => BlocProvider(
              create: (context) =>
                  SearchBooksCubit(getIt.get<SearchRepoImpl>()),
              child: const SearchView())),
      GoRoute(path: "/homeView", builder: (context, state) => const HomeView()),
      GoRoute(
          path: "/bookDetailsView",
          builder: (context, state) => BlocProvider(
              create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
              child: BookDetailsView(
                bookModel: state.extra as BookModel,
              ))),
    ],
  );
}
