import 'package:flutter/material.dart';
import 'package:github/utils/net.dart';

class EditPersonInfoPage extends StatefulWidget {
  final String label;
  final String value;
  final String isRichText;

  const EditPersonInfoPage({
    Key key,
    this.label,
    this.value,
    this.isRichText,
  }) : super(key: key);

  @override
  _EditPersonInfoPageState createState() => _EditPersonInfoPageState();
}

class _EditPersonInfoPageState extends State<EditPersonInfoPage> {
  TextEditingController _controller;
  // final String text = widget.value;

  _handleOnChange(String text) {
    setState(() {
      text = text;
    });
  }

  _handleSubmit() {
    print('input >>> ${this.widget.value}');

    try {
      Net.get('https://api.github.com/user');
    } catch (err) {
      print('err >>> $err');
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: this.widget.value);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.label),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                controller: _controller,
                autofocus: true,
                onChanged: _handleOnChange,
                // obscureText: true, //隐藏正在编辑的文案（如：密码）
                decoration: InputDecoration(
                  hintText: '请输入',
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15.0),
                child: ButtonTheme(
                    minWidth: double.maxFinite,
                    child: RaisedButton(
                      disabledColor: Colors.blue[200],
                      color: Colors.blue,
                      onPressed: () => _handleSubmit(),
                      child: Text('更新',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0)),
                    )),
              )
            ],
          )),
    );
  }
}
