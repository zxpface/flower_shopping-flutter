// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(SubjcetDetailpages());
//
// class SubjcetDetailpages extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//         ),
//         body:SubjcetDetailpage(),
//       ),
//     );
//   }
// }

class SubjcetDetailpage extends StatefulWidget {
  @override
  _SubjcetDetailpageState createState() => _SubjcetDetailpageState();
}

class _SubjcetDetailpageState extends State<SubjcetDetailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('详情'),
          backgroundColor: Colors.orangeAccent,
      ),
      body: SafeArea(
        child: WebviewScaffold(
          url: "https://www.baidu.com",
          withZoom: true,
          withLocalStorage: true,
          hidden: true,
          initialChild: Center(
            child: Text('正在努力加载中...'),
          ),
        ),
      ),
    );
  }
}
