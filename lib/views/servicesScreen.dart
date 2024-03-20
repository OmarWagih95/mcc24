import 'package:MCC/cubits/services_cubit.dart';
import 'package:MCC/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class ServicesScreen extends StatefulWidget {
Categoryy categoryy;
ServicesScreen(this.categoryy);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    // TODO: implement initState

    getServicesData_()async{
      context.read<ServicesCubit>().getServicesData(widget.categoryy.id);
    }
    getServicesData_();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10),
          child: Column(
            children: [
              Row(
            mainAxisAlignment: MainAxisAlignment.end
            ,children: [
                Text(widget.categoryy.AR['categoryName'],textDirection: TextDirection.rtl,style: TextStyle(fontSize:25.w,fontWeight: FontWeight.bold ),)
              ],),
              SizedBox(height: 30.h,),
              
              BlocConsumer<ServicesCubit, ServicesState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return

      state is ServicesPageLoading? SpinKitCircle(
        color: Colors.black45,
      ) :Container(
                child: ListView.builder(
                itemCount: context.read<ServicesCubit>().servicesDataList.length
                ,itemBuilder: (context, index) => GestureDetector(
                  child: Container(
                    width: 50,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end
                      ,
                      children: [
                        Text(
                        context.read<ServicesCubit>().servicesDataList[index].AR['serviceName'],textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 25.w),) ,
                      ],
                    ),

                  ),
                )
                  ),
              height: 600.w,);
  },
)
            ],
          ),
        ),
      ),
    );
  }
}
