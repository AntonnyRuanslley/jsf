import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsf/routes/routes_names.dart';
import 'package:jsf/themes/custom_button.dart';
import 'package:jsf/themes/my_themes.dart';
import 'package:jsf/utils/size_screen.dart';

class CustomTile extends StatelessWidget {
  final MapEntry<String, dynamic> content;
  final Map<String, bool?>? quizResponses;
  final Function(Map<String, bool>)? responseQuest;
  const CustomTile({
    super.key,
    required this.content,
    this.quizResponses,
    this.responseQuest,
  });

  @override
  Widget build(BuildContext context) {
    if (content.key.contains("subtitle")) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              content.value.toString(),
              style: MyThemes.of(context).subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      );
    }

    if (content.key.contains("title")) {
      return Text(
        content.value.toString(),
        style: MyThemes.of(context).title1,
        textAlign: TextAlign.justify,
      );
    }

    if (content.key.contains("font")) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  content.value.toString(),
                  style: MyThemes.of(context).subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      );
    }

    if (content.key.contains("quiz")) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(
            horizontal: SizeScreen.getDeviceWidth(context) * 0.2),
        child: ButtonWidget(
          text: 'Teste de sintomas',
          options: ButtonOptions(
            width: double.infinity,
            height: 45,
            color: MyThemes.of(context).primaryColor,
            textStyle: MyThemes.of(context).subtitle2.copyWith(
                  color: MyThemes.of(context).terciaryColor,
                  fontWeight: FontWeight.w300,
                ),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          icon: Icon(
            Icons.quiz,
            color: MyThemes.of(context).terciaryColor,
            size: 30,
          ),
          onPressed: () {
            Get.toNamed(
              RoutesNames.quizPage,
              arguments: content.value,
            );
          },
        ),
      );
    }

    if (content.key.contains("quest")) {
      final boolresponseQuest = quizResponses!.values.first;
      return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              content.value.toString(),
              style: MyThemes.of(context).subtitle2,
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: boolresponseQuest != null && boolresponseQuest
                    ? null
                    : () => responseQuest!({content.key: true}),
                child: Text("Sim"),
              ),
              SizedBox(width: 25),
              ElevatedButton(
                onPressed: boolresponseQuest != null && !boolresponseQuest
                    ? null
                    : () => responseQuest!({content.key: false}),
                child: Text("Não"),
              ),
            ],
          )
        ],
      );
    }

    if (content.key.contains("image")) {
      return SizedBox(
        height: SizeScreen.getDeviceHeight(context) * 0.3,
        width: double.infinity,
        child: Image.asset(
          content.value.toString(),
          fit: BoxFit.contain,
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            content.value.toString(),
            style: MyThemes.of(context).subtitle2,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
