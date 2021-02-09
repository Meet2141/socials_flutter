import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:share/share.dart';
import 'package:social_demo/pages/google_screen/google_screen.dart';
import 'package:social_demo/pages/social_login/social_login.dart';

List googleUser = [];
List facebookUser = [];

class SocialLoginViewModel {
  SocialLoginScreenState state;

  SocialLoginViewModel(SocialLoginScreenState state) {
    this.state = state;
  }

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
