import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionIndex = 0;

  List<Question> _questionBank = [
    Question(
      heading: 'Some cats are actually allergic to humans',
      answer: true,
    ),
    Question(
      heading: 'You can lead a cow down stairs but not up stairs.',
      answer: false,
    ),
    Question(
      heading: 'Approximately one quarter of human bones are in the feet.',
      answer: true,
    ),
    Question(
      heading: 'A slug\'s blood is green.',
      answer: true,
    ),
    Question(
      heading: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
      answer: true,
    ),
    Question(
      heading: 'It is illegal to pee in the Ocean in Portugal.',
      answer: true,
    ),
    Question(
      heading:
          'No piece of square dry paper can be folded in half more than 7 times.',
      answer: false,
    ),
    Question(
      heading:
          'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      answer: true,
    ),
    Question(
      heading:
          'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      answer: false,
    ),
    Question(
      heading:
          'The total surface area of two human lungs is approximately 70 square metres.',
      answer: true,
    ),
    Question(
      heading: 'Google was originally called \"Backrub\".',
      answer: true,
    ),
    Question(
      heading:
          'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      answer: true,
    ),
    Question(
      heading:
          'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      answer: true,
    ),
  ];

  String getQuestionHeading() {
    return _questionBank[_questionIndex].heading;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionIndex].answer;
  }

  bool _checkIfCanGetNextQuestion() {
    return _questionIndex < _questionBank.length - 1;
  }

  void setNextQuestion() {
    if (_checkIfCanGetNextQuestion()) _questionIndex++;
  }

  bool checkIfIsLastQuestion() {
    return _questionIndex == _questionBank.length - 1;
  }

  void resetQuestionIndex() {
    _questionIndex = 0;
  }
}
