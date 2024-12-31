import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_architecture/repository/auth_repository.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';
// With is used to include Mixins. A mixin is a different type of structure, which can only be used with the keyword with.

// this class called by view
class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  // for loading status show on button
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }


  Future<void> loginApi(dynamic data, BuildContext context)async{
setLoading(true); // when api hit show loading
    _myRepo.loginApi(data).then((value) {
      setLoading(false); // when get response lading button false
      Utils.snackBarMessage(context, 'Login Successful');
      // successfully login then navigate to homepage
      Navigator.of(context).pushNamed(RoutesName.home);
      // app debug mode a thakle ai print ta kaj korbe, release ba production mode a kaj korbe na
      // very useful to ensure print work only debug mode
      if(kDebugMode){
        /*
        I/flutter (19489): print success code
I/flutter (19489): {token: QpwL5tke4Pnpja7X4}
         */
        print('print success code');
        print(value.toString());  // success message
      }

    },).onError((error, stackTrace) {
      setLoading(false);
      Utils.snackBarMessage(context, error.toString());
      if(kDebugMode){
        print(error.toString());  // error message
      }

    },);
  }
}