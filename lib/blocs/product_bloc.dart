import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/subjects.dart';

class ProducBloC extends BlocBase {
  ProducBloC({this.categoryId, this.product}) {
    if (product != null) {
      unsavedData = Map.of(product.data);
      unsavedData["images"] = List.of(product.data["images"]);
      unsavedData["sizes"] = List.of(product.data["sizes"]);

      //  _createdController.add(true);
    } else {
      unsavedData = {
        "title": null,
        "description": null,
        "price": null,
        "images": [],
        "sizes": []
      };

      //_createdController.add(false);
    }

    _dataController.add(unsavedData);
  }

  final _dataController = BehaviorSubject<Map>();

  Stream<Map> get outData => _dataController.stream;

  final String categoryId;
  final DocumentSnapshot product;

  Map<String, dynamic> unsavedData;

  @override
  void dispose() {
    _dataController.close();
  }
}
