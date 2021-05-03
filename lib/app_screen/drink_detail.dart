import 'package:flutter/material.dart';
import 'package:practical/main.dart';

class DrinkDetail extends StatelessWidget {
  final drink;

  const DrinkDetail({Key key, @required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(drink["strDrink"]),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                  tag: drink["idDrink"],
                  child: CircleAvatar(
                      radius: 100.0,
                      backgroundImage: NetworkImage(drink["strDrinkThumb"]))),
              SizedBox(height: 30.0),
              Text(
                "${drink["idDrink"]}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 30.0),

              Text(
                "${drink["strDrink"]}",
                style: TextStyle(color: Colors.white, fontSize: 20.0,fontFamily: 'Raleway',fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
