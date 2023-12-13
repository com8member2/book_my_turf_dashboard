import 'package:beamer/beamer.dart';
import 'package:book_my_turf_dashboard/features/auth/login_screen.dart';
import 'package:book_my_turf_dashboard/features/home/booking/presentation/booking_screen.dart';
import 'package:book_my_turf_dashboard/features/home/home_screen.dart';
import 'package:book_my_turf_dashboard/features/home/owner/presentation/owner_list_screen.dart';
import 'package:book_my_turf_dashboard/features/home/user/presentation/user_list_screen.dart';
import 'package:book_my_turf_dashboard/features/home/venues/presentation/venue_list_screen.dart';
import 'package:flutter/widgets.dart';

import 'features/sub_home_screen.dart';



class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/home/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    BeamPage(
      key: ValueKey('home-${DateTime.now()}'),
      title: 'Home',
      child: state.pathPatternSegments.contains("home") ? HomeScreen() : SubHome(),
    )
  ];
}

class BookingsLocation extends BeamLocation<BeamState> {
  BookingsLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/bookings/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    BeamPage(
      key: ValueKey('/bookings'),
      title: 'Bookiings',
      child: BookingScreen(),
    )
  ];
}

class VenueListLocation extends BeamLocation<BeamState> {
  VenueListLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/venueList/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    BeamPage(
      key: ValueKey('/venueList'),
      title: 'Bookiings',
      child: VenueListScreen(),
    )
  ];
}

class OwnerListLocation extends BeamLocation<BeamState> {
  OwnerListLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/ownerList/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    BeamPage(
      key: ValueKey('/ownerList'),
      title: 'Owner',
      child: OwnerListScreen(),
    )
  ];
}

class UserListLocation extends BeamLocation<BeamState> {
  UserListLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/userList/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    BeamPage(
      key: ValueKey('/userList'),
      title: 'Owner',
      child: UserListScreen(),
    )
  ];
}

class LoginLocation extends BeamLocation<BeamState> {
  LoginLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/login/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    BeamPage(
      key: ValueKey('/login'),
      title: 'Owner',
      child: LoginScreen(),
    )
  ];
}

// class BooksLocation extends BeamLocation<BeamState> {
//   BooksLocation(RouteInformation routeInformation) : super(routeInformation);
//
//   @override
//   List<String> get pathPatterns => ['/books/*'];
//
//   @override
//   List<BeamPage> buildPages(BuildContext context, BeamState state) => [
//     BeamPage(
//       key: ValueKey('books'),
//       title: 'Books',
//       child: BooksScreen(),
//     )
//   ];
// }
//
// class BooksContentLocation extends BeamLocation<BeamState> {
//   BooksContentLocation(RouteInformation routeInformation)
//       : super(routeInformation);
//
//   @override
//   List<String> get pathPatterns => [
//     '/books/authors',
//     '/books/genres',
//   ];
//
//   @override
//   List<BeamPage> buildPages(BuildContext context, BeamState state) => [
//     BeamPage(
//       key: ValueKey('books-home'),
//       title: 'Books Homeeeeeeee',
//       child: BooksHomeScreen(),
//     ),
//     if (state.pathPatternSegments.contains('authors'))
//       BeamPage(
//         key: ValueKey('books-authors'),
//         title: 'Books Authorsssssssssssss',
//         child: BookAuthorsScreen(),
//       ),
//     if (state.pathPatternSegments.contains('genres'))
//       BeamPage(
//         key: ValueKey('books-genres'),
//         title: 'Books Genresssssssssssss',
//         child: BookGenresScreen(),
//       )
//   ];
// }
//
// class ArticlesLocation extends BeamLocation<BeamState> {
//   ArticlesLocation(RouteInformation routeInformation) : super(routeInformation);
//
//   @override
//   List<String> get pathPatterns => ['/articles/*'];
//
//   @override
//   List<BeamPage> buildPages(BuildContext context, BeamState state) => [
//     BeamPage(
//       key: ValueKey('articles'),
//       title: 'Articles',
//       child: ArticlesScreen(),
//     )
//   ];
// }
//
// class ArticlesContentLocation extends BeamLocation<BeamState> {
//   ArticlesContentLocation(RouteInformation routeInformation)
//       : super(routeInformation);
//
//   @override
//   List<String> get pathPatterns => [
//     '/articles/authors',
//     '/articles/genres',
//   ];
//
//   @override
//   List<BeamPage> buildPages(BuildContext context, BeamState state) => [
//     BeamPage(
//       key: ValueKey('articles-home'),
//       title: 'Articles Home',
//       child: ArticlesHomeScreen(),
//     ),
//     if (state.pathPatternSegments.contains('authors'))
//       BeamPage(
//         key: ValueKey('articles-authors'),
//         title: 'Articles Authors',
//         child: ArticleAuthorsScreen(),
//       ),
//     if (state.pathPatternSegments.contains('genres'))
//       BeamPage(
//         key: ValueKey('articles-genres'),
//         title: 'Articles Genres',
//         child: ArticleGenresScreen(),
//       )
//   ];
// }
