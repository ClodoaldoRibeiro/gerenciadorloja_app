import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class UserBLoC extends BlocBase {
  final _userController = BehaviorSubject();

  Map<String, Map<String, dynamic>> _users = {};

  Firestore _firestore = Firestore.instance;

  UserBLoC() {
    _addUsersListener();
  }

  void _addUsersListener() {
    _firestore.collection('users').snapshots().listen((event) {
      event.documentChanges.forEach((element) {
        String uid = element.document.documentID;

        switch (element.type) {
          case DocumentChangeType.added:
            _users[uid] = element.document.data;
            break;
          case DocumentChangeType.modified:
            _users[uid].addAll(element.document.data);
            break;
          case DocumentChangeType.removed:
            _users.remove(uid);
            break;
        }
      });
    });
  }

  @override
  void dispose() {
    _userController.close();
    // TODO: implement dispose
  }
}
