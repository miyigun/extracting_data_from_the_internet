

import 'package:extracting_data_from_the_internet/controller/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerWidget extends ConsumerWidget{
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [

          const DrawerHeader(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.amber,
              gradient: LinearGradient(
                  colors: [Colors.blue,Colors.red]
              ),),
            child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage("assets/images/avatar.jpg"),
                    ),
//Icon(Icons.person, size: 75),
                    Text("Murat İyigün", style: TextStyle(fontSize: 25.0)),
                    SizedBox(height: 10),
                    Text("miyigun@hotmail.com", style: TextStyle(fontSize: 15.0))
                  ],
                )
            ),
          ),

          for (int index=0; index<menuItemList.length; index++)
            drawerMenu(index, menuItemList[index], iconList[index]),

        ],
      ),
    );
  }

  drawerMenu(index, title , icon) {
    return Padding(
      padding: EdgeInsets.zero,
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        onTap: (){
          /*switch(index) {
          case 0:
            Get.to(const MainScreen());
            break;
          case 1:
            Get.to(const Profile());
            break;
          case 2:
            Get.to(const LogOut());
            break;
        }*/
        },
      ),
    );
  }

}




