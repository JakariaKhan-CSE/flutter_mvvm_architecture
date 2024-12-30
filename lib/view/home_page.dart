import 'package:flutter/material.dart';

import '../utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
