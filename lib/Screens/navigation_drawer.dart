import 'package:flutter/material.dart';
import 'package:leave_app/Screens/Dashboard.dart';
import 'package:leave_app/Screens/drawer_item.dart';
import 'package:leave_app/Screens/form.dart';
import 'package:leave_app/Screens/homescreen.dart';
import 'package:leave_app/Screens/people.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromARGB(255, 0, 75, 136),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 40,),
              const Divider(thickness: 1, height: 10, color: Colors.white,),
              const SizedBox(height: 40,),
              DrawerItem(
                name: 'Home',
                icon: Icons.home,
                context: context,
                onPressed: ()=> onItemPressed(context, index: 0),
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Leaves',
                  context: context,
                  icon: Icons.time_to_leave_outlined,
                  onPressed: ()=> onItemPressed(context, index:1),
              ),
              const SizedBox(height: 30,),
              const Divider(thickness: 1, height: 10, color: Colors.white,),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  context: context,
                  onPressed: ()=> onItemPressed(context, index: 2)
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);
    switch(index){
      case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context) => const dashboard()));
      break;
      // case 1:
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerForm()));
      //   break;
    }
  }
  Widget headerWidget() {
    return Row(
      children: const [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
        ),
        SizedBox(width: 20,),
      ],
    );
  }
}



