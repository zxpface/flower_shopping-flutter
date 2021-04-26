//home页，点击 跳转到详情页购物内容
import 'package:flutter/material.dart';
import 'package:flutter_router/lib/event.dart';
import 'package:flutter_router/widgets/ATab.dart';
import 'package:flutter_router/widgets/home_OverLayer.dart';
// import 'package:flutter_router/main.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef Updater = void Function(void Function());

class HomeDetail extends StatefulWidget {
  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  //购物数量num
  // int num=0;
  @override
  Widget build(BuildContext context) {
//底部按钮购买
    var bottomNav= Positioned(
        bottom: MediaQuery.of(context).padding.bottom,
        left: 0,
        right: 0,
        child: Container(
          height: 50,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 10, right: 3),
                        child: Icon(Icons.shopping_cart,size: 20,)
                    ),
                    // StatefulBuilder(
                    //   builder: (ctx, _updater) {
                    //     updater = _updater;
                    //     return Text(
                    //       // shopCart.count.toString(),
                    //         num.toString(),
                    //         style: TextStyle(
                    //           fontSize: 20,
                    //             color: Color.fromRGBO(51, 51, 51, 0.7)));
                    //   },
                    // ),
                    StatefulBuilder(
                      builder: (ctx, _updater) {
                        // updater = _updater;
                        return Text(shopCart.count.toString(),
                            style: TextStyle(
                                color: Color.fromRGBO(51, 51, 51, 0.7)));
                      },
                    ),
                  ],
                ),
              ),
              bottomBotton("加入购物车", Colors.deepOrange, () {
                event.fire(AddGoodsCount());
                setState(() {
                  // num++;
                  shopCart.count += 1;

                });
                Fluttertoast.showToast(
                    msg: "加入购物车成功",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    // timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);

              }),
              bottomBotton("购买", Colors.red, () {
//                  showModalBottomSheet(context: ctx, builder: (ctx){
//                    return ConstrainedBox(
//                        constraints: BoxConstraints(minHeight: MediaQuery.of(ctx).size.height / 2 + 200),
//                        child: Text("123"),
//                    );
//                  });

                showDialog(
                    // context: ctx,
                    builder: (context) {
                      return OverLayer();
                    });
              }),
            ],
          ),
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text('购物详情'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Swiperdome(),
          Container(
            height: 10,
            color: Color.fromRGBO(244, 244, 244, 1),
          ),
          Price(newprice:'177.91',oldprice:'299.80'),
          Container(
            height: 10,
            color: Color.fromRGBO(244, 244, 244, 1),
          ),
          Title,
          SizedBox(height: 5,),
          InfoItem("类别:", "鲜花-鲜花"),
          InfoItem("材料:", "戴安娜粉玫瑰12枝戴安娜粉玫瑰12枝戴安娜粉玫瑰12枝，石竹梅7枝，叶上花10枝"),
          InfoItem("包装:", "蓝色方形花桶"),
          SizedBox(height: 5,),
          Container(
            height: 10,
            color: Color.fromRGBO(244, 244, 244, 1),
          ),
          bottomNav,
          Expanded(
            child: Container(
              height: 800,
              color: Colors.redAccent,
              child: ImageInfo,
            ),
          )
        ],
      ),
    );
  }
}



//轮播图
class Swiperdome extends StatelessWidget {
  var photo = [
    "https://img01.hua.com/uploadpic/newpic/9010011.jpg_220x240.jpg",
    "https://img01.hua.com/uploadpic/newpic/9012345.jpg_220x240.jpg",
    "https://img01.hua.com/uploadpic/newpic/9012413.jpg_220x240.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300,
      child: Swiper(
        itemCount:photo.length,
        autoplay: true,
        //圆点
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.black54,
              activeColor: Colors.deepOrangeAccent,
            )),
        //左右方向按钮
        control: new SwiperControl(
          color: Colors.deepOrangeAccent
        ),
        itemBuilder: (BuildContext context,int index){
          return Hero(
              tag: this.photo[index],
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: this.photo[index],
                fit: BoxFit.cover,
              )
          );
        },
        onTap: (i){
          Navigator.pushNamed(context, '/detailPhonto',arguments: this.photo[i]);
          print(photo[i]);
        },

      ),
    );
  }
}

//价格
var Price=({newprice,oldprice})=>Container(
  padding: EdgeInsets.all(15),
  child: Row(
    children: <Widget>[
      Text('￥'+newprice,
        style: TextStyle(color: Colors.red,fontSize: 24),
      ),
      Text('￥'+oldprice,
        style: TextStyle(color: Colors.grey,fontSize: 16,decoration: TextDecoration.lineThrough),
      ),
    ],
  ),
);

//爆款
var Title = Container(
  padding: EdgeInsets.all(5),
  child: Row(
    children: <Widget>[
      Container(
        color: Colors.redAccent,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        margin: EdgeInsets.only(right: 10),
        child: Text(
          '爆款',
          style: TextStyle(color: Colors.white,fontSize: 16),
        ),
      ),
      Expanded(
        child: Text(
            '温柔如你--戴安娜粉玫瑰12枝，石竹梅7枝',
          textScaleFactor: 1.2,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,

        ),
      ),
    ],
  ),
);
//商品简介
var InfoItem = (String title, String text) => Container(
  padding: EdgeInsets.all(10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.ideographic,
    children: <Widget>[
      Container(
        width: 60,
        padding: EdgeInsets.only(right: 10),
        alignment: Alignment.topRight,
        child: Text(title,
            style:
            TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
      Expanded(
        child: Text(text, style: TextStyle(fontSize: 14)),
      )
    ],
  ),
);


//底部按钮购买
//按钮封装
var bottomBotton=
 (String text,Color color,VoidCallback onTap)=>GestureDetector(
   onTap: onTap,
   child: Container(
     height: 50,
     padding: EdgeInsets.symmetric(horizontal: 20,),
     alignment: Alignment.center,
     child: Text(
       text,
       style: TextStyle(
         color: Colors.white,
       ),
     ),
     color: color,
   ),
 );
//
// Updater updater = null;
//
// event.on<AddGoodsCount>().listen((_) {
// if (updater == null) return;
//
// updater(() {
// shopCart.count += 1;
// });
// });



//图文介绍，评价
var ImageInfo=ATab(
  tabs: ['图文介绍','评价'],
  childrens: <Widget>[
    Text('图文'),
    Text('介绍')

    // Expanded(
    //  child: Column(
    //    children: <Widget>[
    //      Container(
    //        height: 200,
    //        color: Colors.orangeAccent,
    //      ),
    //      Expanded(
    //        child: Container(
    //          color: Colors.lightBlueAccent,
    //        ),
    //      )
    //    ],
    //  ),
    //
    // ),
    // Expanded(
    //   child: Column(
    //     children: <Widget>[
    //       Container(
    //         height: 200,
    //         color: Colors.redAccent,
    //       ),
    //       Expanded(
    //         child: Container(
    //           color: Colors.lightBlueAccent,
    //         ),
    //       )
    //     ],
    //   ),
    //
    // ),

  ],
);
