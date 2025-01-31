import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_car_app/data/models/car_model.dart';

class FirebaseCarDataSource {
  final FirebaseFirestore fireStore;

  FirebaseCarDataSource({required this.fireStore});

  Future<List<CarModel>> getCars() async {
    var snapshot = await fireStore.collection('cars').get();

    return snapshot.docs.map((doc) => CarModel.fromMap(doc.data())).toList();
  }
}
