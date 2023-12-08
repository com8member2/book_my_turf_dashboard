import 'package:book_my_turf_dashboard/shared/widget/custom_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FullScreenImagePreview extends HookConsumerWidget {

  final List<String> urls;
  final int index;

  FullScreenImagePreview(this.urls,this.index);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var counter = useState(index);

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
              tag: 'imageTag',
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(70.0),
                    child: InteractiveViewer(
                      boundaryMargin: EdgeInsets.all(20.0), // Add some margin to the boundary
                      minScale: 0.5, // Set the minimum scale
                      maxScale: 2.5, // Set the maximum scale
                      child: CustomImageView(
                        url: urls[counter.value],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(children: [
                      IconButton(onPressed: () {
                        if(counter.value !=0)
                        counter.value--;
                      },icon: Icon(Icons.arrow_back_ios_outlined)),
                      Spacer(),
                      IconButton(onPressed: () {
                        if(counter.value < urls.length-1){
                          counter.value++;
                        }
                      }, icon: Icon(Icons.arrow_forward_ios)),

                    ],),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}