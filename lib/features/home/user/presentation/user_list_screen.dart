import 'package:book_my_turf_dashboard/features/home/user/controller/user_controller.dart';
import 'package:book_my_turf_dashboard/routing/app_routes.dart';
import 'package:book_my_turf_dashboard/utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:paged_datatable/paged_datatable.dart';
import '../../../../consatant/Constants.dart';
import '../../../../shared/widget/shared_small_widgets.dart';
import '../../home_screen.dart';

class UserListScreen extends HookConsumerWidget {
   UserListScreen({super.key});

  final controller = PagedDataTableController<int, Map<dynamic, dynamic>>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var defaultText = TextStyle(color: Theme.of(context).colorScheme.onBackground);

    var sizeFactor = 0.14;

    var txtController = useTextEditingController();
    
    var deletedUserCount = useState([]);
    
    return PagedDataTable<int, Map>(
      controller: controller,
      theme: PagedDataTableThemeData(
          configuration: const PagedDataTableConfiguration(initialPageSize: 10,pageSizes: [10,20,50,100],),
          footerTextStyle: Theme.of(context).textTheme.bodyMedium,
          headerTextStyle: Theme.of(context).textTheme.titleLarge,
          rowsTextStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText,
          dividerColor: Theme.of(context).secondaryHeaderColor,
          border: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Theme.of(context).primaryColor)),
          backgroundColor: Theme.of(context).colorScheme.background,
          textStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText
      ),
      fetchPage: (pageToken, pageSize, sortBy, filtering) async {

        var users ;

        deletedUserCount.value = await Constants.supabase.from(SupaTables.user_profile).select('id').neq('deletaed_at',null);


        if (ref.read(userSearchValueProvider).isNotEmpty) {
          if (hasNumber(ref.read(userSearchValueProvider))) // execute when enter phone-number
          {
            users = await Constants.supabase
                .from(SupaTables.user_profile)
                .select()
                .ilike('phone', "%${ref.read(userSearchValueProvider)}%").is_('deletaed_at', null)
                .range(pageToken, pageToken + pageSize);
          }
          else // execute when enter username
          {
            users = await Constants.supabase
                .from(SupaTables.user_profile)
                .select()
                .ilike('name', "%${ref.read(userSearchValueProvider)}%").is_('deletaed_at', null)
                .range(pageToken, pageToken + pageSize);
          }
        }


        else
        {
          print("in else ${users}");
          users = await Constants.supabase.from(SupaTables.user_profile).select().is_('deletaed_at', null).range(pageToken, pageToken + pageSize);
        }

        print("users ${users}");

        return PaginationResult.items(elements: [...users], nextPageToken: (users).length < pageSize  ? null : pageToken + pageSize, size: (users as List).length);
      },
      initialPage: 0,
      header: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormFieldWithDottedBorder(context, txtController, "Search by user name",onChanged: (p0) async {

          ref.read(userSearchValueProvider.notifier).state = p0;
          controller.refresh();

        },),
      ),
      footer: Text("Deleted User Count - ${deletedUserCount.value.length}"),
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
            return Text("${p0['dateOfBirth']}");
          },
        ),
        TableColumn(
          sizeFactor: 0.04,
          title: 'Gender',
          cellBuilder: (p0) {
            return Text("${p0['gender']}");
          },
        ),
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'City',
          cellBuilder: (p0) {
            return Text(p0['city'] !=null ? "${p0['city']}" : "-");
          },
        ),
        TableColumn(

          sizeFactor: 0.06,
          title: 'Block',
          cellBuilder: (p0) => TextButton(onPressed: () async {

            if(p0['isBlock']==true){
              await Constants.supabase.from(SupaTables.user_profile).update({"isBlock" : false}).match({"id" : p0['id']}).then((value) {
                controller.refresh();
              },);
            }
            else{
              await Constants.supabase.from(SupaTables.user_profile).update({"isBlock" : true}).match({"id" : p0['id']}).then((value) {
                controller.refresh();
              },);
            }

          }, child: Text(p0['isBlock']==true ? "UNBLOCK" : "BLOCK",style: TextStyle(fontSize: 12),)),
        ),

      ],

    );
  }
}
