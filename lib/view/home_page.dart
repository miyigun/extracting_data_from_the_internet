

import 'package:extracting_data_from_the_internet/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controller = ChangeNotifierProvider((ref) => Controller());

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomePageState();
  
}

class HomePageState extends ConsumerState<HomePage>{

  @override
  void initState() {
    ref.read(controller).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watch=ref.watch(controller);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
              "Users",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.separated(
            itemCount: watch.users.length,
              itemBuilder: (BuildContext context, int index){
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      watch.users[index].avatar!
                    ),
                  ),
                  title: Text(
                    "${watch.users[index].firstName ?? ''} ${watch.users[index].lastName ?? ''}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    watch.users[index].email ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              );
              },
              separatorBuilder: (BuildContext context, int index){
                return const SizedBox(
                  height: 15,
                );
              },

          ),
        ],
      ),
    );
  }
  
}