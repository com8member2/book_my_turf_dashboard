
import 'package:flutter/cupertino.dart';

import '../../utility/utility.dart';
import 'custom_button.dart';

class CommonBottomButton extends StatelessWidget{

  final String text;
  final VoidCallback onTap;

  const CommonBottomButton(this.text, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        decoration: shadow(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: CustomButton(text, height: 45, fontSize: 20, (){onTap();}),
        ),
      ),
    );
  }
}