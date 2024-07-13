import 'dart:async';
import 'dart:math';

import 'package:beerescue_mobile/features/controller/services/location-services.dart';
import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/components/card/case/case-card.dart';
import 'package:beerescue_mobile/features/view/components/card/explore/explore-map-card.dart';
import 'package:beerescue_mobile/features/view/components/card/review/user-rating-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/default-card.dart';
import 'package:beerescue_mobile/features/view/components/input/search-input.dart';
import 'package:beerescue_mobile/features/view/components/sheet/locations-sheet.dart';
import 'package:beerescue_mobile/features/view/screen/profile/list-review-screen.dart';
import 'package:beerescue_mobile/features/view/screen/profile/user-detail/user-detail-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/constant/words-constant.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../shared/constant/assets-constant.dart';
import '../../components/card/util/avatar-card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  //Search Bar
  final TextEditingController tcSearch = TextEditingController();
  //Google Map
  final Completer<GoogleMapController> gmController =
      Completer<GoogleMapController>();
  //Location Service
  LocationService locationService = LocationServiceImpl();

  //List Dummy Hiver Location
  late PageController _pageController;
  int prevPage = 0;
  final List<Map<String, dynamic>> listDummyLocations = [
    {
      "name": "Irfan Ghaphar",
      "location": {
        "address": "Taman Melati, 53100 Kuala Lumpur",
        "latitude": 3.2249922,
        "longitude": 101.7192806
      }
    },
    {
      "name": "Dummy User 1",
      "location": {
        "address": "Some address 1, 53100 Kuala Lumpur",
        "latitude": 3.268,
        "longitude": 101.7192806
      }
    },
    {
      "name": "Dummy User 2",
      "location": {
        "address": "Some address 2, 53100 Kuala Lumpur",
        "latitude": 3.181,
        "longitude": 101.7192806
      }
    },
    {
      "name": "Dummy User 3",
      "location": {
        "address": "Some address 3, 53100 Kuala Lumpur",
        "latitude": 3.2249922,
        "longitude": 101.757,
      }
    },
    {
      "name": "Dummy User 4",
      "location": {
        "address": "Some address 4, 53100 Kuala Lumpur",
        "latitude": 3.2249922,
        "longitude": 101.681,
      }
    },
  ];

  Future<void> _disposeController() async {
    final GoogleMapController controller = await gmController.future;
    controller.dispose();
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    tcSearch.dispose();
    _disposeController();
    super.dispose();
  }

  void _onScroll() {
    if (_pageController.page!.toInt() != prevPage) {
      prevPage = _pageController.page!.toInt();
      moveCamera();
    }
  }

  moveCamera() async {
    final eachHiver = listDummyLocations[_pageController.page!.toInt()];
    final GoogleMapController controller = await gmController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(eachHiver['location']['latitude'],
            eachHiver['location']['longitude']),
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }

  void handleGoToEachCard(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.backgroundColor,
        body: FutureBuilder(
          future: locationService.currentLocation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  buildGoogleMap(LatLng(
                      snapshot.data!.latitude, snapshot.data!.longitude)),
                  buildListExploreMapCard()
                ],
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.primaryColor,
                ),
              );
            }
            return Center(child: Text(snapshot.error.toString()));
          },
        ));
  }

  Widget buildGoogleMap(LatLng latLng) => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(latLng.latitude, latLng.longitude),
                zoom: 14.0,
                bearing: 45.0,
                tilt: 45.0),
            onMapCreated: (GoogleMapController controller) {
              gmController.complete(controller);
            },
            markers: _generateMarkers()),
      );

  Set<Marker> _generateMarkers() {
    Set<Marker> markers = {};

    for (int i = 0; i < listDummyLocations.length; i++) {
      var location = listDummyLocations[i];
      double latitude = location['location']['latitude'];
      double longitude = location['location']['longitude'];
      String name = location['name'];

      Marker marker = Marker(
        onTap: () {
          handleGoToEachCard(i);
        },
        markerId: MarkerId('$latitude-$longitude'),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(
          title: name,
          snippet: location['location']['address'],
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      );

      markers.add(marker);
    }

    return markers;
  }

  Widget buildListExploreMapCard() => Align(
        alignment: Alignment.bottomLeft,
        child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(vertical: SizeConstant.lg),
            child: PageView.builder(
              controller: _pageController,
              itemCount: listDummyLocations.length,
              itemBuilder: (context, index) {
                return buildAnimatedExploreCard(index);
              },
            )),
      );

  Widget buildAnimatedExploreCard(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 1;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page! - index;
            value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
          }

          return Center(
              child: SizedBox(
                  height: Curves.easeInOut.transform(value) * 200.0,
                  width: Curves.easeInOut.transform(value) * 350.0,
                  child: buildExploreMapCard(listDummyLocations[index])));
        },
      );

  Widget buildExploreMapCard(Map<String, dynamic> eachLocation) => InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserDetailScreen(),
          ));
        },
        borderRadius: BorderRadius.circular(SizeConstant.md),
        child: Padding(
            padding: const EdgeInsets.only(left: SizeConstant.spaceMd),
            child: ExploreMapCard(
              eachLocation: eachLocation,
            )),
      );
}
