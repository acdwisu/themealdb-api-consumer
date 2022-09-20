import 'package:core/common/instance.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_explore/presentation/blocs/meal/meal_explore_bloc.dart';
import 'package:meal_explore/presentation/pages/categories/main.dart';
import 'package:provider/provider.dart';

import 'injection.dart';

void runner(bool prod) async {
  production = prod;

  WidgetsFlutterBinding.ensureInitialized();

  initInjection();

  runApp(
    production? const MainApp() : DevicePreview(
      builder: (context) => const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<MealExploreBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: !production,
        useInheritedMediaQuery: true,
        locale: production? null : DevicePreview.locale(context),
        builder: production? null : DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const MealCategoriesPage(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
