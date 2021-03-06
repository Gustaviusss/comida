import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-details';
  // final Function toggleFavorite;
  // final Function isFavorite;
  
  //MealDetailScreen(this.toggleFavorite,this.isFavorite);

  bool selectIngredients = true;

 

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    
    final mediaQuery = MediaQuery.of(context);
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal)=>meal.id == mealId);
   
    Widget _button(String title, bool selected, Function func){
      return  GestureDetector(
        onTap: func, 
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(8),
            border: selected?Border.all(color: Colors.black,width: 4):null
          ),
          width: 150,
          height: 50,
          child: Center(
            child: Text(title,
            style: TextStyle(
              fontSize:18,
              fontWeight: FontWeight.bold,
              color: Colors.black
            )
            ),
          ),
        ),
        
      );
    }
    Widget _listContainer(){
      return Container(
          height: (mediaQuery.size.height - mediaQuery.padding.top)*0.35,
          width: 300,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,width: 4),
              borderRadius: BorderRadius.circular(10)),
          child: widget.selectIngredients
          ? ListView.builder(
            itemCount: selectedMeal.ingredients.length,
            itemBuilder: (ctx,index)=> Card(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                  child: Text(
                    selectedMeal.ingredients[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20),)),))
          : ListView.builder(
            itemCount: selectedMeal.steps.length,
            itemBuilder:(ctx,index) => ListTile(
              leading: CircleAvatar(child: Text('#${index+1}',style: TextStyle(color: Colors.white),),backgroundColor: Theme.of(context).primaryColor,),
              title: Text(selectedMeal.steps[index], style: TextStyle(fontSize: 18,color: Colors.black),),
            )
          )
      );
    }
    Widget _imageContainer(){
      return Container(
          margin: EdgeInsets.all(10),
          height: 200,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
                      child: Image.network(selectedMeal.imageUrl,
            fit: BoxFit.cover,
            ),
          ),
        );
    }
    Widget _buttonsContainer(){
      return Center(child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _button('Ingredients',widget.selectIngredients,(){
              setState(() {
              widget.selectIngredients = true;
            });
            // print('$selectIngredients');
            }),
            _button('Steps',!widget.selectIngredients,(){
              setState(() {
              widget.selectIngredients = false;
            });
            // print('$selectIngredients');
            })
          ],),);
    }
    Widget _titleContainer(){
      return Container(
          margin: EdgeInsets.all(10),
          child: Center(
            child: Text(widget.selectIngredients?'Ingredients':'Steps',
            style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold))));
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        // actions: <Widget>[
        //   IconButton(icon:Icon(Icons.star_border), onPressed: ()=>widget.isFavorite(mealId))
        // ],
      ),
      body:Column(
        children: <Widget>[
          _imageContainer(),
          _buttonsContainer(),
          _titleContainer(),
          _listContainer()
        ]
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     widget.toggleFavorite(mealId)? Icons.star : Icons.star_border
      //     ),
      //   onPressed: ()=> widget.isFavorite(mealId),
      // ),
    );
  }
}
