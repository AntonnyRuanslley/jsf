import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jsf/controllers/data_controller.dart';
import 'package:jsf/themes/my_themes.dart';
import 'package:jsf/utils/size_screen.dart';
import 'package:jsf/widget/contentPage/custom_tile.dart';

class ContentPage extends StatelessWidget {
  final String fileName;
  final String? quiz;
  const ContentPage({
    super.key,
    required this.fileName,
    this.quiz,
  });

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
                future: DataController.loadAsset(fileName),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: MyThemes.of(context).primaryColor,
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: snapshot.data!.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomTile(content: entry),
                        );
                      }).toList(),
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
