import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quizapp/models/questions.dart';
import 'package:quizapp/pages/score/scorePage.dart';


class QuestionController extends GetxController with SingleGetTickerProviderMixin  {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;

   late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data.map(
        (question) => Question(
        id: question['id'],
        question: question['question'],
        options: question['options'],
        answer: question['answer_index']),
  ).toList();


  List<Question> get questions => this._questions;
  bool _isAnswered=false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns=> this._correctAns;

  late int _selectAns;
  int get selectAns=> this._selectAns;

  RxInt _questionNumber=1.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _numOfCorrectAns=0;
  int get numOfCorrectAns => this._numOfCorrectAns;
  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();



    // List<Question> get questions => this._questions;

    super.onInit();
  }

  void onClose(){
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectIndex){
    _isAnswered=true;
    _correctAns=question.answer;
    _selectAns=selectIndex;

    if(_correctAns==_selectAns) _numOfCorrectAns++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 5),(){
      nextQuestion();
    });
  }

  void nextQuestion(){
    if(_questionNumber.value!=_questions.length){
      _isAnswered=false;
      _pageController.nextPage(duration: Duration(milliseconds: 270), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    }else{
      Get.to(scorePage());
    }

  }

  void updateTheOnNum(int index){
    _questionNumber.value=index+1;
  }
}
