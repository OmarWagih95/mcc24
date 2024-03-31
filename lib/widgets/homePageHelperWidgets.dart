import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/cubits/SearchCupit.dart';
import 'package:MCC/cubits/SearchCupitStates.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/model/category.dart';
import 'package:MCC/model/dummyData.dart';
import 'package:MCC/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../views/loginScreen.dart';
import '/cubits/visibilityCubit.dart';

class searchbar extends StatelessWidget {
  final TextEditingController search_controller;

  searchbar({
    super.key,
    required this.search_controller,
  });

  @override
  Widget build(BuildContext context) {
    List<Category> DUMMY_CATEGORIES;
    DUMMY_CATEGORIES = DUMMY_CATEGORIES_(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      // child: TextField(
      //   onChanged: (query) => BlocProvider.of<SearchCubit>(context)
      //       .filterList(query, DUMMY_CATEGORIES),
      //   textDirection: TextDirection.rtl,
      //   decoration: InputDecoration(
      //       enabledBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(24),
      //           borderSide: BorderSide(color: ColorsManager.mainColor)),
      //       focusedBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(24),
      //           borderSide: BorderSide(color: ColorsManager.starColor)),
      //       border: OutlineInputBorder(
      //           borderSide: BorderSide(color: ColorsManager.mainColor)),
      //       suffixIcon:
      //           const IconButton(onPressed: null, icon: Icon(Icons.search)),
      //       hintText: S.of(context).Search_for_service_or_product,
      //       hintStyle: TextStyle(
      //         color: Colors.grey.withOpacity(1),
      //       )),
      //   style: const TextStyle(),
      //   controller: search_controller,
      // ),
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu)),
        IconButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  "لايوجد اشعارات الان ",
                  style: TextStyle(fontSize: 32),
                ))),
            icon: Icon(Icons.notifications)),
        const IconButton(onPressed: null, icon: Icon(Icons.search))
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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 223, 223, 237),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
                topRight: Radius.circular(24))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).Text_us_for_any_help_or_question,
              style: const TextStyle(),
            ),
            IconButton(
                onPressed: () {
                  BlocProvider.of<VisibilityCubit>(context).toggleVisibility();
                },
                icon: const Icon(Icons.cancel))
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
    AuthCubit authCubit =context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state is AuthCubitSignOutSuccess){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    }
  },
  builder: (context, state) {
    return Container(
      color: ColorsManager.mainColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           DrawerHeader(
            decoration: BoxDecoration(
              color:ColorsManager.mainColor,
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
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title:
                const Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title:
                const Text('Sign out', style: TextStyle(color: Colors.white)),
            onTap: () {
              authCubit.signOut();
            },
          ),
          // Add more ListTiles for additional menu items
        ],
      ),
    );
  },
);
  }
}
