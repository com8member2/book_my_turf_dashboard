
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../consatant/ColorConstant.dart';
import 'back_button.dart';
import 'custom_button.dart';
import 'custom_image_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DividerLightPink extends StatelessWidget {
  const DividerLightPink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 10,
      color: CustomColor.txtLightGray,
    );
  }
}

Widget screenHeadingSubtitle(String heading, String subtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 50,
      ),
      Text(
        heading,
        style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: "productsun"),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        subtitle,
        style: const TextStyle(
          fontFamily: "productsun",
          fontSize: 17,
          color: CustomColor.txtLightGray,
        ),
      ),
    ],
  );
}

Widget imageWithTextVertically(String imagePath, String heading,
    {bool isSelected = false,
    double imageRadius = 0.0,
    double imageHeight = 45,
    double imageWidth = 45,
    Color? textColor = CustomColor.txtMediumGray}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomImageView(
        imagePath: '',
        url: imagePath,
        height: imageHeight,
        width: imageWidth,
        color: isSelected ? CustomColor.primaryGreen : null,
        radius: BorderRadius.circular(imageRadius),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Text(
          heading,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: isSelected ? CustomColor.primaryGreen : textColor),
        ),
      )
    ],
  );
}

Widget CommonVerticalDivider(double height,
    {Color? color, double? width = 0, double? thickness = 0.3}) {
  return SizedBox(
    height: height,
    child: VerticalDivider(
      width: width,
      color: color ?? CustomColor.txtLightGray,
      thickness: thickness,
    ),
  );
}

PreferredSizeWidget customAppBarH(
  String heading,
  BuildContext context, {
  Color backgroundColor = Colors.transparent,
  Color textColor = CustomColor.black,
  bool isShawBack = true,
  double? toolbarheight,
  List<Widget>? actions,
}) {
  return AppBar(
    title: Padding(
      padding: EdgeInsets.only(left: !isShawBack ? 8.0 : 0),
      child: Text(heading, textAlign: TextAlign.start),
    ),
    elevation: 0,
    actions: actions,
    backgroundColor: backgroundColor,
    titleSpacing: 12,
    titleTextStyle: Theme.of(context).textTheme.titleMedium,
    leading: isShawBack ? BackButtonCustom() : null,
  );
}

class customAppBar extends HookConsumerWidget {
  final String text;
  final bool showBack;
  final bool showDivider;

  customAppBar(
      {this.text = "",
      super.key,
      this.showBack = true,
      this.showDivider = true}) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            if (showBack)
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: BackButtonCustom(),
              ),
            if (text.isNotEmpty)
              Text(text, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        showDivider
            ? const Divider(color: CustomColor.txtLightGray, thickness: 0.3)
            : const SizedBox()
      ],
    );
  }
}

class SlotWidget extends HookConsumerWidget {
  final String price;
  final bool isAvailable;
  final bool isJoined;
  final bool isBooked;
  final String message;
  final String nameOfBookedBy;
  final String timeOfBookedBy;
  final String unAvailableMessage;

  const SlotWidget({required this.isAvailable, required this.isBooked,
      this.isJoined = false, this.message = "", this.price = "", this.nameOfBookedBy = "", this.timeOfBookedBy = "", this.unAvailableMessage = "",
      Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isSelected = useState(false);
    return SizedBox(
      height: 100 ,
      child: isAvailable ? isBooked ? Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(nameOfBookedBy,
                    style: const TextStyle(color: CustomColor.black, fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Text(timeOfBookedBy,
                        style: const TextStyle(color: CustomColor.txtLightGray, fontSize: 14)),
                  ),
                  isJoined
                      ? const Text("Joined",
                      style: TextStyle(color: CustomColor.primaryGreen, fontSize: 16, fontWeight: FontWeight.bold))
                      : CustomButton("Join Waitlist", () {},
                      width: 110, height: 35, fontSize: 15)
                ]),
          ),
        ],
      ) : InkWell(
        splashColor: CustomColor.clickGrayColor,
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          isSelected.value = !isSelected.value;
        },
        child: DottedBorder(
            color: isSelected.value ? CustomColor.primaryGreen : CustomColor.txtLightGray.withOpacity(0.8),
            dashPattern: [5, 5, 5, 5],
            radius: const Radius.circular(12),
            borderType: BorderType.RRect,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Available",
                          style: TextStyle(
                              fontSize: 16,
                              color: isSelected.value ? CustomColor.primaryGreen : CustomColor.txtLightGray),
                        ),
                        Text("${String.fromCharCode(0x20B9)}${price}",
                            style: TextStyle(
                                fontSize: 16,
                                color:  isSelected.value ? CustomColor.primaryGreen : CustomColor.txtLightGray,
                                fontWeight: isAvailable ? FontWeight.w500 : FontWeight.normal)),
                      ]),
                ),
              ],
            )),
      )
          : Center(child: Text(unAvailableMessage, style: const TextStyle(color: CustomColor.txtMediumGray, fontSize: 14)))
    );
  }
}

