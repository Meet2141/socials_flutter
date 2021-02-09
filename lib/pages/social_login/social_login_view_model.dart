import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:share/share.dart';
import 'package:social_demo/pages/facebook_screen/facebook_screen.dart';
import 'package:social_demo/pages/google_screen/google_screen.dart';
import 'package:social_demo/pages/social_login/social_login.dart';
import 'package:social_demo/util/util.dart';

List googleUser = [];
List facebookUser = [];

class SocialLoginViewModel {
  SocialLoginScreenState state;

  SocialLoginViewModel(SocialLoginScreenState state) {
    this.state = state;
  }

  final FacebookLogin facebookSignIn = new FacebookLogin();
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> gSignIn() async {
    googleSignIn.signOut();
    googleUser.clear();
    try {
      await googleSignIn.signIn().then((value) {
        print("Google SignIn User Details == $value");
        if (value.id != null) {
          googleUser.add(value);
          Navigator.push(state.context,
              MaterialPageRoute(builder: (context) => GoogleScreen()));
        }
      });
    } catch (error) {
      print(error);
    }
  }

  Future<Map<String, dynamic>> getFacebookDetails(String url) async {
    bool isConnect = await isConnectNetworkWithMessage(state.context);
    if (!isConnect) return null;
    http.Response response = await http.get(url);
    String data = response.body;
    return jsonDecode(data);
  }

  Future<Null> fbSignIn() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        String url =
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${accessToken.token}';
        Map<String, dynamic> response = await getFacebookDetails(url);
        print("Facebook Login Success = $response");
        facebookUser.add(response);
          await Navigator.push(state.context,
              MaterialPageRoute(builder: (context) => FacebookScreen()));


        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  void generateDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://socialdemo.page.link',
      link: Uri.parse('https://socialdemo.page.link/invitefriend=1}'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.socialdemo',
        minimumVersion: 1,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.example.socialdemo',
        minimumVersion: '1.0.1',
        appStoreId: '123456789',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: 'Social Login',
        description: 'Social login app for learn and earn!',
      ),
    );

    final Uri dynamicUrl = await parameters.buildUrl();
    final ShortDynamicLink shortenedLink =
        await DynamicLinkParameters.shortenUrl(
      dynamicUrl,
      DynamicLinkParametersOptions(
          shortDynamicLinkPathLength: ShortDynamicLinkPathLength.unguessable),
    );
    final Uri shortUrl = shortenedLink.shortUrl;

    print(shortUrl);
    print(dynamicUrl);

    Share.share('Social Login $shortUrl');
  }
}
