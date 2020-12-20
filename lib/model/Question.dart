import 'package:flutter/material.dart';

class Question {
  String title;
  String subtitle;
  int selectedCategoryIndex;
  List<Category> category;
  int id;
  Question({@required this.id, @required this.title, this.subtitle, this.category});
}

class Category {
  String title;
  String subtitle;
  Category({this.title, this.subtitle});
}
