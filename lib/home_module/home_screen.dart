import 'package:flutter/material.dart';
import 'package:location/home_module/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          InkWell(
              onTap: () {
                homeState.launchMaps();
              },
              child: const Text("Get Loaction")),
          Consumer<HomeProvider>(builder: (context, state, _) {
            return Column(
              children: [
                Text(state.latitude.toString() ?? ""),
                Text(state.latitude.toString() ?? ""),
                Text(state.locationName.toString() ?? ""),
              ],
            );
          })
        ],
      ),
      // body: const GoogleMap(
      //   mapType: MapType.satellite,
      //     initialCameraPosition: CameraPosition(
      //   target: LatLng(88.077179, 26.570024),
      //   zoom: 14,
      // )),
    );
  }
}
