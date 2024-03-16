// import 'package:androidstudiommc/constants/colors.dart';
// import 'package:androidstudiommc/cubits/LanguagesCupit.dart';
// import 'package:androidstudiommc/cubits/SearchCupit.dart';
// import 'package:androidstudiommc/cubits/SearchCupitStates.dart';
// import 'package:androidstudiommc/cubits/home_page_cubit.dart';
// import 'package:androidstudiommc/generated/l10n.dart';
// import 'package:androidstudiommc/model/category.dart';
// import 'package:androidstudiommc/model/dummyData.dart';
// import 'package:androidstudiommc/widgets/category_item.dart';
import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/cubits/SearchCupit.dart';
import 'package:MCC/cubits/SearchCupitStates.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/model/category.dart';
import 'package:MCC/model/dummyData.dart';
import 'package:MCC/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/cubits/visibilityCubit.dart';

// class categoriesScreen extends StatelessWidget {
//   List<Category> DUMMY_CATEGORIES = [];
//   categoriesScreen({super.key});
//   @override
//   Widget build(context) {
//     return BlocBuilder<SearchCubit, searchState>(builder: (context, state) {
//       if (state is searchinitialState) {
//         DUMMY_CATEGORIES = state.filteredData;
//       }
//       return BlocConsumer<HomePageCubit, HomePageState>(
//   listener: (context, state) {
//     // TODO: implement listener
//   },
//   builder: (context, state) {
//     return Container(
//           margin: const EdgeInsets.only(top: 10),
//           padding: const EdgeInsets.all(0),
//           height: 500,
//           child: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 3 / 2,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8),
//             itemBuilder: (context, index) => categoryItem(
//                 DUMMY_CATEGORIES[index].title,
//                 DUMMY_CATEGORIES[index].color,
//                 DUMMY_CATEGORIES[index].id,
//                 DUMMY_CATEGORIES[index].LogoimgURL!),
//             itemCount: DUMMY_CATEGORIES.length,
//           ));
//   },
// );
//     });
//   }
// }

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
      child: TextField(
        onChanged: (query) => BlocProvider.of<SearchCubit>(context)
            .filterList(query, DUMMY_CATEGORIES),
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: ColorsManager.mainColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: ColorsManager.starColor)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsManager.mainColor)),
            suffixIcon:
                const IconButton(onPressed: null, icon: Icon(Icons.search)),
            hintText: S.of(context).Search_for_service_or_product,
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(1),
            )),
        style: const TextStyle(),
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
                  "ابو عطاااااا",
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
    return Container(
      color: Colors.blue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
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
          // Add more ListTiles for additional menu items
        ],
      ),
    );
  }
}
