import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/controller/questionController.dart';
import 'package:quizapp/models/questions.dart';
import 'package:quizapp/pages/quiz/Components/progressbar.dart';
import 'package:quizapp/pages/quiz/Components/questionCard.dart';

import 'options.dart';
 class body extends StatelessWidget {
   const body({super.key});

   @override
   Widget build(BuildContext context) {
     QuestionController _questioncontroller=Get.put(QuestionController());
     return Stack(
       children: [
         Image.asset('assets/images/bkg.png'),
         SafeArea(child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                 children:  [
                   const Padding(
                     padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                     child: ProgressBar(),
                   ),
                   const SizedBox(height: kDefaultPadding,),
                    Padding(
                     padding:  const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                     child: Obx(() =>  Text.rich(TextSpan(
                       text:  "Question ${_questioncontroller.questionNumber.value}",style: TextStyle(
                         color: kSecondaryColor,fontSize: 26
                     ),
                       children: [
                         TextSpan(
                             text: '/${_questioncontroller.questions.length}',
                             style: TextStyle(color: kSecondaryColor,fontSize: 19)
                         )
                       ],
                     ),)
                     ),
                   ),
                   const Divider(thickness: 1.4,),
                   const SizedBox(height: kDefaultPadding,),
                    SizedBox(
                      height: 450,
                      child: PageView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        // controller: _questioncontroller.pageController,
                        onPageChanged: _questioncontroller.updateTheOnNum,
                        itemCount: _questioncontroller.questions.length,
                        itemBuilder: (context, index) => questionCard(
                          question: _questioncontroller.questions[index],
                        ),
                      ),
                    ),
                 ],
               ),
             )
           ],
         ))
       ],
     );
   }
 }
