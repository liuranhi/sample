import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/util/dbhelper.dart';
import 'package:intl/intl.dart';

DbHelper helper = DbHelper();

class TodoDetail extends StatefulWidget {
  final Todo todo;
  TodoDetail(this.todo);

  @override
  State<StatefulWidget> createState() => TodoDetailState(todo);
}

class TodoDetailState extends State<TodoDetail> {
  Todo todo;
  final _priorities = ["High", "Medium", "Low"];
  String _priority = "Low";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  bool isEdit;
  final _formKey = GlobalKey<FormState>();
  DateTime date;

  void initState() {
    super.initState();
    isEdit = todo.title == '' ? false : true;
    titleController.text = todo.title;
    descriptionController.text = todo.description;
  }

  TodoDetailState(this.todo);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 16.0,
      color: Colors.black54,
      fontWeight: FontWeight.w600,
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text(isEdit ? "Edit the plan" : "Add the plan")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                //color: Colors.white,
              ),
              width: 320.0,
              height: 370.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                          maxLength: 30,
                          onSaved: (value) {
                            todo.title = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Title cannot be null';
                            }

                            if (value.length > 30) {
                              return 'Max length for title is 30.';
                            }
                          },
                          keyboardType: TextInputType.text,
                          controller: titleController,
                          style: textStyle,
                          decoration: InputDecoration(
                            hintText: 'Title',
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 10.0),
                            labelStyle: textStyle,
                          )
                      ),
                      TextFormField(
                          maxLength: 50,
                          onSaved: (value) {
                            todo.description = value;
                          },
                          keyboardType: TextInputType.text,
                          controller: descriptionController,
                          style: textStyle,
                          decoration: InputDecoration(
                            hintText: 'Descript',
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 15.0),
                            labelStyle: textStyle,
                          )
                      ),

                      // 日2欄
                      TextFormField(
                          maxLength: 50,
                          onSaved: (value) {
                            todo.date = value;
                          },
                          keyboardType: TextInputType.text,
                          controller: dateController,
                          style: textStyle,
                          decoration: InputDecoration(
                            hintText: 'Year',
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 15.0),
                            labelStyle: textStyle,
                          )
                      ),

                      TextFormField(
                          maxLength: 50,
                          onSaved: (value) {
                            todo.date = value;
                          },
                          keyboardType: TextInputType.text,
                          controller: dateController,
                          style: textStyle,
                          decoration: InputDecoration(
                            hintText: 'Year',
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 15.0),
                            labelStyle: textStyle,
                          )
                      ),

                      InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Priority',
                          contentPadding: EdgeInsets.zero,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            items: _priorities.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            style: textStyle,
                            value: retrievePriority(todo.priority),
                            onChanged: (value) => updatePriority(value),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: EdgeInsets.all(13.0),
                        elevation: 2.0,
                        textColor: Colors.white,
                        color: Colors.amber,
                        onPressed: () => save(),
                        child: Text(
                          isEdit ? "Edit" : "Add",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: isEdit
          ? FloatingActionButton(
              onPressed: () {
                debugPrint("Click Floated Back.");
                confirmDelete();
              },
              elevation: 5.0,
              backgroundColor: Colors.red,
              tooltip: "Cancel",
              child: new Icon(
                Icons.clear,
                size: 35.0,
              ))
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void confirmDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text("Are you sure about deleting this todo?",
                style: TextStyle(fontSize: 15.0)),
            actions: <Widget>[
              new FlatButton(
                  child: new Text('CANCEL'),
                  onPressed: () => Navigator.of(context).pop()),
              new FlatButton(
                  child: new Text(
                    'DELETE',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    helper.deleteTodo(todo.id);
                    Navigator.of(context).pop();
                    Navigator.pop(context, true);
                  })
            ],
          ),
    );
  }

  void save() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      // todo.date = new DateFormat.yMd().format(DateTime.now());
      if (todo.id != null) {
        helper.updateTodo(todo);
      } else {
        helper.insertTodo(todo);
      }
      Navigator.pop(context, true);
    }
  }

  void updatePriority(String value) {
    switch (value) {
      case 'High':
        todo.priority = 1;
        break;
      case 'Medium':
        todo.priority = 2;
        break;
      case 'Low':
        todo.priority = 3;
        break;
    }

    setState(() {
      _priority = value;
    });
  }

  String retrievePriority(int value) {
    return _priorities[value - 1];
  }

  void updateTitle() {
    setState(() {
      todo.title = titleController.text;
    });
  }

  void updateDescription() {
    setState(() {
      todo.description = descriptionController.text;
    });
  }
}
