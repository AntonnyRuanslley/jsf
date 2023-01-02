import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsf/controllers/data_controller.dart';
import 'package:jsf/routes/routes_names.dart';
import 'package:jsf/themes/custom_button.dart';
import 'package:jsf/themes/my_themes.dart';
import 'package:jsf/utils/size_screen.dart';
import 'package:jsf/widget/contentPage/custom_tile.dart';

class QuizPage extends StatefulWidget {
  final String fileName;
  const QuizPage({
    super.key,
    required this.fileName,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, bool?>> quizResponses = [];
  responseQuest(Map<String, bool?> response) {
    quizResponses.forEach((questResponse) {
      if (questResponse.keys.toString() == response.keys.toString()) {
        setState(() {
          questResponse.update(
            questResponse.keys.first,
            (value) => response.values.first,
          );
        });
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.of(context).background,
      body: Container(
        padding: EdgeInsets.only(
          left: 15,
          top: SizeScreen.getDeviceStatucBarHeight(context) + 10,
          right: 15,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF7DFEF),
              MyThemes.of(context).background,
            ],
            stops: const [0, 1],
            begin: const AlignmentDirectional(1, -1),
            end: const AlignmentDirectional(-1, 1),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: SizeScreen.getDeviceWidth(context),
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: MyThemes.of(context).primaryColor,
                      size: 25,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: AutoSizeText(
                      "Voltar",
                      style: MyThemes.of(context).title1,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<Map<String, dynamic>>(
                future: quizResponses.isEmpty
                    ? DataController.loadAsset(widget.fileName)
                    : null,
                builder: (context, snapshot) {
                  if (!snapshot.hasData && quizResponses.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: MyThemes.of(context).primaryColor,
                      ),
                    );
                  }
                  if (snapshot.hasData && quizResponses.isEmpty) {
                    snapshot.data!.forEach((key, value) {
                      if (key != "title") {
                        quizResponses.add({key: null});
                      }
                    });
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: snapshot.data!.entries.map((entry) {
                            final i = quizResponses.indexWhere(
                              (response) =>
                                  response.entries.first.key == entry.key,
                            );

                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTile(
                                content: entry,
                                responseQuest: i != -1 ? responseQuest : null,
                                quizResponses:
                                    i != -1 ? quizResponses[i] : null,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 15),
                        ButtonWidget(
                          text: 'Calcular',
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
                          onPressed: () {
                            final answerCorrection = [...quizResponses];
                            answerCorrection.removeWhere((response) =>
                                !(response.entries.first.value ?? false));
                            print(answerCorrection.length >= 5);
                            Get.toNamed(
                              RoutesNames.contentPage,
                              arguments: answerCorrection.length >= 5
                                  ? "quiz_response1.txt"
                                  : "quiz_response2.txt",
                            );
                          },
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