Widget TextFormFieldWithDottedBorder(
    BuildContext context, TextEditingController controller, String hint,
    {VoidCallback? onClicked,
    FormFieldValidator<String>? validator,
    bool isEnabled = true,
    bool isReadonly = false,
    Color? txtColor = CustomColor.txtMediumGray, Function(String)? onChanged, List<TextInputFormatter>? inputFormatters, keyBoardType, maxLength}) {
  return DottedBorder(
    dashPattern: const [5, 5, 5, 5],
    radius: const Radius.circular(5),
    borderType: BorderType.RRect,
    color: CustomColor.primaryGreen,
    child: SizedBox(
      height: 45,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: TextFormField(
          controller: controller,
          validator: validator,
          enabled: isEnabled,
          readOnly: isReadonly,
          style: TextStyle(color: txtColor, fontSize: 16, fontWeight: FontWeight.normal),
          onTap: onClicked,
          onChanged: onChanged,
          decoration: InputDecoration(filled: true, hintText: hint, counterText: "",
            fillColor: Theme.of(context).cardColor,
            hintStyle: const TextStyle(color: CustomColor.txtLightGray, fontSize: 16,
                fontWeight: FontWeight.normal),
            border: const OutlineInputBorder(borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          inputFormatters: inputFormatters,
          keyboardType: keyBoardType,
          maxLength: maxLength,
        ),
      ),
    ),
  );
}

// class ImagePickerBottomSheet extends HookConsumerWidget {
//   const ImagePickerBottomSheet({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       color: CustomColor.white,
//       padding: const EdgeInsets.only(
//           left: 30.0, top: 20.0, right: 30.0, bottom: 20.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: CustomButton(
//               tr(context).open_file_manager,
//               () {
//                 Navigator.of(context).pop();
//                 ref
//                     .read(documentControllerProvider.notifier)
//                     .getImageFromGallery();
//               },
//             ),
//           ),
//           CustomButton(
//             tr(context).open_camera,
//             () async {
//               Navigator.of(context).pop();
//               await ref
//                   .read(documentControllerProvider.notifier)
//                   .getImageFromCamera();
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
// class TimeRangeView extends StatelessWidget {
//   const TimeRangeView({
//     super.key,
//     required this.startTimeOfDay,
//     required this.endTimeOfDay, required this.onSelected,
//   });
//
//   final TimeOfDay? startTimeOfDay;
//   final TimeOfDay? endTimeOfDay;
//   final Null Function(TimeRangeResult) onSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     return FilledButton(
//       style: ButtonStyle(
//           backgroundColor:
//           MaterialStatePropertyAll( CustomColor.primaryGreen.withOpacity(0.1)),
//           shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
//           padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 5)),
//           minimumSize: const MaterialStatePropertyAll(Size(20, 34))),
//       onPressed: () {
//         showDialog(
//           context: context,
//           builder: (context) {
//             return HookConsumer(
//               builder: (BuildContext context, WidgetRef ref, Widget? child) {
//                 final ValueNotifier<TimeRangeResult?> range = useValueNotifier(TimeRangeResult(startTimeOfDay!, endTimeOfDay!));
//                 return Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text('Select Time Slot', style: Theme.of(context).textTheme.titleMedium),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 20),
//                         child: TimeRange(
//                             fromTitle: Text('From'),
//                             toTitle: Text("To"),
//                             titlePadding: 20,
//                             textStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87),
//                             activeTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//                             borderColor: CustomColor.primaryGreen,
//                             backgroundColor: Colors.transparent,
//                             activeBackgroundColor: CustomColor.primaryGreen,
//                             initialRange: TimeRangeResult(startTimeOfDay!, endTimeOfDay!),
//                             firstTime: TimeOfDay(hour: 00, minute: 0),
//                             lastTime: TimeOfDay(hour: 24, minute: 00),
//                             timeStep: 30,
//                             timeBlock: int.parse(ref.watch(slotTimeProvider)),
//                             onRangeCompleted: (result) {
//                               if (result != null) {
//                                 range.value = result;
//                               }
//                             }),
//                       ),
//                       ValueListenableBuilder(
//                         valueListenable: range,
//                         builder: (context, value, child) =>
//                             Text('Selected Time Range: ${range.value?.start.format(context)} - ${range.value?.end.format(context)}'),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CustomButton(
//                           'Ok',
//                               () {
//                             if (range.value == null) {
//                               EasyLoading.showToast('Select Time range Please.');
//                             } else {
//                               onSelected(range.value!);
//                               Navigator.pop(context);
//                             }
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             );
//           },
//         );
//       },
//       child: Row(
//         children: [
//           Text((startTimeOfDay ?? TimeOfDay.now()).format(context),
//               style: const TextStyle(color: CustomColor.primaryGreen, letterSpacing: 0, fontSize: 14)),
//           const SizedBox(
//             width: 0,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: const Text('to', style: const TextStyle(color: CustomColor.primaryGreen, letterSpacing: 0, fontSize: 14)),
//           ),
//           Text((endTimeOfDay ?? TimeOfDay.now()).format(context),
//               style: const TextStyle(color: CustomColor.primaryGreen, letterSpacing: 0, fontSize: 14)),
//           const SizedBox(
//             width: 0,
//           ),
//         ],
//       ),
//     );
//   }
// }