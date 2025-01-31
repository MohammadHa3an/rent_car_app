import 'package:flutter/material.dart';
import 'package:rent_car_app/data/models/car_model.dart';
import 'package:rent_car_app/presentation/pages/maps_details_page.dart';
import 'package:rent_car_app/presentation/widgets/car_card.dart';
import 'package:rent_car_app/presentation/widgets/more_card.dart';

class CarDetailsPage extends StatefulWidget {
  final CarModel carModel;

  const CarDetailsPage({super.key, required this.carModel});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text("Information"),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            carModel: CarModel(
              model: widget.carModel.model,
              distance: widget.carModel.distance,
              fuelCapacity: widget.carModel.fuelCapacity,
              pricePerHour: widget.carModel.pricePerHour,
              imagePath: widget.carModel.imagePath,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
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
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/user.png"),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Mohammad Hasan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$5,750",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapsDetailsPage(
                          carModel: widget.carModel,
                        ),
                      ),
                    ),
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child:
                              Image.asset("assets/maps.png", fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                  carModel: CarModel(
                    model: "${widget.carModel.model}-1",
                    distance: widget.carModel.distance + 100,
                    fuelCapacity: widget.carModel.fuelCapacity + 100,
                    pricePerHour: widget.carModel.pricePerHour + 10,
                    imagePath: widget.carModel.imagePath,
                  ),
                ),
                SizedBox(height: 5),
                MoreCard(
                  carModel: CarModel(
                    model: "${widget.carModel.model}-2",
                    distance: widget.carModel.distance + 200,
                    fuelCapacity: widget.carModel.fuelCapacity + 200,
                    pricePerHour: widget.carModel.pricePerHour + 20,
                    imagePath: widget.carModel.imagePath,
                  ),
                ),
                SizedBox(height: 5),
                MoreCard(
                  carModel: CarModel(
                    model: "${widget.carModel.model}-3",
                    distance: widget.carModel.distance + 300,
                    fuelCapacity: widget.carModel.fuelCapacity + 300,
                    pricePerHour: widget.carModel.pricePerHour + 30,
                    imagePath: widget.carModel.imagePath,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
