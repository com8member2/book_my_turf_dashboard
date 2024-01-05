import 'dart:async';
import 'dart:developer';

import 'package:book_my_turf_dashboard/features/home/booking/controller/booking_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/src/intl/date_format.dart';
import 'package:book_my_turf_dashboard/features/home/venues/controller/venue_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:paged_datatable/paged_datatable.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../consatant/ColorConstant.dart';
import '../../../../../consatant/Constants.dart';
import '../../../../../shared/widget/custom_button.dart';
import '../../../../../shared/widget/shared_small_widgets.dart';
import '../../../../../utility/utility.dart';

class CouponListScreen extends HookConsumerWidget {
  const CouponListScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(initialPage: 0);
    final pageIndex = useState(0);

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final editItem = useRef<Map<String, dynamic>?>(null);

    useEffect(() {
      Future.delayed(
        Duration(milliseconds: 1),
        () {
          if (editItem.value != null) {
            pageController.animateToPage(1, duration: Duration(milliseconds: 250), curve: Curves.linear);
          }
        },
      );
      pageController.addListener(() {
        if (((pageController.page ?? 0) % 1) != 0) {
          pageIndex.value = pageController.page!.round();
          try {
            formKey.currentState?.reset();
          } catch (e) {
            log(e.toString());
          }
        }
      });
      return null;
    }, []);
    formKey.currentState?.reset();

    return Column(children: [
      SizedBox(height: 30),
      FlutterToggleTab(
        width: 40,
        borderRadius: 12,
        selectedIndex: pageIndex.value,
        selectedBackgroundColors: [Theme.of(context).buttonTheme.colorScheme!.primary],
        unSelectedBackgroundColors: [Theme.of(context).colorScheme.primary.withOpacity(0.2)],
        labels: ['All Coupon', 'Add Coupon'],
        selectedLabelIndex: (index) {
          pageController.animateToPage(index, duration: Duration(milliseconds: 250), curve: Curves.linear);
        },
        isScroll: false,
      ),
      Expanded(
          child: PageView(
        onPageChanged: (value) {
          pageIndex.value = value;
          if (value == 0) {
            formKey.currentState?.reset();
            editItem.value = null;
          }
        },
        controller: pageController,
        children: [
          AllCouponScreen(editItem, pageController),
          AddCoupon(editItem.value, formKey, pageController)
          // ResponsiveDataTable(dataTable: DataTableOptions(headers: headers, buildItem: buildItem), controller: controller),
        ],
      ))
    ]);
  }
}

class AddCoupon extends HookConsumerWidget {
  final editItem;
  final GlobalKey<FormState> formKey;
  final PageController pageController;

