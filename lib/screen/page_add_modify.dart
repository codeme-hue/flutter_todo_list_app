import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/model/response_post_model.dart';
import 'package:flutter_todo_list_app/model/response_todo_model.dart';
import 'package:flutter_todo_list_app/model/todo_insert.dart';
import 'package:flutter_todo_list_app/model/todo_update.dart';
import 'package:flutter_todo_list_app/screen/page_home.dart';
import 'package:flutter_todo_list_app/service/api_sevice.dart';
import 'package:toast/toast.dart';

class PageAddModify extends StatefulWidget {
  static const String id = "PAGEADDMODIFY";
  final Data todo;

  PageAddModify({this.todo});

  @override
  _PageAddModifyState createState() => _PageAddModifyState();
}

class _PageAddModifyState extends State<PageAddModify> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nmTitle = new TextEditingController();
  ApiService service = ApiService();
  ResponsePost response;

  String _idTodo;
  bool _validate = false;
  bool _isUpdate = false;
  bool _nmCompleted;
  int satu = 1;
  int _isvalueCheckBox;


  @override
  void initState() {
    super.initState();

    if (widget.todo != null) {
      _isUpdate = true;
      _idTodo = widget.todo.id.toString();
      _nmCompleted = widget.todo.completed;

      _nmTitle.text = this.widget.todo.title;
    }
    else {
      _nmTitle = new TextEditingController();
     _nmCompleted = false;
    }
  }

  void checkValidation() async {
    if (_formKey.currentState.validate()) {
        _formKey.currentState.save();

      if (_isUpdate) {
        showLoaderDialog(context);
        final todoUpdate = DataUpdateManipulation(
                   title: _nmTitle.text, completed: _isvalueCheckBox);
                response = await service.updateBarang(_idTodo, todoUpdate);

        if (response.status == 200) {
              Navigator.pushNamedAndRemoveUntil(
              context, HomePage.id, (Route<dynamic> route) => false);
              setState(() {});
              Toast.show('Berhasil', context);
        } else
          {
             Toast.show('Gagal', context);
          }

      } else {
        showLoaderDialog(context);
        final todo = DataManipulation(title: _nmTitle.text);
          response = await service.postBarang(todo);

        if (response.status == 201) {
          Navigator.pushNamedAndRemoveUntil(
                context, HomePage.id, (Route<dynamic> route) => false);
                setState(() {});
                Toast.show('Berhasil', context);

        } else
          {
             Toast.show('Gagal', context);
          }
      }

    } else
      {
      _validate = true;
      }
  }

  String validator(String value) {
    if (value.isEmpty)
      return "jangan kosong";
    else
      return null;
  }


  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Proses...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isUpdate ? Text('Update Data') : Text('Tambah Data'),
        actions: <Widget>[
          _isUpdate
              ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  showLoaderDialog(context);
                    final result = await service.delBarang(_idTodo);
                      if (result != null) {
                 Navigator.pushNamedAndRemoveUntil(context,
                    HomePage.id, (Route<dynamic> route) => false);
                    Toast.show('Berhasil Menghapus', context);
              } else
                {
                Toast.show('Gagal Menghapus' + result.toString(), context);
                }
            },
          )
              : Text('')
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            autovalidate: _validate,
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextFormField(
                    controller: _nmTitle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Title'),
                    validator: validator,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Checkbox(
                    value: _nmCompleted,
                    onChanged: (bool value) {
                      setState(() {
                        _nmCompleted = value;

                        if (_nmCompleted == true)
                        {
                          _isvalueCheckBox = 1;
                          Toast.show('Terlaksana', context);
                        }
                        if (_nmCompleted == false)
                        {
                          _isvalueCheckBox = 0;
                        }
                      });
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'SIMPAN',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: checkValidation,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}