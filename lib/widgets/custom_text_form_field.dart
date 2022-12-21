import 'package:flutter/material.dart';
import 'package:TB2/models/student.dart';
import 'package:TB2/providers/student_provider.dart';
import 'package:TB2/util/database_helper.dart';
import 'package:TB2/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class AddEditStudentPage extends StatefulWidget {
static const routeName = '/add-edit-student';

@override
_AddEditStudentPageState createState() => _AddEditStudentPageState();
}

class _AddEditStudentPageState extends State<AddEditStudentPage> {
final _form = GlobalKey<FormState>();
var _isLoading = false;
var _isInit = true;
var _editedStudent = Student(
id: 0,
name: '',
nim: '',
phone: '',
email: '',
);

var _initValues = {
'name': '',
'nim': '',
'phone': '',
'email': '',
};

@override
void didChangeDependencies() {
if (_isInit) {
final studentId = ModalRoute.of(context).settings.arguments as int;
if (studentId != null) {
_editedStudent =
Provider.of<StudentProvider>(context, listen: false).findById(studentId);
_initValues = {
'name': _editedStudent.name,
'nim': _editedStudent.nim,
'phone': _editedStudent.phone,
'email': _editedStudent.email,
};