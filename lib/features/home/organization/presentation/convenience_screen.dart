import 'package:book_my_turf_dashboard/features/home/organization/controller/organitation_controller.dart';
import 'package:book_my_turf_dashboard/routing/app_routes.dart';
import 'package:book_my_turf_dashboard/shared/widget/shared_small_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../consatant/Constants.dart';
import '../../../../../utility/utility.dart';


class ConvenienceScreen extends HookConsumerWidget {
  ConvenienceScreen({super.key});

  final controller = PagedDataTableController<int, Map<dynamic, dynamic>>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var defaultText = TextStyle(color: Theme.of(context).colorScheme.onBackground);

    var sizeFactor = 0.33;

    var txtController = useTextEditingController();

    var users = useState([]);

    //var limit = useState(4);

    return PagedDataTable<int, Map>(
      // filters: [TextTableFilter(chipFormatter: (value) => 'By $value', id: 'name', title: 'Trainer\'s Name')],TODO pending
      controller: controller,
      theme: PagedDataTableThemeData(
          configuration: const PagedDataTableConfiguration(initialPageSize: 50,pageSizes: [10,20,50,1000],),
          footerTextStyle: Theme.of(context).textTheme.bodyMedium,
          headerTextStyle: Theme.of(context).textTheme.titleLarge,
          rowsTextStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText,
          dividerColor: Theme.of(context).secondaryHeaderColor,
          border: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Theme.of(context).primaryColor)),
          backgroundColor: Theme.of(context).colorScheme.background,
          textStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText),
      fetchPage: (pageToken, pageSize, sortBy, filtering) async {

        if(ref.read(convenienceCityProvider).isEmpty){
          users.value = await Constants.supabase.from(SupaTables.convenience_fee).select().order('city_name',ascending: true).range(pageToken, pageToken + pageSize);
        }
        else
          {
            users.value = await Constants.supabase.from(SupaTables.convenience_fee).select().ilike('city_name', "%${ref.read(convenienceCityProvider)}%");
          }

        return PaginationResult.items(elements: [...users.value], nextPageToken: (users.value).length < pageSize  ? null : pageToken + pageSize, size: (users.value).length);

      },
      initialPage: 0,
      header: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormFieldWithDottedBorder(context, txtController, "Search",onChanged: (p0) async {

          ref.read(convenienceCityProvider.notifier).state = p0;
          controller.refresh();

        },),
      ),
      columns: [
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'City',
          cellBuilder: (p0) {
            return Text("${p0['city_name']}");
          },
        ),
        LargeTextTableColumn(
          decoration: InputDecoration(enabled: true),
          sizeFactor: sizeFactor,
          title: 'User fees',
          getter: (Map<dynamic, dynamic> item) {
            return item['user_fee'].toString();
          },
          setter: (Map<dynamic, dynamic> item, String newValue, int rowIndex) async {
            controller.selectRow(rowIndex);
            await Constants.supabase.from(SupaTables.convenience_fee).update({'user_fee' : newValue}).match({'id' : item['id']}).then((value) {
              controller.unselectAllRows();
            },);
            return true;
          },
        ),
        LargeTextTableColumn(
          decoration: InputDecoration(enabled: true),
          sizeFactor: sizeFactor,
          title: 'Owner fees',
          getter: (Map<dynamic, dynamic> item) {
            return item['owner_fee'].toString();
          },
          setter: (Map<dynamic, dynamic> item, String newValue, int rowIndex) async {
            controller.selectRow(rowIndex);
            await Constants.supabase.from(SupaTables.convenience_fee).update({'owner_fee' : newValue}).match({'id' : item['id']}).then((value) {
              controller.unselectAllRows();
            },);
            return true;
          },
        ),
      ],

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
