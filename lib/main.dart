import 'package:cheni/services/Document.service.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Translation.service.dart';
import 'package:cheni/widgets/generic/AsyncInitWidget.dart';
import 'package:provider/provider.dart';
import 'package:cheni/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationService()),
        ChangeNotifierProvider(create: (context) => DocumentService()),
        ChangeNotifierProvider(create: (context) => TranslationService()),
      ],
      child: const CheniApp(),
    ),
  );
}

class CheniApp extends StatefulWidget {
  const CheniApp({super.key});

  @override
  State<CheniApp> createState() => _CheniAppState();
}

class _CheniAppState extends State<CheniApp> {
  @override
  Widget build(BuildContext context) {
    final translationService = context.read<TranslationService>();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      // locale: Locale(localeService.currentLocaleEnum.label),
      title: 'cheni',
      theme: ThemeData(
        fontFamily: 'Barlow',
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Barlow',
            ),
        // colorScheme:
        //     ColorScheme.fromSeed(seedColor: TamamColors().background.seeder),
        // useMaterial3: true,
      ),
      home: AsyncInitWidget(
        initFunction: () async {
          await translationService.init();
        },
        child: const Routing(),
      ),
    );
  }
}
