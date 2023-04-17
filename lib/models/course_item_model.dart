class CourseModel {
  int? id;
  String? courseName;
  String? courseUrl;
  String? courseDescription;
  int? price;
  int? duration;
  String? author;
  String? authorUrl;
  List<String>? lessons;

  CourseModel(
      {this.id,
      this.courseName,
      this.courseUrl,
      this.courseDescription,
      this.price,
      this.duration,
      this.author,
      this.authorUrl,
      this.lessons});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['course_name'];
    courseUrl = json['course_url'];
    courseDescription = json['course_description'];
    price = json['price'];
    duration = json['duration'];
    author = json['author'];
    authorUrl = json['author_url'];
    lessons = json['lessons'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_name'] = this.courseName;
    data['course_url'] = this.courseUrl;
    data['course_description'] = this.courseDescription;
    data['price'] = this.price;
    data['duration'] = this.duration;
    data['author'] = this.author;
    data['author_url'] = this.authorUrl;
    data['lessons'] = this.lessons;
    return data;
  }
}
