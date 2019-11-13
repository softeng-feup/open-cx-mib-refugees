import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Talk {
  String author;
  String title;
  String abstract;
  String key;

  Talk(this.author, this.title, this.abstract);

  Talk.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        author = snapshot.value["Author"],
        title= snapshot.value["Title"],
        abstract = snapshot.value["Abstract"];

  toJson() {
    return {
      "author": author,
      "title": title,
      "abstract": abstract,
    };
  }
}