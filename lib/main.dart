import 'package:flutter/material.dart';
// import 'package:flutter_router/pages/home.dart';
import 'package:flutter_router/pages/home/Home.dart';
// import 'package:flutter_router/pages/subject.dart';
import 'package:flutter_router/pages/subject/Subject.dart';
// import 'package:flutter_router/pages/user.dart';
import 'package:flutter_router/pages/user/User.dart';
import 'package:flutter_router/pages/user/userWidget/userCoupon.dart';
import 'package:flutter_router/router/Routes.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:App(),
      onGenerateRoute:onGenerateRoute,
    );
  }
}
//<uses-sdk tools:overrideLibrary="com.pichillilorenzo.flutter_inappbrowser"/>
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  Color _fixedColors=Colors.orange;
  List list = [Home(),SubjectPage(),UserPage()];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          fixedColor:this._fixedColors,
          currentIndex:this._currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(icon: Icon(Icons.subject), title: Text('专题')),
            BottomNavigationBarItem(icon: Icon(Icons.supervisor_account), title: Text('用户')),
          ],
          onTap: (int index){
            setState((){
              this._currentIndex=index;
              this._fixedColors=Colors.orange;
            });
          }

      ),
      body:this.list[this._currentIndex],

    );

  }
}

