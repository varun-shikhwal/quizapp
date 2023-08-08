import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants.dart';
import '../../../controller/questionController.dart';
import '../../../models/questions.dart';
import 'options.dart';
class questionCard extends StatelessWidget {
  const questionCard({super.key,required this.question});
  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller=Get.put(QuestionController());

    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),color: Colors.white
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: TextStyle(
              color: Colors.black,fontSize: 19
          ),
          ),
          SizedBox(height: kDefaultPadding/2,),
         ...List.generate(question.options.length, (index) => Options(
             text: question.options[index],
             index: index,
             press: () => _controller.checkAns(question, index),

         ))
        ],
      ),
    );
  }
}

