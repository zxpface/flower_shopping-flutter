import 'package:flutter/material.dart';
import 'package:flutter_router/modelDatas/CategoryData.dart';
import 'package:flutter_router/modelDatas/homeBoxBox.dart';

import 'HomeWidgets/homeBotBox.dart';
import 'HomeWidgets/homeCenteriBox.dart';
import 'HomeWidgets/homeTopbananr.dart';



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(252, 204, 165,1),
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                HomeTopBarnan(),
                HomeCenterBox(categorys,handle: (i)=>Navigator.pushNamed(context, '/homeDetail'),),
                SizedBox(child: Text('分类'),),
                HomeBotBox(goods),
              ],
            ),
          ),
    );
  }
}


