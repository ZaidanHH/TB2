import 'package:flutter/material.dart';
import 'package:TB2/pages/add_edit_student.dart';
import 'package:TB2/providers/student_provider.dart';
import 'package:TB2/widgets/student_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Reminder'),
      ),
      body: StudentList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddEditStudentPage.routeName);
        },
      ),
    );
  }
}
