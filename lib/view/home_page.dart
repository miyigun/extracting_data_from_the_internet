

import 'package:extracting_data_from_the_internet/controller/controller.dart';
import 'package:extracting_data_from_the_internet/view/loading_widget.dart';
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
    //var read=ref.watch(controller);
    var watch=ref.watch(controller);

    return MaterialApp(
      title: 'Extracting Data from the Internet',
      debugShowCheckedModeBanner: false,
      home : Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
              'Extracting Data from the Internet',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: LoadingWidget(
          isLoading: watch.isLoading,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: PageView(
                  controller: watch.pageController,
                  children: [
                    notSaved(watch),
                    saved(watch),


                  ],

                ),
              ),
            ],
          ),
        ),
      ),
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
                      icon: const Icon(Icons.send_and_archive_outlined),
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
              icon: const Icon(Icons.send_and_archive_outlined),
              onPressed: ()=> watch.addSaved(watch.saved[index]!),
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
  
}