import 'package:flutter/material.dart';

import '../utils/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.withAlpha(150),
      body: Center(
        child: InkWell(
            onTap: (){
              Utils.snackBarMessage(context, 'This is test snackbar message');

            },
            child: Text('Show snackbar',style: TextStyle(color: Colors.white,fontSize: 22),)),
      ),
    );
  }
}
