import 'package:cheni/services/Navigation.service.dart';
import 'package:provider/provider.dart';
import 'package:cheni/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationService()),
      ],
      child: const IdealApp(),
    ),
  );
}

class IdealApp extends StatefulWidget {
  const IdealApp({super.key});

  @override
  State<IdealApp> createState() => _IdealAppState();
}

class _IdealAppState extends State<IdealApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      // locale: Locale(localeService.currentLocaleEnum.label),
      title: 'ideal',
      theme: ThemeData(
        fontFamily: 'Barlow',
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Barlow',
            ),
        // colorScheme:
        //     ColorScheme.fromSeed(seedColor: TamamColors().background.seeder),
        // useMaterial3: true,
      ),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      home: const Routing(),
    );
  }
}
