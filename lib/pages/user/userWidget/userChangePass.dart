//我的--》修改密码

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChagePassWord extends StatefulWidget {
  @override
  _ChagePassWordState createState() => _ChagePassWordState();
}

class  _ChagePassWordState extends State<ChagePassWord> {

  //GlobalKey 能够跨 Widget 访问状态
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  TextEditingController _pwdEditController = TextEditingController();
  TextEditingController _pwdpassEditController = TextEditingController();

  var valueMap = {
    "old_pass": "",
    "pass": "",
    "comfirm_pass": ""
  };

  void forSubmitted() {
    var form = formKey.currentState;

    if (form.validate()) {
      form.save();
      print(valueMap);
    }
  }




  var _ctl = TextEditingController();
  //
  // _ctl.addListener((){
  // valueMap["pass"] = _ctl.value.text;
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('修改密码'),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text("修改密码", textScaleFactor: 1.6),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  // controller: ,
                  obscureText: true,
                  validator:(String val) {
                    return val.length < 6 ? "密码长度错误" : null;
                  },
                  onSaved: (val){
                    setState(() {
                      this.valueMap['old_pass']=val;
                    });

                  },
                  decoration: InputDecoration(
                      labelText: '旧密码',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrange
                          )
                      )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),

                child: TextFormField(
                  controller:  _pwdEditController ,
                  obscureText: true,
                  validator: (String val) {
                      return val.length < 6 ? "密码长度错误" : null;
                  },
                  onSaved: (val){
                    setState(() {
                      valueMap['pass']=val;
                      print('新密码'+val);
                    });

                  },
                  decoration: InputDecoration(
                      labelText: '新密码',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrange
                          )
                      )
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  controller:_pwdpassEditController,
                  obscureText: true,
                  validator:(val){
                    return _pwdEditController.text == val ? null : "确认密码不一致";
                  },
                  onSaved: (val){
                    setState(() {
                      valueMap['comfirm_pass']=val;
                      print('确定密码'+_pwdpassEditController.text);
                    });

                  },
                  decoration: InputDecoration(
                      labelText: '确定密码',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrange
                          )
                      )
                  ),
                ),
              ),
              FlatButton(
                color: Colors.deepOrange,
                child: Text("提交", style: TextStyle(color: Colors.white)),
                onPressed: () => forSubmitted(),
              )
            ],
          ),
        ),
      ),
    );
  }




}
