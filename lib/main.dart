import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/Home/data/repo/home_repo_implement.dart';
import 'package:bookly_app/features/Home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/Home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/app_router.dart';
import 'core/utils/cache_helper.dart';

void main() async {
  setUpServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init(); // Initialize CacheHelper

  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchFeaturedBooks()),
        BlocProvider(
            create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchNewestBooks()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color(0xff100B20),
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
