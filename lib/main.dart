import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Icon right = Icon(
    Icons.check,
    color: Colors.green,
  );

  Icon wrong = Icon(
    Icons.close,
    color: Colors.red,
  );

  List<Icon> scoreKeeper = [];

  int score = 0;

  bool isQuizFinished = false;

  void setScore(bool userAnswer) {
    if (userAnswer == quizBrain.getQuestionAnswer()) {
      scoreKeeper.add(right);
      score++;
    } else {
      scoreKeeper.add(wrong);
    }
  }

  void resetScore() {
    scoreKeeper = [];
    score = 0;
  }

  void restartQuiz() {
    setState(() {
      resetScore();
      quizBrain.resetQuestionIndex();
      isQuizFinished = false;
    });
  }

  void showFinishAlert(context) {
    Alert(
      context: context,
      title: "You got it!",
      desc: "Very good! Your score was $score.",
      buttons: [
        DialogButton(
          color: Colors.green,
          radius: BorderRadius.all(Radius.circular(0.0)),
          child: Text(
            "Do it again!",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            restartQuiz();
            Navigator.pop(context);
          },
          width: 160,
        )
      ],
    ).show();
  }

  void handleUserAnswer(bool userAnswer) {
    setState(() {
      if (isQuizFinished) {
        showFinishAlert(context);
      } else {
        setScore(userAnswer);

        bool isLastQuestion = quizBrain.checkIfIsLastQuestion();

        if (isLastQuestion) {
          isQuizFinished = isLastQuestion;
          showFinishAlert(context);
        } else {
          quizBrain.setNextQuestion();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionHeading(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => handleUserAnswer(true),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => handleUserAnswer(false),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
