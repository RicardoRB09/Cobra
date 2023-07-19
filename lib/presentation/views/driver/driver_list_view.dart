// Flutter imports:
import 'package:cobra/presentation/providers/driver_provider.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

// Project imports:
import '../../widgets/widgets.dart';

class DriverListView extends StatelessWidget {
  const DriverListView({super.key});

  @override
  Widget build(BuildContext context) {
    final driverPrvdr = Provider.of<DriverProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Driver List'),
      body: driverPrvdr.isLoadingDrivers
          ? ListView.builder(
              itemBuilder: (context, index) => _DriverCardSkeleton(),
              itemCount: 4,
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: driverPrvdr.drivers.length,
              itemBuilder: (context, index) => _DriverCard(
                name: '${driverPrvdr.drivers[index].name}',
                lastName: '${driverPrvdr.drivers[index].lastName}',
                identity: '${driverPrvdr.drivers[index].identity}',
                address: '${driverPrvdr.drivers[index].address}',
                vehicleId: driverPrvdr.drivers[index].vehicleId,
                // imageUrl: '${driverPrvdr.drivers[index].picture}',
                imageUrl: '',
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _FloatingActionButton(),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      enableFeedback: true,
      backgroundColor: Colors.green.shade800,
      child: Icon(
        Icons.add_rounded,
        color: Colors.white,
        size: 30.sp,
      ),
      onPressed: () {
        context.push('/driver-creation');
      },
    );
  }
}

class _DriverCardSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SkeletonAvatar(
                style: SkeletonAvatarStyle(
                    shape: BoxShape.circle, width: 0.2.sw, height: 0.2.sw),
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Column(
                      children: [
                        SkeletonLine(
                          style: SkeletonLineStyle(
                            height: 20.sp,
                            randomLength: true,
                            minLength: 0.2.sw,
                            maxLength: 0.5.sw,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        SizedBox(height: 8.w),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                            height: 20.sp,
                            randomLength: true,
                            minLength: 0.2.sw,
                            maxLength: 0.5.sw,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ],
                    )),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Ionicons.ellipsis_vertical),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SkeletonLine(
            style: SkeletonLineStyle(
                height: 16.sp,
                randomLength: true,
                minLength: 0.2.sw,
                maxLength: 0.5.sw,
                borderRadius: BorderRadius.circular(8.r)),
          ),
          SizedBox(height: 4.h),
          SkeletonLine(
            style: SkeletonLineStyle(
                height: 16.sp,
                randomLength: true,
                minLength: 0.2.sw,
                maxLength: 0.5.sw,
                borderRadius: BorderRadius.circular(8.r)),
          ),
          SizedBox(height: 4.h),
          SkeletonLine(
            style: SkeletonLineStyle(
                height: 16.sp,
                randomLength: true,
                minLength: 0.2.sw,
                maxLength: 0.5.sw,
                borderRadius: BorderRadius.circular(8.r)),
          ),
        ],
      ),
    );
  }
}

class _DriverCard extends StatelessWidget {
  const _DriverCard({
    required this.name,
    required this.lastName,
    required this.identity,
    required this.address,
    required this.vehicleId,
    this.imageUrl,
  });
  final String name;
  final String lastName;
  final String identity;
  final String address;
  final int vehicleId;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCircleAvatar(
                diameter: 0.18.sw,
                imageUrl: imageUrl,
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16.w),
                      child: _NameSection(name: name, lastName: lastName))),
              IconButton(
                onPressed: () {},
                icon: const Icon(Ionicons.ellipsis_vertical),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _AddressSection(address: address),
          SizedBox(height: 4.h),
          _IdentitySection(identity: identity),
          SizedBox(height: 4.h),
          _VehicleIdSection(vehicleId: vehicleId),
        ],
      ),
    );
  }
}

class _NameSection extends StatelessWidget {
  const _NameSection({
    required this.name,
    this.lastName,
  });

  final String name;
  final String? lastName;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${name} \n${lastName ?? ""}',
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Colors.green.shade900,
      ),
    );
  }
}

class _AddressSection extends StatelessWidget {
  const _AddressSection({
    required this.address,
  });

  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Ionicons.location_outline, size: 20.sp),
        SizedBox(width: 8.w),
        Text(
          address,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
        ),
      ],
    );
  }
}

class _IdentitySection extends StatelessWidget {
  const _IdentitySection({
    required this.identity,
  });

  final String identity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Ionicons.person_outline, size: 20.sp),
        SizedBox(width: 8.w),
        Text(
          identity,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
        ),
      ],
    );
  }
}

class _VehicleIdSection extends StatelessWidget {
  const _VehicleIdSection({
    required this.vehicleId,
  });

  final int vehicleId;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Ionicons.bus_outline, size: 20.sp),
        SizedBox(width: 8.w),
        Text(
          '$vehicleId',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
        ),
      ],
    );
  }
}
