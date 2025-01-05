import 'package:cheni/core/domains/documents/Document.service.dart';
import 'package:cheni/environment.dart';
import 'package:cheni/core/services/Navigation.service.dart';
import 'package:cheni/core/services/Permission.service.dart';
import 'package:cheni/core/services/PushNotification.service.dart';
import 'package:cheni/core/services/Translation.service.dart';
import 'package:cheni/screens/widgets/generic/AsyncInitWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:cheni/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  if (environment["USE_SIMULATOR"] != true && !kIsWeb) {
    if (Firebase.apps.isEmpty) {
      WidgetsFlutterBinding.ensureInitialized();
      await PermissionService().requestPushNotificationPermission();
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: environment["FIREBASE_MESSAGING_API_KEY"] as String,
          appId: environment["FIREBASE_MESSAGING_APP_ID"] as String,
          messagingSenderId:
              environment["FIREBASE_MESSAGING_SENDER_ID"] as String,
          projectId: environment["FIREBASE_MESSAGING_PROJECT_ID"] as String,
        ),
      );
      PushNotificationService().init();
      PushNotificationService().getToken();
    }
  }

  await initializeDateFormatting();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationService()),
        ChangeNotifierProvider(create: (context) => TranslationService()),
        ChangeNotifierProvider(create: (context) => DocumentService()),
      ],
      child: const SafeArea(child: CheniApp()),
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
        child: const Scaffold(body: Routing()),
      ),
    );
  }
}
