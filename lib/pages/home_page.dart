import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import '../components/custom_button.dart';
import 'package:url_launcher/url_launcher.dart'; // 추rk된 패키지

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _sendKakaoLoginRequest() async {
      try {
        final response = await http.get(Uri.parse('http://localhost:8080/kakao-login'));

        if (response.statusCode == 302 || response.statusCode == 200) {
          final redirectUrl = response.body;
          if (redirectUrl != null) {
            print('Redirecting to: $redirectUrl');
            // 웹 브라우저를 사용하여 redirectUrl로 이동
            if (await canLaunchUrl(Uri.parse(redirectUrl))) {
              await launchUrl(Uri.parse(redirectUrl));

              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> KakaoLoginCallbackPage()));

            } else {
              throw 'Could not launch $redirectUrl';
            }
          } else {
            print("header${response.body}");
            print('No redirect URL found.');
          }
        } else {
          print('Login request failed with status: ${response.statusCode}');
        }
      } catch (e, stacktrace) {
        print('Login request failed with error: $e');
        print('Stacktrace: $stacktrace');
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              text: 'Sign In',
              onPressed: () => context.go('/login'),
            ),
            SizedBox(height: 24),
            CustomButton(
              text: 'Create an Account',
              onPressed: () => context.go('/signup'),
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendKakaoLoginRequest,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
              ),
              child: Image.asset(
                "assets/kakao_login_medium_narrow.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

