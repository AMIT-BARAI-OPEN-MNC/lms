import 'dart:convert';

class Note {
  final int? id;
  final String title;
  final String subTitle;

  const Note({
    required this.title,
    required this.subTitle,
    this.id,
  });
  factory Note.fromJson(Map<String, dynamic> json) =>
      Note(id: json['id'], title: json['title'], subTitle: json['subTitle']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'subTitle': subTitle};
}
