import 'package:book_my_turf_dashboard/routing/app_routes.dart';
import 'package:book_my_turf_dashboard/shared/widget/shared_small_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:paged_datatable/paged_datatable.dart';
import '../../../../consatant/Constants.dart';
import '../../../../utility/utility.dart';
import '../../home_screen.dart';
import '../controller/owner_controller.dart';


class OwnerListScreen extends HookConsumerWidget {
  OwnerListScreen({super.key});

  final controller = PagedDataTableController<int, Map<dynamic, dynamic>>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var defaultText = TextStyle(color: Theme.of(context).colorScheme.onBackground);

    var sizeFactor = 0.16;

    var txtController = useTextEditingController();

    var deletedOwnerList = useState([]);

    return  PagedDataTable<int, Map>(
      controller: controller,
      theme: PagedDataTableThemeData(
          configuration: const PagedDataTableConfiguration(initialPageSize: 50,pageSizes: [10,20,50,100],),
          footerTextStyle: Theme.of(context).textTheme.bodyMedium,
          headerTextStyle: Theme.of(context).textTheme.titleLarge,
          rowsTextStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText,
          dividerColor: Theme.of(context).secondaryHeaderColor,
          border: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Theme.of(context).primaryColor)),
          backgroundColor: Theme.of(context).colorScheme.background,
          textStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText),
      fetchPage: (pageToken, pageSize, sortBy, filtering) async {
        deletedOwnerList.value = await Constants.supabase.from(SupaTables.owner_profile).select('id').neq('deletaed_at',null);
        var users;
        if(ref.read(ownerSearchValueProvider).isNotEmpty){
          if(hasNumber(ref.read(ownerSearchValueProvider)))   // execute when enter phone-number
              {
            users = await Constants.supabase.from(SupaTables.owner_profile).select().is_('deletaed_at', null).ilike('phone', "%+91 ${ref.read(ownerSearchValueProvider)}%");
          }
          else  // execute when enter username
              {
            users = await Constants.supabase
                .from(SupaTables.owner_profile)
                .select().is_('deletaed_at', null)
                .ilike('name',"%${ref.read(ownerSearchValueProvider)}%");
          }
        }
        else
        {
          users = await Constants.supabase.from(SupaTables.owner_profile).select().is_('deletaed_at', null).range(pageToken, pageToken + pageSize);
        }

        return PaginationResult.items(elements: [...users], nextPageToken: (users).length < pageSize  ? null : pageToken + pageSize, size: (users).length);

        },
      initialPage: 0,
      header: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormFieldWithDottedBorder(context, txtController, "Search by name",onChanged: (p0) async {

          ref.read(ownerSearchValueProvider.notifier).state = p0;
          controller.refresh();

        },),
      ),
      footer: Text("Deleted Owners Count - ${deletedOwnerList.value.length}"),
      columns: [

        TableColumn(
          sizeFactor: sizeFactor,
          title: 'Name',
          cellBuilder: (p0) {
            return Text("${p0['name']}");
          },
        ),
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'Email',
          cellBuilder: (p0) {
            return Text("${p0['email']}");
          },
        ),
        TableColumn(
          sizeFactor:sizeFactor,
          title: 'Phone',
          cellBuilder: (p0) {
            return Text("${p0['phone']}");
          },
        ),
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'DateOfBirth',
          cellBuilder: (p0) {
            return Text(p0['dateOfBirth'] !=null ? "${p0['dateOfBirth']}" : "-");
          },
        ),
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'Gender',
          cellBuilder: (p0) {
            return Text(p0['gender']!=null ? "${p0['gender']}" : "-");
          },
        ),
      ],

    );
  }

}
