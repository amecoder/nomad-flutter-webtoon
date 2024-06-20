class WebtoonDetailModel {
  final String thumb, title, about, genre, age;

  WebtoonDetailModel.fromJson(
    Map<String, dynamic> json,
  )   : thumb = json['thumb'],
        title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];
}
