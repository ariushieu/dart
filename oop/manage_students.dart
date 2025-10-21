class Student{
  String name;
  int age;
  double grade;

  Student(this.name, this.age, this.grade);

  String getGrade(){
    if(grade >= 8.5) return 'Gioi';
    if(grade >= 7.0) return 'Kha';
    if(grade >= 5.0) return 'Trung Binh';
    return 'Yeu';
  }
}

void main(){
  List<Student> students = [
    Student('An', 20, 8.7),
    Student('Binh', 21, 7.2),
    Student('Cuong', 19, 4.5),
  ];
  for (var student in students){
    print('Sinh vien: ${student.name}, Tuoi: ${student.age}, Diem: ${student.grade}');
    print('Xep loai: ${student.getGrade()}');
  }
}