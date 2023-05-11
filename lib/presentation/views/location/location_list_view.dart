import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:ionicons/ionicons.dart';

class LocationListView extends StatelessWidget {
  const LocationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        shadowColor: Colors.black38,
        elevation: 3,
        centerTitle: true,
        title: Text(
          'Place List',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) => _PlaceCard(
          name: 'Location name ${index + 1}',
          address: 'Circunvalar street #${index + 1} - ${index + 2}',
          cityState: 'Atlántico - Barranquilla',
          price: 20001 + index,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        enableFeedback: true,
        backgroundColor: Colors.green.shade800,
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 30.sp,
        ),
        onPressed: () {},
      ),
    );
  }
}

class _PlaceCard extends StatelessWidget {
  const _PlaceCard({
    required this.name,
    required this.address,
    required this.cityState,
    required this.price,
    super.key,
  });
  final String name;
  final String address;
  final String cityState;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: Icon(Ionicons.location_outline)),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FieldName(name: name),
                  SizedBox(height: 8.h),
                  Text(
                    address,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    cityState,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: const Icon(Ionicons.ellipsis_vertical_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FieldName extends StatelessWidget {
  const _FieldName({
    required this.name,
    this.padding,
    super.key,
  });

  final String name;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.green.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
