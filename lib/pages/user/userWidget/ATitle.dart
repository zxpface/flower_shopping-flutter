// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

var ATitle = (String text) => Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        textScaleFactor: 1.2,
      ),
    );
var UserAvatar = () => Container(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          ClipOval(
            child: Container(
              width: 80,
              height: 80,
              child: Image.network(
                "https://st-gdx.dancf.com/gaodingx/8/design/20190416-104501-cd9f.png?x-oss-process=image/resize,w_760/interlace,1",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('花钱购买'),
                  Text(
                    '一个一个一个',
                    textScaleFactor: .9,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );


class SelectItems extends StatelessWidget {
  String text;
  String path;
  SelectItems(this.text, {this.path});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(path);

        },
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Text(text, textScaleFactor: 1.1)),
              // SvgPicture.asset("assets/svg/right.svg"),
              Icon(Icons.chevron_right,size: 44,)
            ],
          ),
        ));
  }
}
