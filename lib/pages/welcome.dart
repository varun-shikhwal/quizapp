import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/pages/quiz/quizPage.dart';
class welcomePage extends StatelessWidget {
  const welcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Image.asset('assets/images/bkg.png',fit: BoxFit.cover,),
          SafeArea(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children:  [
                Spacer(flex: 2,),
                Text("Let's Play Quiz",style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
                ),),
                Text("Enter Your Informatin Below",style: TextStyle(
                  color: Colors.white,
                ),
                ),
                Spacer(),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
                    filled: true,
                    fillColor: Color(0xFF1C2341),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Get.to(()=>quizPage()),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(kDefaultPadding*0.75),
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Text("Lets Start Quiz",style: TextStyle(
                      color: Colors.black
                    ),)),
                  ),
                ),
                Spacer(flex: 2,),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

