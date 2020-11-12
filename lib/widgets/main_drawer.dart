import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget drawer_tile(BuildContext ctx, String title, IconData icon,String route){
    return ListTile(
            leading: Icon(icon, size: 26),
            title: Text(title,style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize:24,
              fontWeight: FontWeight.bold
            ),),
            onTap: (){
              Navigator.of(ctx).pushReplacementNamed(route);
            },
          );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              bottomLeft:Radius.circular(15),
              bottomRight: Radius.circular(15))
            ),
            child: Text('Cooking Up!',style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),),
          ),
          SizedBox(height: 20),
          drawer_tile(context,'Meals', Icons.restaurant, '/'),
          drawer_tile(context,'Filters', Icons.settings,FiltersScreen.routeName)
        ],
      ),
    );
  }
}