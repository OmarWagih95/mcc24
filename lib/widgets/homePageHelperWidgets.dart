import 'dart:developer';
import 'package:MCC/cash/shared_pref.dart';
import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/cubits/SearchCupit.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/cubits/darkModeCubit.dart';
import 'package:MCC/cubits/home_page_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/model/category.dart';
import 'package:MCC/routing/routes.dart';
import 'package:MCC/views/navpages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../views/MyOrdersScreen.dart';
import '../views/loginScreen.dart';

class searchbar extends StatelessWidget {
  final List<Categoryy> DUMMY_CATEGORIES;

  final TextEditingController search_controller;

  searchbar({
    super.key,
    required this.search_controller,
    required this.DUMMY_CATEGORIES,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: TextField(
        style: Theme.of(context).textTheme.displaySmall,
        onChanged: (query) => BlocProvider.of<SearchCubit>(context)
            .filterList(query, DUMMY_CATEGORIES),
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          enabled: true,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          suffixIcon: const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
              )),
          hintText: S.of(context).Search_for_service_or_product,
        ),
        controller: search_controller,
      ),
    );
  }
}

////////////////////////
class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthCubitSignOutSuccess) {
          BlocProvider.of<AuthCubit>(context).user = null;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => mainpage(),
              ));
        }
      },
      builder: (context, state) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      child: Image.asset(
                        'img/mmcassits/logo_12.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: Text(S.of(context).Home, style: TextStyle()),
                onTap: () {
                  if (ModalRoute.of(context)!.settings.name ==
                      Routes.mainPage) {
                    Navigator.pop(context);
                  } else {
                    Navigator.of(context).pushReplacementNamed(Routes.mainPage);
                  }
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                ),
                title: Text(S.of(context).Settings, style: TextStyle()),
                onTap: () {
                  Currindx = 2;
                  changeremoteindex();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.add_home_work,
                ),
                title: Text(S.of(context).My_Order, style: TextStyle()),
                onTap: () {
                  Currindx = 1;
                  changeremoteindex();
                  // debugPrint(
                  //     '${BlocProvider.of<AuthCubit>(context).user!.userID!} hna zorar');
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => BlocProvider(
                  //               create: (context) => OrderCubit()
                  //                 ..GetMyOrders(
                  //                     BlocProvider.of<AuthCubit>(context)
                  //                         .user!
                  //                         .userID!),
                  //               child: MyOrdersScreen(),
                  //             )));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: Text(S.of(context).Sign_out, style: TextStyle()),
                onTap: () async {
                  authCubit.signOut();
                  await CashHelper.setData(
                    key: 'Islogin',
                    value: false,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.change_circle),
                title:
                    Text(S.of(context).Language_Exchange, style: TextStyle()),
                onTap: () async {
                  BlocProvider.of<LanguagesCubit>(context).changeLanguages(
                      ((Localizations.localeOf(context).languageCode) == 'en')
                          ? 'ar'
                          : 'en');
                },
              ),
              BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
                  return SwitchListTile(
                    value: BlocProvider.of<HomePageCubit>(context).darkMode,
                    onChanged: (value) {
                      BlocProvider.of<HomePageCubit>(context)
                          .changeSwitch(value);
                      final mode =
                          BlocProvider.of<Dark_lightModeCubit>(context).mode;
                      log(' from onPressed1 mode is $mode');
                      BlocProvider.of<Dark_lightModeCubit>(context)
                          .darkAndlightMode(mode == 'light' ? 'dark' : 'light');
                    },
                    title: Text(S.of(context).Brightness_change,
                        style: TextStyle()),
                    activeColor: Theme.of(context).primaryColor,
                    hoverColor: Theme.of(context).scaffoldBackgroundColor,
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.black12, 
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
