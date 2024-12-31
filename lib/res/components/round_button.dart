import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,  // user not update by default false thakbe
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        // loading a thakle circular progress dekhabe
        child: Center(child: loading ? CircularProgressIndicator() : Text(title,style: TextStyle(
          color: AppColors.whiteColor
        ),)),
      ),
    );
  }
}
