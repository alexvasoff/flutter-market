import 'dart:convert';
import 'dart:io';

main() async {
  //String data = File('assets/ItemsData').readAsStringSync(); // чтение файла
  //print(data);

  // Map x = jsonDecode(await File('assets/ItemsData').readAsString());
  //String res =
  // Student.toJson(Student("Bob", "212@sampe.com", DateTime(2015)));
  // print(res);
  print(Student.fromJsonArray(jsonData));
}

// пример кодирования в JSON
class Student {
  final String name;
  final String email;
  final DateTime dob;

  Student(this.name, this.email, this.dob);

  static String toJson(Student s) {
    Map<String, dynamic> map() =>
        {'name': s.name, 'email': s.email, 'dob': s.dob.toIso8601String()};
    String result = jsonEncode(map());

    return result;
  }

  static Student fromJsonMap(Map<String, dynamic> json) {
    print('json object $json');
    String name = json["name"];
    String email = json["email"];
    DateTime dob = DateTime.parse(json["dob"]);
    Student s = new Student(name, email, dob);
    return s;
  }

  static List<Student> fromJsonArray(String jsonString) {
    Map<String, dynamic> decodeMap = jsonDecode(jsonString);
    print('Decode map $decodeMap');
    List<dynamic> dynamicList = decodeMap["students"];
    print('dynamicList $dynamicList');
    List<Student> students = new List<Student>();
    dynamicList.forEach((element) {
      Student s = Student.fromJsonMap(element);
      print('student $s');
      students.add(s);
    });
    return students;
  }
}

String jsonData =
    '{    "students": [{"name": "John","email": "john@example.com","dob": "2000-02-14T00:00:00.000"},{"name": "Jane","email": "jane@example.com","dob": "1999-03-01T00:00:00.000"}]}';
// Map<String, dynamic> json = jsonDecode(jsonStr)
