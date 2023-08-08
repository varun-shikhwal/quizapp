import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizapp/controller/questionController.dart';

import '../../constants.dart';

class scorePage extends StatelessWidget {
  const scorePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController=Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/bkg.png',fit: BoxFit.cover,),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: TextStyle(
                    fontSize: 47,
                    color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns*10}/${_qnController.questions.length*10}",
                style: TextStyle(
                    fontSize: 37,
                    color: kSecondaryColor),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}

