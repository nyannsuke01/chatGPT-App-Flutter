import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/utils/routes_manager.dart';
import '../features/02_image_generation/presentation/cubit/image_generation_cubit.dart';
import '../features/03_text_completion/presentation/cubit/text_completion_cubit.dart';
import 'di.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ImageGenerationCubit>(
            create: (_) => instance<ImageGenerationCubit>(),
          ),
          BlocProvider<TextCompletionCubit>(
            create: (_) => instance<TextCompletionCubit>(),
          ),
        ],
        child: MaterialApp(
          // ローカライゼーション
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // サポート言語
          supportedLocales: const [
            Locale('ja', ''), //日本語
            Locale('en', ''), //英語
          ],

          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashRoute,
        ));
  }
}
