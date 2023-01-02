import 'package:get/get.dart';
import 'package:jsf/routes/routes_names.dart';
import 'package:jsf/view/home_page.dart';
import 'package:jsf/view/content_page.dart';
import 'package:jsf/view/quiz_page.dart';
import 'package:jsf/view/splash_page.dart';

class GetPagesRoute {
  static List<GetPage> pages = [
    GetPage(
      name: RoutesNames.splashPage,
      page: () => SplashPage(),
    ),
    GetPage(
      name: RoutesNames.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RoutesNames.contentPage,
      page: () {
        final String fileName = Get.arguments;
        return ContentPage(fileName: fileName);
      },
    ),
    GetPage(
      name: RoutesNames.quizPage,
      page: () {
        final String fileName = Get.arguments;
        return QuizPage(fileName: fileName);
      },
    ),
  ];
}
