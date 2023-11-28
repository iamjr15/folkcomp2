import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/index.dart';

import '../chat/chat_screen.dart';
import '../static_screens/privacy_policy_screen.dart';
import '../static_screens/terms_condition_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [],
      );

      await googleSignIn.signOut();
      final account = await googleSignIn.signIn();

      print('GoogleSignInAccount=$account');
      if (account != null) Get.offAll(const ChatScreen());
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: signInBg,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: circleRed,
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'folkcomputing\nv2',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.extraBoldBlack36w800,
                  ),
                  ElevatedButton(
                    onPressed: isChecked
                        ? () async {
                            await signInWithGoogle();
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnBlue,
                      disabledBackgroundColor: grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 70,
                      ),
                    ),
                    child: Text(
                      'Sign in with gmail',
                      style: AppTextStyle.semiBoldWhite18w600P,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ListTile(
                      leading: Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          value: isChecked,
                          splashRadius: 0.1,
                          side: BorderSide(color: transparent),
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => isChecked ? btnBlue : lightGrey),
                          onChanged: (val) =>
                              setState(() => isChecked = !isChecked),
                        ),
                      ),
                      title: Text(
                        'I accept the privacy policy and terms and conditions.',
                        style: AppTextStyle.regularBlacks16w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(const PrivacyPolicyScreen()),
                    child: Text(
                      'privacy policy',
                      style: AppTextStyle.regularBlack15w500P,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(const TermsConditionsScreen()),
                    child: Text(
                      'terms and conditions',
                      style: AppTextStyle.regularBlack15w500P,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
