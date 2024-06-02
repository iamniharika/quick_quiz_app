// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:weather_app/question_model.dart';


void main(){
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: quizscreen(),
    );
  }

}
class quizscreen extends StatefulWidget{
  @override
  State<quizscreen> createState() => _quizscreenState();
}

class _quizscreenState extends State<quizscreen> {

List<Question> questionlist = getquestions();
int currentquestionindex = 0;
int score = 0;
Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text("Quick Quiz !!")),
      ),
      body:  Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
            _questionwidget(),
            _answerlist(),
            _nextbutton()
          ],
          )
          
        )
        
          
      )
    );
  }
  
  _questionwidget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("question ${currentquestionindex+1}/${questionlist.length.toString()}" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            color: Colors.pink.shade300,
            child: Center(child: Text(questionlist[currentquestionindex].questiontext , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: Colors.black),)),
          ),
        )
      ],
    );
  }
  
  _answerlist() {
    return Column(
      children: 
        questionlist[currentquestionindex].answerlist.map((e) => answerbutton(e)).toList(),
    );
  }
  
  Widget answerbutton(Answer answer) {
    bool isselected = answer==selectedAnswer;
    return Container(
      width:  double.infinity,
      height: 45,
      margin: EdgeInsets.all(10),
      child:  ElevatedButton(
            onPressed: (){
              if (selectedAnswer==null) {
                if(answer.iscorrect){
                  score++;
                }
                 setState(() {
              selectedAnswer = answer;
            });
              }
           
            }, 
             style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.cyan,
                    padding:  EdgeInsets.all(20),
                    backgroundColor: isselected?Colors.pink.shade400:Colors.cyan.shade300,
                    // onPrimary: Colors.cyan,
                    ),

            child: Text(answer.answertext , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: Colors.black),),
            ),
      
    );
      
    
  }
  
  _nextbutton(){
    bool islastquestion = false;
    if(currentquestionindex == questionlist.length -1){
      islastquestion = true;
    }
     return Container(
      width:  double.infinity,
      height: 45,
      margin: EdgeInsets.all(90),
      child:  ElevatedButton(
            onPressed: (){
              if(islastquestion){
                showDialog(context: context, builder: (_)=> _showscoredialog());
              }else{
                setState(() {
                  selectedAnswer=null;
                  currentquestionindex++;
                });
              }
            }, 
             style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.cyan,
                    padding:  EdgeInsets.all(20),
                    backgroundColor: Colors.pink.shade400,
                    // onPrimary: Colors.cyan,
                    ),

            child: Text(islastquestion ? "submit" : "next" , style: TextStyle(fontSize: 16,color: Colors.black),),
            ),
      
    );
  }
   _showscoredialog(){
    return AlertDialog(title: Text("your score: ${score.toString()}"),
    content: ElevatedButton(onPressed: (){
      Navigator.pop(context);
      setState(() {
      currentquestionindex = 0;
      score = 0;
      selectedAnswer = null;
      });
    }  
    , child: Text("restart")),
    );
   }
}
