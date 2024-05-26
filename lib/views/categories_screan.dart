// ignore: camel_case_types

import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/SearchCupit.dart';
import 'package:MCC/cubits/SearchCupitStates.dart';
import 'package:MCC/cubits/login_cubit.dart';
import 'package:MCC/cubits/services_cubit.dart';
import 'package:MCC/model/category.dart';
import 'package:MCC/views/servicesScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cubits/home_page_cubit.dart';
import '/widgets/category_item.dart';

var categoryDataList_ = [];
void _deleteCachedImage() {
  CachedNetworkImage.evictFromCache('imageUrl');
}

class categoriesScreen extends StatefulWidget {
  categoriesScreen({super.key});

  @override
  State<categoriesScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen> {
  @override
  void initState() {
    // categoryDataList_ = (context).read<HomePageCubit>().categoryDataList;
  }

  @override
  Widget build(context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {
        if (state is HomePageGetDataFailure) {
          debugPrint('there\'s an error retreiving your data');
          Fluttertoast.showToast(msg: state.errorMsg);
        }
      },
      builder: (context, state) {
        if (state is HomePageGetDataSuccessed) {
          return BlocBuilder<SearchCubit, searchState>(
            builder: (context, state) {
              if (state is searchinitialState) {
                // categoryDataList_ =
                //     (context).read<HomePageCubit>().categoryDataList;
                return Container(
                    // color: Colors.red,
                    margin: EdgeInsets.only(top: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
                    height: 300.h,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.8 / 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h),
                      itemBuilder: (context, index) {
                        return categoryItem(state.filteredData[index],
                            Theme.of(context).primaryColorLight);
                      },
                      itemCount: state.filteredData
                          .length, // itemCount: BlocProvider.of<HomePageCubit>(context).categoryDataList.length,
                    ));
              } else {
                return const Center(
                    child: Text('some thing wrong with search'));
              }
            },
          );
        } else if (state is HomePageGetDataFailure) {
          return const Center(child: Text('some thing wrong with search'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
        // state is HomePageGetDataLoading
        //     ? Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Container(
        //             height: 250.h,
        //             child: Center(
        //               child: SpinKitCircle(
        //                 color: Theme.of(context).primaryColor,
        //               ),
        //             ),
        //           ),
        //         ],
        //       )
        //     :
      },
    );
  }
}

class categoryItem extends StatelessWidget {
  final Categoryy categoryy;
  final Color color;

  categoryItem(
    this.categoryy,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {
      if (state is HomePageGetDataFailure) {
        debugPrint('there\'s an error retreiving your data');
        Fluttertoast.showToast(msg: state.errorMsg);
      }
    }, builder: (context, state) {
      return GestureDetector(
        onTap: () {
          debugPrint('clicked');
          try {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) =>
                              ServicesCubit()..getServicesData(categoryy.id),
                          child: ServicesScreen(categoryy),
                        )));
          } catch (e) {
            debugPrint('$e');
          }
        },
        child: Container(
          foregroundDecoration: BoxDecoration(),
          padding: EdgeInsets.all(
              2), ////need to changed with better code for text size
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 2),
              color: color,
              borderRadius: BorderRadius.circular(15.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CachedNetworkImage(
                imageUrl: categoryy.logoImgURL!,
                height: 100.h,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) {
                  return Column(
                    children: [
                      Image(
                        width: 80.w,
                        image: imageProvider,
                        height: 60.h,
                        fit: BoxFit.cover,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Localizations.localeOf(context).languageCode ==
                                  'en'
                              ? Text(
                                  categoryy.EN['categoryName'] ?? '',
                                  maxLines: 4,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .merge(GoogleFonts.aBeeZee())
                                      .copyWith(
                                          overflow: TextOverflow.ellipsis),
                                )
                              : Text(
                                  categoryy.AR['categoryName'] ?? '',
                                  maxLines: 4,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .merge(GoogleFonts.aBeeZee())
                                      .copyWith(
                                          overflow: TextOverflow.ellipsis),
                                ),
                        ),
                      ),
                    ],
                  );
                },
              )
              // Image.network(
              //   categoryy.logoImgURL!,
              //   height: 80.h,
              //   loadingBuilder: (BuildContext context, Widget child,
              //       ImageChunkEvent? loadingProgress) {
              //     if (loadingProgress == null) {
              //       return Expanded(
              //         child: Column(
              //           children: [
              //             child,
              //             SizedBox(height: 10),
              //             Flexible(
              //               child: Padding(
              //                 padding: EdgeInsets.symmetric(horizontal: 12.w),
              //                 child: Localizations.localeOf(context)
              //                             .languageCode ==
              //                         'en'
              //                     ? Text(categoryy.EN['categoryName'],
              //                         maxLines: 4,
              //                         style: Theme.of(context)
              //                             .textTheme!
              //                             .titleSmall!
              //                             .merge(GoogleFonts.aBeeZee())
              //                             .copyWith(
              //                                 overflow: TextOverflow.ellipsis))
              //                     : Text(categoryy.AR['categoryName'],
              //                         maxLines: 4,
              //                         style: Theme.of(context)
              //                             .textTheme!
              //                             .titleSmall!
              //                             .merge(GoogleFonts.aBeeZee())
              //                             .copyWith(
              //                                 overflow: TextOverflow.ellipsis)),
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     } else {
              //       return Center(
              //           child: CircularProgressIndicator(
              //         value: loadingProgress.expectedTotalBytes != null
              //             ? loadingProgress.cumulativeBytesLoaded /
              //                 (loadingProgress.expectedTotalBytes ?? 1)
              //             : null,
              //       ));
              //     }
              //   },
              // ),

              // Flexible(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 12.w),
              //     child: Localizations.localeOf(context).languageCode == 'en'
              //         ? Text(categoryy.EN['categoryName'],
              //             maxLines: 4,
              //             style: Theme.of(context)
              //                 .textTheme!
              //                 .titleSmall!
              //                 .merge(GoogleFonts.aBeeZee())
              //                 .copyWith(overflow: TextOverflow.ellipsis))
              //         : Text(categoryy.AR['categoryName'],
              //             maxLines: 4,
              //             style: Theme.of(context)
              //                 .textTheme!
              //                 .titleSmall!
              //                 .merge(GoogleFonts.aBeeZee())
              //                 .copyWith(overflow: TextOverflow.ellipsis)),
              //   ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
// Container(
//             foregroundDecoration: BoxDecoration(),
//             padding: EdgeInsets.all(2),
//             decoration: BoxDecoration(
//                 border:
//                     Border.all(color: Theme.of(context).primaryColor, width: 2),
//                 color: color,
//                 borderRadius: BorderRadius.circular(15.r)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Image.network(
//                   loadingBuilder: (BuildContext context, Widget child,
//                       ImageChunkEvent? loadingProgress) {
//                     if (loadingProgress == null) {
//                       return Column(
//                         children: [
//                           child,
//                           SizedBox(height: 10),
//                           Flexible(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 12.w),
//                               child: Localizations.localeOf(context)
//                                           .languageCode ==
//                                       'en'
//                                   ? Text(categoryy.EN['categoryName'],
//                                       maxLines: 4,
//                                       style: Theme.of(context)
//                                           .textTheme!
//                                           .titleSmall!
//                                           .merge(GoogleFonts.aBeeZee())
//                                           .copyWith(
//                                               overflow: TextOverflow.ellipsis))
//                                   : Text(categoryy.AR['categoryName'],
//                                       maxLines: 4,
//                                       style: Theme.of(context)
//                                           .textTheme!
//                                           .titleSmall!
//                                           .merge(GoogleFonts.aBeeZee())
//                                           .copyWith(
//                                               overflow: TextOverflow.ellipsis)),
//                             ),
//                           ),
//                         ],
//                       );
//                     } else {
//                       return Center(
//                           child: CircularProgressIndicator(
//                         value: loadingProgress.expectedTotalBytes != null
//                             ? loadingProgress.cumulativeBytesLoaded /
//                                 (loadingProgress.expectedTotalBytes ?? 1)
//                             : null,
//                       ));
//                     }
//                   },
//                   categoryy.logoImgURL!,
//                   height: 80.h,
//                 ),
//               ],
//             ),
//           ),