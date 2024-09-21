import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeProvider extends ChangeNotifier {
  double? latitude = 0.0;
  double? longitude = 0.0;
  String? locationName;

  HomeProvider() {
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print('Permission denied');
      await Geolocator.requestPermission();
    } else {
      Position currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);

      latitude = currentLocation.latitude;
      longitude = currentLocation.longitude;

      print("Latitude: $latitude");
      print("Longitude: $longitude");

      await getLocationName();
      notifyListeners();
    }
  }

  Future<void> getLocationName() async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude!, longitude!);
      if (placemarks.isNotEmpty) {
        print(placemarks);
        locationName = '${placemarks.first.name}, ${placemarks.first.country}';
      } else {
        locationName = 'Location not found';
      }
    } catch (e) {
      print('Error getting location name: $e');
    }
  }

  void launchMaps() async {
    final String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not launch $googleUrl';
    }
    notifyListeners();
  }

  //   ApiResponse<CartModel> cartResponse = ApiResponse.loading();

  // setCartResponse(ApiResponse<CartModel> response) {
  //   cartResponse = response;
  //   notifyListeners();
  // }

  // getDetailsOrder() async {
  //   setLoading(true);
  //   setOrderDetailsResponse(ApiResponse.loading());
  //   await orderRepo.getDetailsOrder(id).then((value) {
  //     setOrderDetailsResponse(ApiResponse.completed(value));
  //   }).onError((error, stackTrace) {
  //     print(stackTrace);
  //     setOrderDetailsResponse(ApiResponse.error(error.toString()));
  //   });
  //   setLoading(false);
  // }

  // CustomDataStatusWidget(
  //                 status: value.jobListResponse.dataStatus,
  //                 errorStatus: Text(
  //                   value.jobListResponse.message.toString(),
  //                 ),
  //                 successStatus: CustomGridView(
  //                   childAspectRatio: 0.9,
  //                   padding: kPadding(),
  //                   itemCount: value.jobListResponse.data?.data?.length ?? 0,
  //                   itemBuilder: (context, index) {
  //                     var items = value.jobListResponse.data?.data;
  //                     return DetailsItemTile(
  //                       image: items![index].bannerImage ??
  //                           'https://connecthimal.ktmrush.com/storage/job/feature/thumb_1717674081.jpg',
  //                       onTap: () {
  //                         Utils.navigateToNamed(
  //                           context,
  //                           RoutesName.jobsDetailsScreen,
  //                           arguments: {
  //                             "title": items[index].title,
  //                             "detailId": items[index].id,
  //                           },
  //                         );
  //                       },
  //                       title: items[index].title ?? '',
  //                     );
  //                   },
  //                 ),
  //               ),
}
