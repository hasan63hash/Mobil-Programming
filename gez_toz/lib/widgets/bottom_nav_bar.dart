import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {

  int currentIndex;
  MyBottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    void Function(int) _onItemTapped = (int index) {
      switch(index){
        case 0:
          Navigator.of(context).pushReplacementNamed("/home");
          break;
        case 1:
          Navigator.of(context).pushReplacementNamed("/explore");
          break;
        case 2:
          Navigator.of(context).pushReplacementNamed("/post");
          break;
        case 3:
          Navigator.of(context).pushReplacementNamed("/profile");
          break;
        default:
          break;
      }
    };

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: "",
        ),
      ],
      unselectedItemColor: Colors.blue,
      selectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: _onItemTapped,
      currentIndex: currentIndex,
    );
  }
}

