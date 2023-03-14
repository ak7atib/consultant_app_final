import 'package:consultant_app_final/providers/language_providers.dart';
import 'package:consultant_app_final/sharedPrefernces/shared_pref_controller.dart';
import 'package:consultant_app_final/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model_view/AuthApi.dart';
import 'model_view/CategoriesApi.dart';
import 'model_view/MailsApi.dart';
import 'model_view/SenderApi.dart';
import 'model_view/StatusApi.dart';
import 'model_view/TagsApi.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // this line to force app to run awaits statements(in our case sharedPreferences) before run runApp function
  await SharedPrefController().initSharedPreferences();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<Auth>(
        create: (BuildContext context) => Auth(),
      ),
      ChangeNotifierProvider<CategoriesApi>(
        create: (BuildContext context) => CategoriesApi(),
      ),
      ChangeNotifierProvider<MailsApi>(
        create: (BuildContext context) => MailsApi(),
      ),
      ChangeNotifierProvider<SenderApi>(
        create: (BuildContext context) => SenderApi(),
      ),
      ChangeNotifierProvider<StatusApi>(
        create: (BuildContext context) => StatusApi(),
      ),
      ChangeNotifierProvider<TagsApi>(
        create: (BuildContext context) => TagsApi(),
      ),
      ChangeNotifierProvider<LanguageProvider>(
          create: (context) => LanguageProvider())
    ], child: MyMaterialApp());
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.tajawal().fontFamily,
        primarySwatch: Colors.purple,
      ),

      locale: Locale(Provider.of<LanguageProvider>(context).language),
      // onGenerateRoute: RouteGenerator.getRoute,
      // initialRoute: Routes.splashRoute,
      home: Splash(),
    );
  }
}
