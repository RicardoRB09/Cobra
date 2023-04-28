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
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Ionicons.chevron_back_outline,
            color: Colors.green.shade800,
          ),
        ),
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
          name: 'Place ${index + 1}',
          description:
              'This is the detailed description field corresponding to the Material # ${index + 1}',
          price: 20001 + index,
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
    required this.description,
    required this.price,
    super.key,
  });
  final String name;
  final String description;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Container(
        padding: const EdgeInsets.all(16),
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
                _FieldName(name: name),
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
                  flex: 3,
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusToggleButton extends StatelessWidget {
  const _StatusToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const _FieldName(
          name: 'Status',
          padding: EdgeInsets.only(right: 8),
        ),
        FlutterSwitch(
          value: true,
          onToggle: (value) {},
          activeColor: Colors.green.shade900,
          width: 42.w,
          height: 26.h,
          padding: 3,
        ),
      ],
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
      child: Text(
        name,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.green.shade900,
        ),
      ),
    );
  }
}
