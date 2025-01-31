import 'package:flutter/material.dart';
import 'package:rent_car_app/data/models/car_model.dart';
import 'package:rent_car_app/presentation/pages/car_details_page.dart';

class CarCard extends StatelessWidget {
  final CarModel carModel;

  const CarCard({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsPage(
              carModel: carModel,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ]),
        child: Column(
          children: [
            Image.asset(carModel.imagePath.toString()),
            Text(
              carModel.model,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/gps.png"),
                        Text(" ${carModel.distance.toStringAsFixed(0)}km"),
                      ],
                    ),
                    SizedBox(width: 5),
                    Row(
                      children: [
                        Image.asset("assets/pump.png"),
                        Text(" ${carModel.fuelCapacity.toStringAsFixed(0)}L"),
                      ],
                    ),
                  ],
                ),
                Text(
                  "\$${carModel.pricePerHour.toStringAsFixed(2)}/h",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
