class Question{
  final String questiontext;
  final List<Answer> answerlist;

  Question(this.questiontext , this.answerlist);
}

class Answer{
  final String answertext;
  final bool iscorrect;

  Answer(this.answertext , this.iscorrect);
}

List<Question> getquestions() {
  List<Question> list = [
        Question("who is the owner of flutter ??",
    [
      Answer("nokia", false),
      Answer("samsung", false),
      Answer("google", true),
      Answer("apple", false)
    ]),
  Question(
    'What is the largest planet in our solar system?', [
      Answer('Earth', false),
      Answer('Saturn', false),
      Answer('Jupiter', true),
      Answer('Uranus', false),
    ],
  ),
  Question(
    'What is the smallest planet in our solar system?', [
      Answer('Mercury', true),
      Answer('Mars', false),
      Answer('Venus', false),
      Answer('Earth', false),
    ],
  ),
  Question(
    'What is the chemical symbol for gold?', [
      Answer('Ag', false),
      Answer('Au', true),
      Answer('Hg', false),
      Answer('Pb', false),
    ],
  ),
  Question(
    'What is the chemical symbol for silver?', [
      Answer('Au', false),
      Answer('Ag', true),
      Answer('Hg', false),
      Answer('Pb', false),
    ],
  ),
  ] ;
  // list.add(

  // );
return list;
}