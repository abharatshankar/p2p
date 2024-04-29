 
import 'package:flutter/material.dart';
import 'package:mvvm_app/res/widgets/coloors.dart';

import 'ads_screen.dart';
import 'home_screen.dart';
import 'p2p_page.dart';
import 'wallet_page.dart';

class BottomMenuBar extends StatefulWidget {  
  const BottomMenuBar ({Key? key}) : super(key: key);  
  
  @override  
  _BottomMenuBarState createState() => _BottomMenuBarState();  
}  
  
class _BottomMenuBarState extends State<BottomMenuBar > {  
  int _selectedIndex = 0;  
  static const List<Widget> _widgetOptions = <Widget>[  
    HomeScreen(),  
    P2pPage(),  
    AdsScreen(),
    WalletPage(),  
  ];  
  
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return SafeArea(
      child: Scaffold(  
        // appBar: AppBar(  
        //   // title: const Text('Flutter BottomNavigationBar Example'),  
        //     // backgroundColor: Colors.green  
        // ),  
        body: Center(  
          child: _widgetOptions.elementAt(_selectedIndex),  
        ),  
        bottomNavigationBar: BottomNavigationBar( 
          showUnselectedLabels: false,showSelectedLabels: false, 
          items:  <BottomNavigationBarItem>[  
             
            BottomNavigationBarItem(  
              icon: Column(
                children: [
                  Icon(Icons.search,color: Colors.grey,),
                  Text('P2P',style: TextStyle(fontWeight: FontWeight.normal),),
                ],
              ), 

              label: '',
              activeIcon: Column(
                children: [
                  Icon(Icons.search,color: AppColors.themeBlueColor,),
                  Text('P2P',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.themeBlueColor,),)
                ],
              )
              // backgroundColor: Colors.yellow  
            ),  
            BottomNavigationBarItem(  
              icon: Column(
                children: [
                  Icon(Icons.home,color: Colors.grey,),
                  Text('Orders',style: TextStyle(fontWeight: FontWeight.normal),),
                ],
              ),  
              label: '',  
              backgroundColor: Colors.white  ,
              activeIcon: Column(
                children: [
                  Icon(Icons.home,color: AppColors.themeBlueColor,),
                  Text('Orders',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.themeBlueColor,),),
                ],
              )
            ), 
            BottomNavigationBarItem(  
              icon: Column(
                children: [
                  Icon(Icons.home,color: Colors.grey,),
                  Text('Ads',style: TextStyle(fontWeight: FontWeight.normal),),
                ],
              ),  
              label: '',  
              backgroundColor: Colors.white  ,
              activeIcon: Column(
                children: [
                  Icon(Icons.home,color: AppColors.themeBlueColor,),
                  Text('Ads',style: TextStyle(fontWeight: FontWeight.normal,color: AppColors.themeBlueColor,),),
                ],
              )
            ), 
            BottomNavigationBarItem(  
              icon: Column(
                children: [
                  Image.asset('assets/wallet_selected.png'),
                  Text('Wallet',style: TextStyle(fontWeight: FontWeight.normal),),
                ],
              ),  
              label: '',  
              activeIcon: Column(
                children: [
                  Icon(Icons.person,color: AppColors.themeBlueColor,),
                   Text('Wallet',style: TextStyle(fontWeight: FontWeight.normal,color: AppColors.themeBlueColor,),),
                ],
              )
              // backgroundColor: Colors.blue,  
            ),  
          ],  
          type: BottomNavigationBarType.shifting,  
          currentIndex: _selectedIndex,  
          selectedItemColor: Colors.black,  
          // iconSize: 30,  
          onTap: _onItemTapped,  
          // elevation: 5  
        ),  
      ),
    );  
  }  
}  