import 'package:flutter/material.dart';
import 'package:flutter_router/pages/subject/subjectPage/SubjectDetail.dart';
// import 'package:flutter_router/pages/subject/subjectPage/SubjectDetail.dart';
// import 'package:flutter_router/router/Routes.dart';
import 'package:transparent_image/transparent_image.dart';
 import 'package:flutter_router/model/subject.dart'as m;
 import 'package:flutter_router/modelDatas/subject.dart' as db;
class SubjectPage extends StatefulWidget {
  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  List<m.Subject> subjects=db.subjects;
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (ctx,index){
        var subj=subjects[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => SubjcetDetailpage()),);
          },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeInImage.memoryNetwork(placeholder:  kTransparentImage, image: subj.imgUrl,fit: BoxFit.cover,height: 130,),
                Container(
                  child: Text(subj.name),
                  padding: EdgeInsets.all(5),
                )
              ],
            ),
          ),
        );
      },

    );
  }
}


