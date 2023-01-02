import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jsf/themes/my_themes.dart';
import 'package:jsf/utils/size_screen.dart';
import 'package:jsf/widget/homePage/custom_select.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.of(context).background,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyThemes.of(context).background,
              Color(0xFFF8E4C4),
            ],
            stops: const [0, 1],
            begin: const AlignmentDirectional(1, -1),
            end: const AlignmentDirectional(-1, 1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeScreen.getDeviceStatucBarHeight(context) + 20,
            ),
            Center(
              child: Container(
                height: SizeScreen.getDeviceHeight(context) * 0.25,
                width: SizeScreen.getDeviceWidth(context) * 0.5,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Image.asset(
                  'assets/images/icon_app.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomSelect(
                        title: "Aids",
                        nameFile: "aids.txt",
                        image: SvgPicture.asset(
                          "assets/images/aids_illustration.svg",
                          fit: BoxFit.contain,
                          color: Color(0xFFe74424),
                        ),
                      ),
                      CustomSelect(
                        title: "Endometriose",
                        nameFile: "endometriose.txt",
                        image: SvgPicture.asset(
                          "assets/images/endometriose_illustration.svg",
                          fit: BoxFit.contain,
                          color: Color(0xFFea7979),
                        ),
                      ),
                      CustomSelect(
                        title: "Câncer de mama",
                        nameFile: "cancer_de_mama.txt",
                        image: SvgPicture.asset(
                          "assets/images/aids_illustration.svg",
                          fit: BoxFit.contain,
                          color: Color(0xFFd8357a),
                        ),
                      ),
                      CustomSelect(
                        title: "Sindrome do ovário policístico",
                        nameFile: "sindrome_do_ovario_policistico.txt",
                        image: SvgPicture.asset(
                          "assets/images/endometriose_illustration.svg",
                          fit: BoxFit.contain,
                          color: Color(0xFFe97474),
                        ),
                      ),
                      CustomSelect(
                        title: "Anticoncepcionais gratuitos",
                        nameFile: "anticoncepcionais_gratuitos.txt",
                        image: SvgPicture.asset(
                          "assets/images/condom_illustration.svg",
                          fit: BoxFit.contain,
                          color: MyThemes.of(context).primaryColor,
                        ),
                      ),
                      CustomSelect(
                        title: "Saúde íntima",
                        nameFile: "saude_intima.txt",
                        image: Icon(FontAwesomeIcons.soap),
                      ),
                      CustomSelect(
                        title: "Integrantes desse projeto",
                        nameFile: "integrantes_do_grupo.txt",
                        image: Icon(FontAwesomeIcons.users),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
