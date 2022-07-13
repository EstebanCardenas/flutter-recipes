import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/core/controllers/controllers.dart';
import 'package:recipes/ui/view/view.dart';

void main() {
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({Key? key}) : super(key: key);

  static final Map<String, Widget> routes = {
    StartView.route: const StartView(),
    DashboardView.route: const DashboardView(),
  };

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<DashboardController>(
          create: (_) => DashboardController(),
        ),
      ],
      child: MaterialApp(
        routes: routes.map<String, Widget Function(BuildContext)>(
          (k, v) => MapEntry(k, (_) => v),
        ),
        initialRoute: '/',
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFFE23E3E),
            secondary: Color(0xFFFFB661),
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
