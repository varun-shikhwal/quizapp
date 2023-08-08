import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quizapp/controller/questionController.dart';

import '../../../constants.dart';
class Options extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback press;
  const Options({super.key,
  required this.text,
  required this.index,
  required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder:(qnController)
    {

      Color getTheRightcolor(){
        if(qnController.isAnswered){
          if(index==qnController.correctAns){
            return kGreenColor;
          }else if(index==qnController.selectAns && qnController.selectAns!=qnController.correctAns){
            return kRedColor;
          }
        }
        return kGrayColor;
      }
      IconData getTheRightIcon(){
        return getTheRightcolor()==kRedColor?Icons.close:Icons.done;
      }
      return InkWell(
        onTap: press,
        child: Container(
          margin: EdgeInsets.only(top: kDefaultPadding),
          padding: EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: getTheRightcolor()),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${index + 1} $text", style: TextStyle(
                  color: getTheRightcolor(), fontSize: 17
              ),
              ),
              Container(
                height: 27,
                width: 27,
                decoration: BoxDecoration(
                  color: getTheRightcolor() == kGrayColor
                    ? Colors.transparent
                    : getTheRightcolor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getTheRightcolor())
                ),
                child:getTheRightcolor()==kGrayColor
                    ?null
                    : Icon(getTheRightIcon(),
                       size: 17,),
              )
            ],
          ),
        ),
      );
     },
    );
  }
}
