import 'package:flutter/material.dart';
import '../datasource.dart';
class FAQpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('FAQs'),
      ),
      body: ListView.builder(
        itemCount: Datasource.questionAnswers.length,
        itemBuilder: (context,index){
          return ExpansionTile(
            title: Text(Datasource.questionAnswers[index]['question'],style: TextStyle(fontWeight: FontWeight.bold),),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(Datasource.questionAnswers[index]['answer']),
              ),
            ],
          );
        }
      ),
    );
  }
}