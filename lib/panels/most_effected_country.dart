import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            child: Row(children: <Widget>[
              Image.network(
                countryData[index]['countryInfo']['flag'],
                height: 25,
                width: 35,
              ),
              SizedBox(width: 20),
              Text(
                countryData[index]['countryInfo']['iso3'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              Text(
                'Deaths: ' + countryData[index]['deaths'].toString(),
                style: TextStyle(color: Colors.red),
              ),
            ]),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
