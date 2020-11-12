import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> avaliableMeals;

  CategoryMealsScreen(this.avaliableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    if(!loadedInitData){
     final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.avaliableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    loadedInitData = true;
    }
    super.didChangeDependencies();
    
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal)=> meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    // final categoryColor = routeArgs['color'];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(categoryTitle),
        ),
        body: 
        // widget.avaliableMeals == null?
        //   Column(children: <Widget>[
        //     Icon(Icons.cloud_off, size: 100,color: Colors.grey,)
        //   ],)
        // :
        ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: displayedMeals[index].id,
                imageUrl: displayedMeals[index].imageUrl,
                title: displayedMeals[index].title,
                duration: displayedMeals[index].duration,
                complexity: displayedMeals[index].complexity,
                affordability: displayedMeals[index].affordability,
                removeItem:_removeMeal,
              );
            },
            itemCount: displayedMeals.length));
  }
}
