import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CameraPosition initialPosition = CameraPosition(
    target: LatLng(37.5214, 126.9246),
    zoom: 15,
  );

  late final GoogleMapController controller;

  bool isChoolCheckDone = false;
  bool isRangeDistance = false;

  final double okDistance = 100;

  @override
  void initState() {
    super.initState();

    Geolocator.getPositionStream().listen((event) {
      final start = LatLng(37.5214, 126.9246);

      final end = LatLng(event.latitude, event.longitude);

      final distance = Geolocator.distanceBetween(
        start.latitude,
        start.longitude,
        end.latitude,
        end.longitude,
      );

      setState(() {
        if (distance < okDistance) {
          isRangeDistance = true;
        } else {
          isRangeDistance = false;
        }
      });
    });
  }

  checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      throw Exception("위치 기능을 활성화 해주세요.");
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission();

    // 아직 권한 요청을 하지 않은 경우
    if (checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission();
    }

    if (checkedPermission != LocationPermission.always &&
        checkedPermission != LocationPermission.whileInUse) {
      throw Exception("위치 권한을 허용해주세요.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '오늘도 출근',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: myLocationPressed,
            icon: Icon(Icons.my_location),
            color: Colors.blue,
          ),
        ],
      ),
      body: FutureBuilder(
        future: checkPermission(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return Column(
            children: [
              Expanded(
                flex: 2,
                child: GoogleMap(
                  initialCameraPosition: initialPosition,
                  zoomControlsEnabled: false,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    this.controller = controller;
                  },
                  markers: {
                    Marker(
                      markerId: MarkerId('123'),
                      position: initialPosition.target,
                    ),
                    Marker(
                      markerId: MarkerId('124'),
                      position: LatLng(37.5204, 126.9236),
                    ),
                  },
                  circles: {
                    Circle(
                      circleId: CircleId('123'),
                      center: initialPosition.target,
                      strokeColor: isRangeDistance ? Colors.blue : Colors.red,
                      fillColor: isRangeDistance ? Colors.blue.withAlpha(100) : Colors.red.withAlpha(100),
                      strokeWidth: 1,
                      radius: okDistance,
                    ),
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isChoolCheckDone ? Icons.check : Icons.timelapse_outlined,
                      color: isChoolCheckDone ? Colors.green : Colors.blue,
                    ),
                    if (!isChoolCheckDone) SizedBox(height: 16.0),
                    if (!isChoolCheckDone && isRangeDistance)
                      OutlinedButton(
                        onPressed: choolCheckPressed,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                        child: Text('출근하기'),
                      )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  myLocationPressed() async {
    final myLocation = await Geolocator.getCurrentPosition();
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(myLocation.latitude, myLocation.longitude),
          zoom: 15,
        ),
      ),
    );
  }

  choolCheckPressed() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('출근하기'),
          content: Text('출근을 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              child: Text('출근'),
            ),
          ],
        );
      },
    );

    if (result) {
      setState(() {
        isChoolCheckDone = true;
      });
    }
  }
}
