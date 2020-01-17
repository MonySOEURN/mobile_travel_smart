import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_smart/model/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create object base on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
  }

  // sign in anonymos
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
//      print(user);
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      print("signIn function");
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("signIn function2");
      FirebaseUser user = result.user;
      print("signIn function3");
      print(user.uid);
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      print("register function");
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print("register function2");
      FirebaseUser user = result.user;
      print("register function3");
      print(user.uid);
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }


  // sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch (e){
      print(e.toString());
      return null;
    }
  }
}