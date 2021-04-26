import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_router/model/category.dart';
import 'package:transparent_image/transparent_image.dart';

typedef void CategoryClick(num index);
// class Behavior extends ScrollBehavior{
//   @override
//   Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
//     if(Platform.isAndroid || Platform.isFuchsia){
//       return child;
//     }else{
//       return super.buildViewportChrome(context,child,axisDirection);
//     }
//
//   }


class HomeCenterBox extends StatelessWidget {
  List<Category> category;
  CategoryClick handle;
  HomeCenterBox(this.category,{this.handle});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: category.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx,index){
            var cate =category[index];
            return GestureDetector(
              onTap: (){
                if(this.handle !=null) this.handle(index);
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: cate.imgUrl,height: 100,width: 100,),
                    Container(
                      height: 40,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(cate.name,textScaleFactor: 1.2,),
                    ),
                  ],
                ),
              )
            );
          }));
  }
}
