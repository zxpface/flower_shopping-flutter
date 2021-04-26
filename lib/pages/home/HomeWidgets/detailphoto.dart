import 'package:flutter/material.dart';
import 'package:flutter_router/widgets/weblist_box.dart';
import 'package:photo_view/photo_view.dart';

class DetailPhonto extends StatelessWidget {
  var arguments;
  DetailPhonto({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片'),
      ),
      body:  Container (
        // child: Image.network(arguments),

        child: PhotoView(
          imageProvider: NetworkImage(arguments),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'base.dart';

//
// var Photo = () =>
//      (
//           child: PhotoView(
//
//             imageProvider: NetworkImage(params['url']),)
//       );

