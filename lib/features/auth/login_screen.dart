import 'dart:async';

import 'package:book_my_turf_dashboard/consatant/Constants.dart';
import 'package:book_my_turf_dashboard/shared/widget/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../consatant/ColorConstant.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/shared_small_widgets.dart';
import '../../../utility/utility.dart';
import '../../routing/go_app_routes.dart';



class LoginScreen extends HookConsumerWidget {

  @override
  Widget build(BuildContext context,ref) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: CustomColor.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: CustomColor.white
    ));
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(
            flex: 8,
            child: isDarktheme.value ? CustomImageView(imagePath: 'assets/images/splash_dark_logo (1).png',) : CustomImageView(imagePath: "assets/images/splash_light_logo (1).png",),
          ),
          Flexible(
            flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Form(
                    key: formKey,
                    child: AutofillGroup(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Text("Login",style: TextStyle(color: CustomColor.primaryGreen,fontSize: 40,fontWeight: FontWeight.w900),),
                          ),
                          TextFormFieldWithDottedBorder(context, emailController, "Email",validator: (value) {
                            if(value!.isEmpty){
                              return "Email is requered";
                            }
                          },),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0,bottom: 25),
                            child: TextFormFieldWithDottedBorder(context, passwordController, "Pass",validator: (value) {
                              if(value!.isEmpty){
                                return "Pass is requered";
                              }
                            },),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: CustomButton('Continue', () async {


                               if(formKey.currentState!.validate()){
                                 try {
                                   await Constants.supabase.auth.signInWithPassword(password: passwordController.text, email: emailController.text).then(
                                         (value) {

                                       var res = value.user;
                                       if(res !=null){
                                         context.goNamed(AppRoute.home);
                                         // Navigator.push(
                                         //     context,
                                         //     MaterialPageRoute(
                                         //         builder: (context) => RootScreen()));
                                         //Navigator.pushNamed(context, AppRoute.rootScreen);
                                       }
                                     },
                                   );
                                 }  catch (e) {
                                   print(e.toString());

                                 }
                               }


                        }),
                      )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }

}
