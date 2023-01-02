import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsf/routes/routes_names.dart';
import 'package:jsf/themes/my_themes.dart';
import 'package:jsf/utils/size_screen.dart';

class CustomSelect extends StatelessWidget {
  final String title;
  final Widget image;
  final String? nameFile;
  final String? quizFile;
  final double? elevation;
  final Color? colorButton;
  final Color? colorFont;
  const CustomSelect({
    super.key,
    required this.title,
    required this.image,
    this.nameFile,
    this.elevation = 5,
    this.quizFile,
    this.colorButton = const Color(0xFFF1F4F8),
    this.colorFont,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Material(
        elevation: elevation!,
        color: colorButton,
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Container(
            height: SizeScreen.getDeviceHeight(context) * 0.055,
            width: SizeScreen.getDeviceWidth(context) * 0.15,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: image,
          ),
          iconColor: Theme.of(context).colorScheme.primary,
          title: AutoSizeText(
            title,
            style: MyThemes.of(context).title2.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorFont,
                ),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            if (nameFile != null) {
              Get.toNamed(
                RoutesNames.contentPage,
                arguments: nameFile,
              );
            } else {
              Get.toNamed(
                RoutesNames.quizPage,
                arguments: quizFile,
              );
            }
          },
        ),
      ),
    );
  }
}
