import 'dart:io';

// ========== Abstract Class ==========
abstract class Person {
  int _id;
  String _name;

  Person(this._id, this._name);

  int get id => _id;
  String get name => _name;

  set name(String value) {
    _name = value;
  }

  void displayInfo();
}

// ========== Student Class ==========
class Student extends Person {
  String _studentClass;
  String _section;
  String _contact;

  Student(
    int id,
    String name,
    this._studentClass,
    this._section,
    this._contact,
  ) : super(id, name);

  String get studentClass => _studentClass;
  String get section => _section;
  String get contact => _contact;

  set studentClass(String value) => _studentClass = value;
  set section(String value) => _section = value;
  set contact(String value) => _contact = value;

  @override
  void displayInfo() {
    print("\nID: $id");
    print("Name: $name");
    print("Class: $studentClass");
    print("Section: $section");
    print("Contact: $contact");
    print("------------------------");
  }
}

// ========== Student Manager ==========
class StudentManager {
  List<Student> students = [];

  // Arrow Function
  void showMessage(String msg) => print("\n$msg\n");

  void addStudent() {
    print("Enter ID:");
    int id = int.parse(stdin.readLineSync()!);

    print("Enter Name:");
    String name = stdin.readLineSync()!;

    print("Enter Class:");
    String studentClass = stdin.readLineSync()!;

    print("Enter Section:");
    String section = stdin.readLineSync()!;

    print("Enter Contact:");
    String contact = stdin.readLineSync()!;

    students.add(
      Student(id, name, studentClass, section, contact),
    );

    showMessage("Student Added Successfully!");
  }

  void viewStudents() {
    if (students.isEmpty) {
      print("\nNo Student Found!\n");
      return;
    }

    // Anonymous Function
    students.forEach((student) {
      student.displayInfo();
    });
  }

  void searchStudent() {
    print("Enter Student ID:");
    int id = int.parse(stdin.readLineSync()!);

    for (var student in students) {
      if (student.id == id) {
        print("\nStudent Found:");
        student.displayInfo();
        return;
      }
    }

    print("\nStudent Not Found!\n");
  }

  void deleteStudent() {
    print("Enter Student ID:");
    int id = int.parse(stdin.readLineSync()!);

    int before = students.length;

    students.removeWhere((student) => student.id == id);

    if (students.length < before) {
      showMessage("Student Deleted Successfully!");
    } else {
      print("\nStudent Not Found!\n");
    }
  }
}

// ========== Main Function ==========
void main() {
  StudentManager manager = StudentManager();

  while (true) {
    print("\n===== Student Information Manager =====");
    print("1. Add Student");
    print("2. View Students");
    print("3. Search Student");
    print("4. Delete Student");
    print("5. Exit");

    print("\nChoose Option:");

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        manager.addStudent();
        break;

      case 2:
        manager.viewStudents();
        break;

      case 3:
        manager.searchStudent();
        break;

      case 4:
        manager.deleteStudent();
        break;

      case 5:
        print("\nProgram Closed.");
        exit(0);

      default:
        print("\nInvalid Choice!\n");
    }
  }
}
