import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quizapp/controller/questionController.dart';

import '../../../constants.dart';
class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white),
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          print(controller.animation.value);
          return Stack(
            children: [
              LayoutBuilder(builder: (context,constraints) =>Container(
                width: constraints.maxWidth * controller.animation.value,
                decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50)
                ),
              ) ,
              ),
              Positioned.fill(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${(controller.animation.value * 40).round()} sec'),
                    Image.asset('assets/images/time.png',color: Colors.white,),
                  ],
                ),
              ))
            ],
          );
        }
      ),
    );
  }
}

