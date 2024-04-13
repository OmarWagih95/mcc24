import 'package:MCC/constants/colors.dart';
import 'package:flutter/material.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

GlobalKey<NavigatorState> MypageNavigatorKey = GlobalKey<NavigatorState>();

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'طلباتي',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: ColorsManager.mainColor.withOpacity(0.4),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: ColorsManager.mainColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                tabs: const [
                  TabItem(title: 'نشط'),
                  TabItem(title: 'منتهي'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('لاتوجد طلبات نشطة')),
            Center(child: Text('لاتوجد طلبات مسبقة')),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatefulWidget {
  final String title;
  final bool? isFinished;
  final int count;

  const TabItem({
    super.key,
    required this.title,
    this.count = 0,
    this.isFinished,
  });

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
          ),
          widget.count! > 0
              ? Container(
                  margin: const EdgeInsetsDirectional.only(start: 5),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      widget.count! > 9 ? "9+" : widget.count.toString(),
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                      ),
                    ),
                  ),
                )
              : const SizedBox(width: 0, height: 0),
        ],
      ),
    );
  }
}
