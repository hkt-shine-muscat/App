class Memo {
  final int id;

  final String text;

  Memo({this.id, this.text});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
    };
  }

  @override
  String toString() {
    return 'Memo{id: $id, text: $text}';
  }
}
