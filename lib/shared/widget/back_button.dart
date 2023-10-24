import 'package:flutter/material.dart';

import '../../consatant/ColorConstant.dart';

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: CustomColor.white,
      elevation: 0,
      //shadowColor: CustomColor.black.withOpacity(0.3),
      color: CustomColor.white,
      shape: CircleBorder(),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        splashColor: CustomColor.clickGrayColor, // Splash color
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SizedBox(
            width: 42,
            height: 42,
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 17, top: 14, bottom: 14),
              child: Image.asset("assets/images/Back.png"),
            )),
      ),
    );
  }
}
