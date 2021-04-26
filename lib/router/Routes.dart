import 'package:flutter/material.dart';
// import 'package:flutter_router/modelDatas/homeBoxBox.dart';
import 'package:flutter_router/pages/home/HomeWidgets/detailphoto.dart';
import 'package:flutter_router/pages/home/HomeWidgets/homeDetail.dart';
import 'package:flutter_router/pages/subject/Subject.dart';
import 'package:flutter_router/pages/subject/subjectPage/SubjectDetail.dart';
import 'package:flutter_router/pages/user/userWidget/userChangePass.dart';

import '../main.dart';

//配置路由
final routes={
       '/':(context)=>MyApp(),
       '/subject':(context)=>SubjectPage(),

  '/SubjcetDetailpage':(context)=>SubjcetDetailpage(),
  '/changePass':(context)=>ChagePassWord(),
  '/homeDetail':(context,{arguments})=>HomeDetail(),
  '/detailPhonto':(context,{arguments})=> DetailPhonto(arguments:arguments),

};

//固定写法
var onGenerateRoute=(RouteSettings settings) {
      // 统一处理
      final String name = settings.name; 
      final Function pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};