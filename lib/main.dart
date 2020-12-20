import 'package:flutter/material.dart';
import 'package:questionnaire/widgets/bottomButtons.dart';
import 'package:questionnaire/widgets/question_list.dart';
import 'model/Question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> questions = [
    Question(
        id: 1,
        title: "1. Является ли ваше настроение в общем веселым и беззаботным?",
        category: [Category(title: "Да"), Category(title: "Нет")]),
    Question(id: 2, title: "2. Восприимчивы ли вы к обидам?", category: [
      Category(title: "Да"),
      Category(title: "Нет", subtitle: "(Бывают исключения)"),
      Category(title: "Нет")
    ]),
    Question(
        id: 3,
        title: "3. Верно ли, что на спор Вы способны решиться на все?",
        category: [Category(title: "Да"), Category(title: "Нет")]),
    Question(
        id: 3,
        title:
            "4. Смущаете ли Вы, когда хотите познакомиться с человеком противоположного пола, который вам симпатичен?",
        category: [Category(title: "Да"), Category(title: "Нет")]),
    Question(
        id: 3,
        title: "5. Часто ли Вы действуете под влиянием минутного настроения?",
        category: [
          Category(title: "Да"),
          Category(title: "Нет"),
          Category(title: "Не помню 😀")
        ]),
  ];
  bool _isChecked = false;

  bool _showValidationError() {
    var isShowError = false;
    for (var i = 0; i < questions.length; i++) {
      if (questions[i].selectedCategoryIndex == null) {
        isShowError = true;
      }
    }
    return isShowError;
  }

  _showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Спасибо!"),
      content: Text("Вы успешно ответили на все вопросы."),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Опросник".toUpperCase()),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 25.0, top: 20.0),
        color: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return QuestionList(
                      question: questions[index],
                      showError: _isChecked
                          ? questions[index].selectedCategoryIndex == null
                          : _isChecked,
                      makeChoose: (selectIndex) {
                        setState(() {
                          print(selectIndex);
                          questions[index].selectedCategoryIndex =
                              selectIndex;
                        });
                      },
                    );
                  }),
            ),
            SizedBox(height: 20.0),
            BottomButtons(
              donePressed: () {
                setState(() {
                  _isChecked = true;
                });

                if (!_showValidationError()) {
                  _showAlertDialog(context);
                }
              },
              cancelPressed: () {
                setState(() {
                  questions.forEach((element) {
                    element.selectedCategoryIndex = null;
                  });
                  _isChecked = false;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
