// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

// Project imports:
import '../../widgets/widgets.dart';

class VehicleListView extends StatelessWidget {
  const VehicleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        shadowColor: Colors.black38,
        elevation: 3,
        centerTitle: true,
        title: Text(
          'Vehicle List',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) => _MaterialCard(
          name: 'Vehicle Name ${index + 1}',
          vehicleType: 'Vehicle type ${index + 1}',
          description:
              'This is the detailed description field corresponding to the Vehicle # ${index + 1}',
          price: 20001 + index,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        enableFeedback: true,
        backgroundColor: Colors.green.shade800,
        child: Icon(Icons.add_rounded, color: Colors.white, size: 30.sp),
        onPressed: () {
          context.pushReplacement('/vehicle-creation');
        },
      ),
    );
  }
}

class _MaterialCard extends StatelessWidget {
  const _MaterialCard({
    required this.name,
    required this.vehicleType,
    required this.description,
    required this.price,
  });
  final String name;
  final String vehicleType;
  final String description;
  final int price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 24.w, right: 24.w, bottom: 16.h, top: 50.h),
            child: Container(
              padding: EdgeInsets.only(
                  right: 16.w, left: 16.w, top: 56.h, bottom: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  )
                ],
                color: Colors.grey.shade200,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _FieldName(name: name),
                          _VehicleType(vehicleType: vehicleType)
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(Ionicons.ellipsis_horizontal_outline),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          description,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '1000 Ton',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomCircleAvatar(
            diameter: 0.25.sw,
            imageUrl: 'assets/images/default_truck.png',
          ),
        ],
      ),
    );
  }
}

class _VehicleType extends StatelessWidget {
  const _VehicleType({
    required this.vehicleType,
  });

  final String vehicleType;

  @override
  Widget build(BuildContext context) {
    return Text(
      vehicleType,
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
    );
  }
}

class _FieldName extends StatelessWidget {
  const _FieldName({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.green.shade900,
      ),
    );
  }
}
