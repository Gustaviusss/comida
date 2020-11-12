import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function _saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this._saveFilters,this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  
  @override
  void initState() { 
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
    
  }

  Widget _switchListTile(String title, String subtitle,bool controller,Function func){
    return SwitchListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            value: controller,
            onChanged:func
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions:<Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final selectedFilters ={
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget._saveFilters(selectedFilters);
              Navigator.of(context).pushReplacementNamed('/');
            })
        ]
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust your meal selection',
            style: Theme.of(context).textTheme.title,
          )
        ),
        Expanded(child: ListView(children: <Widget>[
          _switchListTile('Gluten-Free','Only includes gluten-free meals',_glutenFree,(newValue){setState((){_glutenFree = newValue;});}),
          _switchListTile('Lactose-Free','Only includes lactose-free meals',_lactoseFree,(newValue){setState((){_lactoseFree = newValue;});}),
          _switchListTile('Vegetarian','Only includes vegetarian meals',_vegetarian,(newValue){setState((){_vegetarian = newValue;});}),
          _switchListTile('Vegan','Only includes vegan meals',_vegan,(newValue){setState((){_vegan = newValue;});}),
        ],))
      ],)
    );
  }
}