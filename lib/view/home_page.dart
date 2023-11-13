import 'package:extracting_data_from_the_internet/controller/controller.dart';
import 'package:extracting_data_from_the_internet/controller/widgets.dart';
import 'package:extracting_data_from_the_internet/view/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controller = ChangeNotifierProvider((ref) => Controller());

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(controller).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var read = ref.watch(controller);
    var watch = ref.watch(controller);

    return MaterialApp(
      title: 'Sosyal Medya Uygulaması',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Center(
            child: Text(
              'Sosyal Medya Uygulaması',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Trajan Pro',
                fontWeight: FontWeight.bold,
                wordSpacing: 5.0,
                letterSpacing: 1.0,
              ),
            ),
          ),
          //leading: const DrawerWidget(),
        ),
        body: LoadingWidget(
          isLoading: watch.isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: OutlinedButton(
                        onPressed: () => read.profileButton(),
                        child: Text(
                          'Profil (${watch.users.length})',
                          style: const TextStyle(),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 6,
                      child: OutlinedButton(
                        onPressed: () => read.notSavedButton(),
                        child: Text(
                          'Kullanıcı (${watch.users.length})',
                          style: const TextStyle(),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 6,
                      child: OutlinedButton(
                        onPressed: () => read.savedButton(),
                        child: Text(
                          'Takip (${watch.saved.length})',
                          style: const TextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  thickness: 5.0,
                ),
                Expanded(
                  child: PageView(
                    controller: watch.pageController,
                    children: [
                      profile(watch),
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
}
