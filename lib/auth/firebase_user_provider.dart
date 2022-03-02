import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ManagementSolFirebaseUser {
  ManagementSolFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ManagementSolFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ManagementSolFirebaseUser> managementSolFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ManagementSolFirebaseUser>(
            (user) => currentUser = ManagementSolFirebaseUser(user));
