import 'package:extracting_data_from_the_internet/controller/controller.dart';
import 'package:extracting_data_from_the_internet/controller/data.dart';
import 'package:flutter/material.dart';

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

ListView profile(Controller watch) {
  return ListView(
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
  );

}

ListView notSaved(Controller watch) {
  return ListView.separated(
    shrinkWrap: true,
    itemCount: watch.users.length,
    itemBuilder: (BuildContext context, int index){
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                watch.users[index]!.avatar!
            ),
            radius: 20,
          ),
          title: Text(
            "${watch.users[index]!.firstName ?? ''} ${watch.users[index]!.lastName ?? ''}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            watch.users[index]!.email ?? '',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.grey.shade400,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.add_sharp),
            onPressed: ()=> watch.addSaved(watch.users[index]!),
          ),
        ),
      );
    },
    separatorBuilder: (BuildContext context, int index){
      return const SizedBox(
        height: 15,
      );
    },

  );
}

ListView saved(Controller watch) {
  return ListView.separated(
    shrinkWrap: true,
    itemCount: watch.saved.length,
    itemBuilder: (BuildContext context, int index){
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                watch.saved[index]!.avatar!
            ),
            radius: 20,
          ),
          title: Text(
            "${watch.saved[index]!.firstName ?? ''} ${watch.saved[index]!.lastName ?? ''}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            watch.saved[index]!.email ?? '',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.grey.shade400,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_sharp),
            onPressed: ()=> watch.deleteSaved(watch.saved[index]!),
          ),
        ),
      );
    },
    separatorBuilder: (BuildContext context, int index){
      return const SizedBox(
        height: 15,
      );
    },

  );
}