import 'package:flutter/material.dart';
import 'package:questionnaire/model/Question.dart';

class QuestionList extends StatelessWidget {
  Question question;
  bool showError;
  Function(int) makeChoose;
  QuestionList({@required this.question, this.showError, this.makeChoose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(question.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.blueGrey)),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: question.category.length,
              itemBuilder: (context, index) {
                var categories = question.category;
                var titleString = categories[index].title;
                var subTitleString = categories[index].subtitle;
                var isHaveSubtitle =
                    subTitleString != null && subTitleString != "";
                var selectIndex = question.selectedCategoryIndex;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    child: Container(
                      color: (index == selectIndex)
                          ? Colors.blueGrey[100]
                          : Colors.white,
                      child: RadioListTile(
                          activeColor: Colors.blueGrey,
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: Text(titleString),
                          subtitle:
                              isHaveSubtitle ? Text(subTitleString) : null,
                          value: index,
                          groupValue: selectIndex,
                          onChanged: (value) {
                              makeChoose(value);
                          }),
                    ),
                  ),
                );
              }),
          SizedBox(height: 8.0),
          Visibility(
              visible: showError,
              child: Text(
                "Пожалуйста, сделайте свой выбор",
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ))
        ],
      ),
    );
  }
}
