
import 'package:book_my_turf_dashboard/shared/widget/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoInternetScreen extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Center(child: CustomImageView(imagePath: "assets/images/no_internet.png",)),);
  }

}