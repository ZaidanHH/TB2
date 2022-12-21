import 'package:flutter/widgets.dart';
import 'package:TB2/models/student.dart';
import 'package:TB2/util/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class StudentProvider with ChangeNotifier {
  List<Student> _students = [];

  List<Student> get students => _students;

  Future<void> addStudent(Student student) async {
    final database = await DatabaseHelper.instance.database;
    student.id = await database.insert(
      DatabaseHelper.table,
      student.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _students.add(student);
    notifyListeners();
  }

  Student findById(int id) {
    final student = _students.firstWhere((e) => e.id == id, orElse: () => null);
    if (student == null) {
      return null; // atau throw Exception('Student not found');
    }
    return student;
  }

  Future<void> fetchStudents() async {
    final database = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps =
        await database.query(DatabaseHelper.table);
    List<Student> students = await DatabaseHelper.getStudents();
    notifyListeners();
  }

  Future<void> updateStudent(Student student) async {
    final database = await DatabaseHelper.instance.database;
    await database.update(
      DatabaseHelper.table,
      student.toMap(),
      where: '${DatabaseHelper.columnId} = ?',
      whereArgs: [student.id],
    );
    final studentIndex = _students.indexWhere((e) => e.id == student.id);
    if (studentIndex >= 0) {
      _students[studentIndex] = student;
      notifyListeners();
    }
  }

  Future<void> deleteStudent(int id) async {
    final database = await DatabaseHelper.instance.database;
    await database.delete(
      DatabaseHelper.table,
      where: '${DatabaseHelper.columnId} = ?',
      whereArgs: [id],
    );
    _students.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  List<Student>? getStudent(int id) {
    // Do something
    if (students == null) {
      return null; // atau throw Exception('Student not found');
    }
    return students;
  }
}
