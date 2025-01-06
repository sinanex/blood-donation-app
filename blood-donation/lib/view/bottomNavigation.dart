import 'package:curd/controller/bottomBarController.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<Bottombarcontroller>(context, listen: false).pages[
          Provider.of<Bottombarcontroller>(context, listen: false)
              .currentIndex],
      bottomNavigationBar: Consumer<Bottombarcontroller>(
        builder: (context, bottomBar, child) => BottomNavigationBar(
            currentIndex: bottomBar.currentIndex,
            onTap: (value) {
              bottomBar.changeIndex(value);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Iconsax.profile), label: 'home'),
            ]),
      ),
    );
  }
}
