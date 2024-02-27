import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

import '../View/Screens/login_page.dart';
import 'is_new_user.dart';
late UserCredential userCredentialDta ;
StateProvider<Map<String,dynamic>> userDataProvider =
StateProvider<Map<String,dynamic>>((ref)=>{
  'photoURL':true,
  "email":"  "

});

Future SignInWithGoogle(BuildContext context) async{
  final GoogleSignInAccount? googleUser =
  await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth =await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken
  );
UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

  userCredentialDta = userCredential ;
  isNewUser( userCredentialDta , context);
}
Future<void> signOut(context) async {
  await GoogleSignIn().signOut().whenComplete(() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()),(route) => false);


  });


}