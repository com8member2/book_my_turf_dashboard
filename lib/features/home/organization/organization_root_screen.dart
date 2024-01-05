import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/go_app_routes.dart';

class OrganizationRootScreen extends StatelessWidget {
  final Widget child;
  final String? path;
  const OrganizationRootScreen({super.key, required this.child, this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(path.toString())),
      body: Row(children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 150,
              child: Theme(
                data: Theme.of(context).copyWith(
                    chipTheme:
                    ChipThemeData(selectedColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1), labelStyle: Theme.of(context).textTheme.titleSmall)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChoiceChip.elevated(
                      showCheckmark: false,
                      selectedColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                      selected: path == '/Organization',
                      onSelected: (value) {
                        if (value) {
                          context.goNamed(AppRoute.appSettingsScreen);
                        }
                      },
                      label: Text('App Settings', style: Theme.of(context).textTheme.titleSmall),
                    ),
                    SizedBox(height: 8),
                    ChoiceChip.elevated(
                      showCheckmark: false,
                      selected: path == '/ConvenienceFeesScreen',
                      onSelected: (value) {
                        if (value) {
                          context.goNamed(AppRoute.convenienceFeesScreen);
                        }
                      },
                      label: const Text('Convenience fees '),
                    ),
                    SizedBox(height: 8),
                    ChoiceChip.elevated(
                      showCheckmark: false,
                      selectedColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                      selected: path == '/CouponListScreen',
                      onSelected: (value) {
                        if (value) {
                          context.goNamed(AppRoute.couponListScreen);
                        }
                      },
                      label: Text('Coupon ', style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(child: child)
      ]),
    );
  }
}
