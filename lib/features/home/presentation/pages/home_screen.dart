import 'package:flutter/material.dart';
import 'package:haoyako/features/home/presentation/widgets/categories_widget.dart';
import 'package:haoyako/features/home/presentation/widgets/drawer.dart';
import 'package:haoyako/features/home/presentation/widgets/for_you_widget.dart';
import 'package:haoyako/features/home/presentation/widgets/search_bar.dart';
import 'package:haoyako/features/home/presentation/widgets/suggested_widget.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<CustomDrawerState> _drawerKey =
      GlobalKey<CustomDrawerState>();

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      drawerKey: _drawerKey,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              floating: true,
              pinned: true,
              snap: false,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.notifications_outlined,
                      color: Colors.black, size: 30),
                ],
              ),
              leading: IconButton(
                icon: Icon(Icons.menu, color: Colors.black, size: 30),
                onPressed: () {
                  _drawerKey.currentState?.toggle();
                },
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SafeArea(
                    child: SizedBox(
                      height: 60,
                      child: CustomSearchBar(),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  CategoriesWidget(),
                  SuggestedWidget(),
                  ForYouWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
