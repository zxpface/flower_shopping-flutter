import 'package:flutter/material.dart';
import 'package:flutter_router/model/homeBotBox.dart';
import 'package:transparent_image/transparent_image.dart';


class HomeBotBox extends StatelessWidget {

List<Goods> goods;
VoidCallback routerBack;
  HomeBotBox(this.goods,{this.routerBack});
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 250,
      child: ListView.builder(
        itemCount: goods.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx,index){
          return GestureDetector(
            onTap: this.routerBack,
            child: Container(
              // height: 10,
              width: screenWidth / 2 - 20,
              child: Column(
                children: <Widget>[
                  FadeInImage.memoryNetwork(placeholder: kTransparentImage, image:goods[index].imgUrl,height: 150, ),
                  Container(
                    child: Text(goods[index].name),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
