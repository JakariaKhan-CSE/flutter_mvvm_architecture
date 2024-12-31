import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/components/round_button.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  // for password obsecure
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  // text controller
  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passwordControler = TextEditingController();

  // for focus(when user click done in keyboard focus move to the next textfield)
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  // ram release (memory issue) very useful
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailControler.dispose();
    _passwordControler.dispose();

    emailFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),centerTitle: true,elevation: 20,),
      body: SafeArea(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailControler,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocus,  // see carefully
            decoration: InputDecoration(
              hintText: 'Enter Email',
              labelText: 'Email',
              prefixIcon: Icon(Icons.email)
            ),
            // when user done btn click then trigger this function
            onFieldSubmitted: (value) {
              // See carefully for focus change next field
            //  FocusScope.of(context).requestFocus(passwordFocus);  // move to passwordFocus

              // Using Utils
              Utils.fieldFocusChange(context, emailFocus, passwordFocus);

            },
          ),
          // this is very useful. See carefully
          ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, value, child) {
                return  TextFormField(
                  controller: _passwordControler,
                  obscureText: _obsecurePassword.value,  // important
                  obscuringCharacter: 'x',
                  focusNode: passwordFocus,  //  see carefully
                  decoration: InputDecoration(

                      hintText: 'Enter Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(onPressed: (){
                      _obsecurePassword.value = !_obsecurePassword.value;
                    }, icon: _obsecurePassword.value ? Icon(Icons.visibility_off) : Icon(Icons.visibility))
                  ),
                );
              },),

          SizedBox(height: 20,),
          RoundButton(title: 'Button',onPressed: (){
            if(_emailControler.text.isEmpty)
              {
                Utils.snackBarMessage(context, 'Please enter email');
              }
            else if(_passwordControler.text.isEmpty)
            {
              Utils.snackBarMessage(context, 'Please enter password');
            }
            else if(_passwordControler.text.length < 6)
            {
              Utils.snackBarMessage(context, 'Please enter 6 digit password');
            }
            else{
              print('API hit');
            }
          },)


        ],
      )),
    );
  }
}
