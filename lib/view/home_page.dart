

import 'package:extracting_data_from_the_internet/controller/controller.dart';
import 'package:extracting_data_from_the_internet/view/drawer_widget.dart';
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
    var read=ref.watch(controller);
    var watch=ref.watch(controller);

    return MaterialApp(
      title: 'Sosyal Medya Uygulaması',
      debugShowCheckedModeBanner: false,
      home : Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
              'Sosyal Medya Uygulaması',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Trajan Pro',
              fontWeight: FontWeight.bold,
              wordSpacing: 5.0,
              letterSpacing: 1.0,
            ),
          ),
          leading: const DrawerWidget(),
        ),
        body: LoadingWidget(
          isLoading: watch.isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: OutlinedButton(
                        onPressed: ()=> read.notSavedButton(),
                        child: Text(
                          'Profil (${watch.users.length})',
                          style: const TextStyle(

                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 6,
                      child: OutlinedButton(
                          onPressed: ()=> read.notSavedButton(),
                          child: Text(
                            'Kullanıcı (${watch.users.length})',
                            style: const TextStyle(

                            ),
                          ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 6,
                      child: OutlinedButton(
                        onPressed: ()=> read.savedButton(),
                        child: Text(
                          'Takip (${watch.saved.length})',
                          style: const TextStyle(

                          ),
                        ),
                      ),
                    ),
                  ],
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
      ),
    );
  }

  ListView profile(Controller watch) {
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
  
}