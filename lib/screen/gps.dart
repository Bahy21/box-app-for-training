/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home_page_tap_bar/home_page_tap_bar_import.dart';

class Gps extends StatelessWidget {
  const Gps({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ضع هنا الكود اللي عايز ينفذ عند الضغط
        print("تم الضغط على الـ Container");
        // مثال: الانتقال لشاشة جديدة
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
      },
      child: Container(
        color: Colors.white,
      ),
    );
  }
}

 */import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectLocationViewUI extends StatefulWidget {
  const SelectLocationViewUI({super.key});

  @override
  State<SelectLocationViewUI> createState() => _SelectLocationViewUIState();
}

class _SelectLocationViewUIState extends State<SelectLocationViewUI> {
  // Fake current location
  LatLng currentLocation = LatLng(30.033333, 31.233334);
  String currentLocationName = "القاهرة, مصر";

  // Fake search places
  List<String> places = ["مدينة نصر", "المعادي", "الجيزة", "المقطم"];
  TextEditingController searchController = TextEditingController();

  // Fake filtered list
  List<String> filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    filteredPlaces = places;
  }

  void updateCameraToPlace(String place) {
    // Fake update camera
    setState(() {
      currentLocationName = place;
    });
  }

  void onSearch(String query) {
    setState(() {
      filteredPlaces = places
          .where((place) => place.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Google Map
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 15,
              ),
              onMapCreated: (_) {},
            ),

            // Search bar
            Positioned(
              top: 20.h,
              left: 20.w,
              right: 20.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "ابحث عن المكان",
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                  onChanged: onSearch,
                ),
              ),
            ),

            // Places list
            if (filteredPlaces.isNotEmpty)
              Positioned(
                top: 80.h,
                left: 20.w,
                right: 20.w,
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: filteredPlaces
                        .map(
                          (place) => ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text(place),
                        onTap: () => updateCameraToPlace(place),
                      ),
                    )
                        .toList(),
                  ),
                ),
              ),

            // Position button
            Positioned(
              bottom: 150.h,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentLocationName = "الموقع الحالي تم تحديثه";
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.my_location),
                ),
              ),
            ),

            // Bottom sheet to confirm
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 40),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            currentLocationName,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {
                          // Fake confirm
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("تم تأكيد الموقع")),
                          );
                        },
                        child: Text(
                          "تأكيد الموقع",
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
