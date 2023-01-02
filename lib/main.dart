import 'package:jsf/routes/get_page_route.dart';
import 'package:jsf/routes/routes_names.dart';
import 'package:jsf/services/singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  setupSingletonClasses();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      title: 'JSF - Juntas somos mais fortes',
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      getPages: GetPagesRoute.pages,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: RoutesNames.splashPage,
    );
  }
}
