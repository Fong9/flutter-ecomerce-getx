import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  Future<Map<String, dynamic>?>  signIn() async {
    final res = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile']
    );
    
    if(res.status != LoginStatus.success) {
      return null;
    }

    final userData = await FacebookAuth.instance.getUserData(
      fields: "id,name,email,picture.width(200)",
    );

    return userData;
  }

  Future<void> signOut() async {
    await FacebookAuth.instance.logOut();
  }
}