  const AddCoupon(this.editItem, this.formKey, this.pageController, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("editItem editItem editItem ${editItem}");

    final selectedDiscountUnit = useState(editItem != null ? editItem['discount_unit'] : 'PERCENTAGE');
    final couponType = useState(editItem != null && editItem['venue_id'] != null ? 'For Venue' : 'Global');

    var venueList = ref.watch(getAllVenuesProvider);

    final isShowVenue = useState(false);

    final titleController = useTextEditingController(text: editItem != null ? editItem['title'] : null);
    final desController = useTextEditingController(text: editItem != null ? editItem['description'] : null);
    final disValueController = useTextEditingController(text: editItem != null ? editItem['discount_value'].toString() : null);
    final couponCodeController = useTextEditingController(text: editItem != null ? editItem['coupon_code'] : null);
    final venueListController = useTextEditingController();
    final fromDateController = useTextEditingController(text: editItem != null ? editItem['valid_from'] : null);
    final toDateController = useTextEditingController(text: editItem != null ? editItem['valid_until'] : null);
    final maxCouponLimitController = useTextEditingController(text: editItem != null ? editItem['maximum_coupon_usage'].toString() : null);
    final maxDisAmountController = useTextEditingController(text: editItem != null ? editItem['maximum_discount_amount'].toString() : null);
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: SizedBox(
            width: 700,
            child: Form(
              key: formKey,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TextFieldWithLable(
                    lable: 'Coupon Title',
                    hint: 'Coupon Title',
                    controller: titleController,
                    isColorBorder: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Coupon Title';
                      }
                      return null;
                    },
                  ),
                  TextFieldWithLable(
                    lable: 'Coupon Description',
                    hint: 'Coupon Description',
                    controller: desController,
                    isColorBorder: true,
                    maxLine: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Coupon Description is required';
                      }
                      return null;
                    },
                  ),
                  Text("Select Coupon Type", style: Theme.of(context).textTheme.titleMedium),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 'Global',
                          groupValue: couponType.value,
                          onChanged: (value) {
                            isShowVenue.value = false;
                            couponType.value = value!;
                          },
                          activeColor: CustomColor.primaryGreen,
                        ),
                        Text(
                          'Global',
                        ),
                        SizedBox(width: 20),
                        Radio(
                          value: 'For Venue',
                          groupValue: couponType.value,
                          onChanged: (value) {
                            isShowVenue.value = true;
                            couponType.value = value!;
                          },
                          activeColor: CustomColor.primaryGreen,
                        ),
                        Text('For Venue'),
                      ],
                    ),
                  ),
                  if (isShowVenue.value == true)
                    venueList.when(
                      data: (venueList) {
                        List<String> venueName = venueList.map((e) => e['venue_name'].toString()).toList();

                        return DropdownWithLabel(
                          selectedItem: venueListController.text,
                          controller: venueListController,
                          itemsList: venueName,
                          hintText: 'Coupon Type',
                          lable: 'Select Coupon Type ',
                        );
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => SizedBox(),
                    ),
                  TextFieldWithLable(
                    lable: 'Coupon Code',
                    hint: 'Coupon Code',
                    keyboardType: TextInputType.number,
                    controller: couponCodeController,
                    isColorBorder: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Coupon Code required';
                      }
                      return null;
                    },
                  ),
                  TextFieldWithLable(
                    lable: 'Discount Value',
                    hint: 'Discount Value',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: disValueController,
                    isColorBorder: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Discount Value required';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text("Select Discount Unit", style: Theme.of(context).textTheme.titleMedium),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 'PERCENTAGE',
                          groupValue: selectedDiscountUnit.value,
                          onChanged: (value) => selectedDiscountUnit.value = value!,
                          activeColor: CustomColor.primaryGreen,
                        ),
                        Text(
                          'PERCENTAGE',
                        ),
                        SizedBox(width: 20),
                        Radio(
                          value: 'CURRENCY',
                          groupValue: selectedDiscountUnit.value,
                          onChanged: (value) => selectedDiscountUnit.value = value!,
                          activeColor: CustomColor.primaryGreen,
                        ),
                        Text('CURRENCY'),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                          child: Divider(
                        thickness: 0.5,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Optional"),
                      ),
                      const Expanded(
                          child: Divider(
                        thickness: 0.5,
                      ))
                    ],
                  ),
                  TextFieldWithLable(
                    lable: 'Valid From',
                    hint: 'Select from date',
                    keyboardType: TextInputType.number,
                    controller: fromDateController,
                    onTap: () async {
                      final DateTime? selectedDate = await showDatePicker(
                          context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365 * 50)));
                      if (selectedDate != null) {
                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                        final String formattedDate = formatter.format(selectedDate);

                        fromDateController.text = formattedDate.toString();
                      }
                    },
                    isColorBorder: true,
                  ),
                  TextFieldWithLable(
                    lable: 'Valid To',
                    hint: 'Select to date',
                    keyboardType: TextInputType.number,
                    controller: toDateController,
                    onTap: () async {
                      final DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now().add(Duration(days: 1)),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365 * 50)));
                      if (selectedDate != null) {
                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                        final String formattedDate = formatter.format(selectedDate);

                        toDateController.text = formattedDate.toString();
                      }
                    },
                    isColorBorder: true,
                  ),
                  TextFieldWithLable(
                    lable: 'Maximum Coupon Usage Limit',
                    hint: 'Maximum Coupon Usage Limit',
                    controller: maxCouponLimitController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    isColorBorder: true,
                  ),
                  if (selectedDiscountUnit.value == 'PERCENTAGE')
                    TextFieldWithLable(
                      lable: 'Maximum Discount Amount',
                      hint: 'Maximum Discount Amount',
                      keyboardType: TextInputType.number,
                      controller: maxDisAmountController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      isColorBorder: true,
                    ),
                  SizedBox(height: 50),
                  CustomButton(editItem != null ? 'Update Coupon' : 'Save Coupon', () async {
                    if (editItem != null) {
                      int? venueId;
                      if (venueListController.text.isNotEmpty) {
                        var res = venueList.value?.firstWhere((element) => element['venue_name'] == venueListController.text);
                        venueId = res['id'];
                      }

                      await Constants.supabase.from(SupaTables.coupons).update({
                        'venue_id': venueId ?? null,
                        'discount_value': disValueController.text,
                        'discount_unit': selectedDiscountUnit.value,
                        'valid_from': fromDateController.text.isNotEmpty ? fromDateController.text : null,
                        'valid_until': toDateController.text.isNotEmpty ? toDateController.text : null,
                        'coupon_code': couponCodeController.text,
                        'maximum_discount_amount': maxDisAmountController.text.isNotEmpty ? maxDisAmountController.text : null,
                        'maximum_coupon_usage': maxCouponLimitController.text.isNotEmpty ? maxCouponLimitController.text : null,
                        'is_global': couponType.value == "Global",
                        'title': titleController.text,
                        'description': desController.text
                      }).match({'id': editItem['id']}).then(
                        (value) {
                          pageController.jumpToPage(0);
                        },
                      ).onError((error, stackTrace) {
                        if (error is PostgrestException) {
                          final postgrestError = error as PostgrestException;
                          if (postgrestError.code == "23505") {
                            EasyLoading.showInfo("Coupon code should be unique so enter coupon code again");
                          }
                          print("postgrestError.code ${postgrestError.code}");
                        }
                      });
                    } else {
                      if (formKey.currentState!.validate()) {
                        int? venueId;
                        if (venueListController.text.isNotEmpty) {
                          var res = venueList.value?.firstWhere((element) => element['venue_name'] == venueListController.text);
                          venueId = res['id'];
                        }
                        // if(DateTime.parse(fromDateController.text.isNotEmpty ? fromDateController.text : "").isBefore(DateTime.parse(toDateController.text.isNotEmpty ? toDateController.text :""))){
                        //
                        // }

                        await Constants.supabase.from(SupaTables.coupons).insert({
                          'venue_id': venueId ?? null,
                          'discount_value': disValueController.text,
                          'discount_unit': selectedDiscountUnit.value,
                          'valid_from': fromDateController.text.isNotEmpty ? fromDateController.text : null,
                          'valid_until': toDateController.text.isNotEmpty ? toDateController.text : null,
                          'coupon_code': couponCodeController.text,
                          'maximum_discount_amount': maxDisAmountController.text.isNotEmpty ? maxDisAmountController.text : null,
                          'maximum_coupon_usage': maxCouponLimitController.text.isNotEmpty ? maxCouponLimitController.text : null,
                          'is_global': couponType.value == "Global",
                          'title': titleController.text,
                          'description': desController.text
                        }).then(
                          (value) {
                            pageController.jumpToPage(0);
                          },
                        ).onError((error, stackTrace) {
                          if (error is PostgrestException) {
                            final postgrestError = error as PostgrestException;
                            if (postgrestError.code == "23505") {
                              EasyLoading.showInfo("Coupon code should be unique so enter coupon code again");
                            }
                            print("postgrestError.code ${postgrestError.code}");
                          }
                        });
                      }
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AllCouponScreen extends HookConsumerWidget {
  final ObjectRef<Map<String, dynamic>?> editItem;
  final PageController pageController;

  AllCouponScreen(this.editItem, this.pageController, {super.key});

  final controller = PagedDataTableController<int, Map<dynamic, dynamic>>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var defaultText = TextStyle(color: Theme.of(context).colorScheme.onBackground);

    var sizeFactor = 0.076;

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          controller.refresh();
        });
      },
    );

    //var limit = useState(4);

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: PagedDataTable<int, Map>(
        controller: controller,
        theme: PagedDataTableThemeData(
            configuration: const PagedDataTableConfiguration(
              initialPageSize: 50,
              pageSizes: [10, 20, 50, 100],
            ),
            footerTextStyle: Theme.of(context).textTheme.bodyMedium,
            headerTextStyle: Theme.of(context).textTheme.titleLarge,
            rowsTextStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText,
            dividerColor: Theme.of(context).secondaryHeaderColor,
            border: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Theme.of(context).primaryColor)),
            backgroundColor: Theme.of(context).colorScheme.background,
            textStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText),
        fetchPage: (pageToken, pageSize, sortBy, filtering) async {
          var coupons;

          coupons = await Constants.supabase.from(SupaTables.coupons).select().range(pageToken, pageToken + pageSize);

          return PaginationResult.items(
              elements: [...coupons], nextPageToken: (coupons).length < pageSize ? null : pageToken + pageSize, size: (coupons).length);
        },
        initialPage: 0,
        columns: [
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Title',
            cellBuilder: (p0) {
              return Text("${p0['title']}");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Description',
            cellBuilder: (p0) {
              return Text("${p0['description']}");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Global Coupon',
            cellBuilder: (p0) {
              return Text("${p0['is_global'] != null ? p0['is_global'] : "-"}");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Coupon Limit',
            cellBuilder: (p0) {
              return Text(p0['maximum_coupon_usage'] != null ? "${p0['maximum_coupon_usage']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Venue Name',
            cellBuilder: (p0) {
              if (p0['venue_id'] != null) {
                return ref.watch(getAllBookingVenueProvider(p0['venue_id'])).when(
                      data: (data) {
                        return Text(data[0]['venue_name']);
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => SizedBox(),
                    );
              } else {
                return Text("-");
              }
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Dis Amount',
            cellBuilder: (p0) {
              return Text(p0['maximum_discount_amount'] != null ? "${p0['maximum_discount_amount']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Coupon Code',
            cellBuilder: (p0) {
              return Text(p0['coupon_code'] != null ? "${p0['coupon_code']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Valid From',
            cellBuilder: (p0) {
              return Text(p0['valid_from'] != null ? "${p0['valid_from']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Valid Until',
            cellBuilder: (p0) {
              return Text(p0['valid_until'] != null ? "${p0['valid_until']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Discount Unit',
            cellBuilder: (p0) {
              return Text(p0['discount_unit'] != null ? "${p0['discount_unit']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Discount Value',
            cellBuilder: (p0) {
              return Text(p0['discount_value'] != null ? "${p0['discount_value']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Edit',
            cellBuilder: (p0) {
              return IconButton(
                  onPressed: () async {
                    editItem.value = p0.cast<String, dynamic>();
                    pageController.jumpToPage(1);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: CustomColor.txtMediumGray,
                    size: 20,
                  ));
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Delete',
            cellBuilder: (p0) {
              return IconButton(
                  onPressed: () async {
                    showConfirmationDialog(
                      context,
                      "Are you sure want to delete this coupon",
                      () {
                        Constants.supabase.from(SupaTables.coupons).delete().eq("id", p0['id']).then(
                          (value) {
                            controller.refresh();
                          },
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ));
            },
          ),
        ],
      ),
    );
  }

  List<dynamic> _filterCities(List<dynamic> cities, query) {
    if (query.isEmpty) {
      return cities;
    } else {
      return cities.where((city) => city['phone'].toLowerCase().contains(query)).toList();
    }
  }
}
