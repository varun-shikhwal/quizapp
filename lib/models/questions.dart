import 'package:flutter/material.dart';

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({
    required this.id,
    required this.question,
    required this.answer,
    required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question": "What city is known as 'The Eternal City'?",
    "options": ['Rome', 'paris', 'London', 'Berlin'],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "What company was initially known as 'Blue Ribbon Sports'?",
    "options": ['Puma', 'Adidas', 'Nike', 'UnderArmour'],
    "answer_index": 3,
  },
  {
    "id": 7,
    "question": "How many time zones are there in Russia?",
    "options": ['10', '11', '15', '12'],
    "answer_index": 2,
  },
  {
    "id": 8,
    "question": "What is the only continent with land in all four hemisphere?",
    "options": ['Asia', 'Europe', 'Africa', 'South America'],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question": "How many minutes are in a full weak?",
    "options": ['10090', '10070', '10180', '10080'],
    "answer_index": 2,
  },
];
