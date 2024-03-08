import 'package:androidstudiommc/constants/colors.dart';
import 'package:androidstudiommc/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/cubits/visibilityCubit.dart';
import '/model/dummyData.dart';

class searchbar extends StatelessWidget {
  void Function(String)? onChanged;
  final TextEditingController search_controller;
  void Function(String)? onchanged;

  searchbar({
    super.key,
    required this.search_controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextField(
        onChanged: (value) => onChanged!(value),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.end,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: AppColors.mainColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: AppColors.starColor)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor)),
            suffixIcon: IconButton(onPressed: null, icon: Icon(Icons.search)),
            hintText: " ابحث عن خدمة او منتج ",
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(1),
            )),
        style: TextStyle(),
        controller: search_controller,
      ),
    );
  }
}

class leftappbar extends StatefulWidget {
  leftappbar({super.key});

  @override
  State<leftappbar> createState() => _leftappbarState();
}

class _leftappbarState extends State<leftappbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu)),
        IconButton(onPressed: null, icon: Icon(Icons.notifications)),
        IconButton(onPressed: null, icon: Icon(Icons.search))
      ]),
    );
  }
}

class messageText extends StatelessWidget {
  bool isVisible;

  messageText({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        margin: EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 223, 223, 237),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
                topRight: Radius.circular(24))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<VisibilityCubit>(context).toggleVisibility();
                },
                icon: Icon(Icons.cancel)),
            Text(
              ' دردش معنا مباشرة لأي مساعدة او استفسار  ',
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////
class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Custom Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // Add more ListTiles for additional menu items
        ],
      ),
    );
  }
}
