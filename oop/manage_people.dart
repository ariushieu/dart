class Person{
  String name;
  int age;

  Person(this.name, this.age);

  void introduce() => print('Toi la $name, $age tuoi');
}

class Student extends Person{
  double grade;
  Student(String name, int age, this.grade) : super(name, age);

  @override
  void introduce() => print('Sinh vien $name, $age tuoi, Diem: $grade');
}

class Teacher extends Person{
  String subject;
  Teacher(String name, int age, this.subject) : super(name, age);

  @override
  void introduce() => print('Sinh vien $name, $age tuoi, Mon day: $subject');
}

void main(){
  List<Person> people = [
    Student('An', 20, 8.5),
    Student('Binh', 21, 7.0),
    Teacher('Cuong', 35, 'Toan')
  ];

  for(var person in people) {
    person.introduce();
  }
}