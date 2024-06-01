import 'package:dio/dio.dart';

Future<List<QuizModel>> QuizApi() async {
  Dio dio = Dio();
  Response response =
      await dio.get('https://6641ffc63d66a67b3435c0a8.mockapi.io/questions');
  print(response.data);
  List<QuizModel> ListModel = List.generate(
    response.data.length,
    (index) => QuizModel.fromMap(
      response.data[index],
    ),
  );
  print(ListModel);
  return ListModel;
}

class QuizModel {
  String question;
  List<String> answers;
  num indexOfCorrect;

  QuizModel(
      {required this.question,
      required this.answers,
      required this.indexOfCorrect});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answers': answers,
      'indexOfCorrect': indexOfCorrect,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      question: map['question'] as String,
      answers: List.generate(
        map['answers'].length,
        (index) => map['answers'][index],
      ),
      indexOfCorrect: map['indexOfCorrect'] as num,
    );
  }
  @override
  String toString() {
    return 'QuizModel(question: $question, answers: $answers, indexOfCorrect: $indexOfCorrect)';
  }
}
