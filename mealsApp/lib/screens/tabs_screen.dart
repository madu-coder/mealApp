import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favourites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal>favoriteMeals;
  TabsScreen (this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List <Map<String,Object>> _pages ;

  int _selectedPageIndex = 0;

  @override
  void initState() {
   _pages =  [

    {
      'page':CategoriesScreen(),
    'title':'Categories'
    },

    {
      'page':FavouritesScreen(widget.favoriteMeals),
    'title':'Your Favourite'
    },

  ];
    super.initState();
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
       child: Scaffold(
      appBar: AppBar(
        title:Text(_pages[_selectedPageIndex]['title']),   
    ),
    drawer: MainDrawer(),
    body:_pages[_selectedPageIndex]['page'],

    bottomNavigationBar: BottomNavigationBar(
      onTap:_selectPage ,
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.white,
      selectedItemColor: Theme.of(context).accentColor,
      currentIndex: _selectedPageIndex,
      type:BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          backgroundColor:Theme.of(context).primaryColor ,
          icon: Icon( Icons.category),
          title: Text('Categories'),

        ),

        BottomNavigationBarItem(
          icon: Icon( Icons.star),
          title: Text('Favourites'),

        ),
      ],
    ),
    ),
    );
  }
}