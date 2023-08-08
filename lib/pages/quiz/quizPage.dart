import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizapp/controller/questionController.dart';
import 'package:quizapp/pages/quiz/Components/body.dart';

import '../../constants.dart';
class quizPage extends StatelessWidget {
  const quizPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _controller= Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ElevatedButton(style: ElevatedButton.styleFrom(
            backgroundColor: transparentColor,elevation: 0
          ),onPressed: _controller.nextQuestion, child: Text('Skip'))
        ],

      ),
      body:  body(),
    );
  }
}

