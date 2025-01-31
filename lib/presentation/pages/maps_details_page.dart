import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rent_car_app/data/models/car_model.dart';

class MapsDetailsPage extends StatelessWidget {
  final CarModel carModel;
  const MapsDetailsPage({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(initialCenter: LatLng(51, -0.09)),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: carDetailsCard(carModel: carModel),
          ),
        ],
      ),
    );
  }
}

Widget carDetailsCard({required CarModel carModel}) {
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                carModel.model,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.directions_car, color: Colors.white, size: 16),
                  SizedBox(width: 5),
                  Text(
                    "> ${carModel.distance} km",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.battery_full, color: Colors.white, size: 14),
                  Text(
                    "${carModel.fuelCapacity.toString()} L",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Features",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                featureIcons(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${carModel.pricePerHour}/day',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          "Book Now",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: Image.asset("assets/white_car.png"),
        ),
      ],
    ),
  );
}

Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(
        icon: Icons.local_gas_station,
        title: "Diesel",
        subtitle: "Common Rail",
      ),
      featureIcon(
        icon: Icons.speed,
        title: "Acceleration",
        subtitle: "0 -100km/s",
      ),
      featureIcon(
        icon: Icons.ac_unit,
        title: "Cold",
        subtitle: "Temp Control",
      ),
    ],
  );
}

Widget featureIcon(
    {required IconData icon, required String title, required String subtitle}) {
  return Container(
    width: 100,
    height: 100,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey, width: 1),
    ),
    child: Column(
      children: [
        Icon(icon, size: 28),
        Text(title),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        )
      ],
    ),
  );
}
