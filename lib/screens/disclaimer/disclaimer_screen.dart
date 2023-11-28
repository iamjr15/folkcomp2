import '../../utils/index.dart';

import '../login/login_screen.dart';

class DisclaimerScreen extends StatefulWidget {
  const DisclaimerScreen({super.key});

  @override
  State<DisclaimerScreen> createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: signInBg,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'IMPORTANT!',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.extraBoldBlack36w800,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'The folk computing app provides health suggestions but does not replace professional medical advice. Consult a healthcare professional for personalised guidance. Accuracy may vary, and the app is still in development. Use at your own discretion.',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.regularBlack20w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            ListTile(
              leading: Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  value: isChecked,
                  splashRadius: 0.1,
                  side: BorderSide(color: transparent),
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => isChecked ? btnBlue : lightGrey),
                  onChanged: (val) => setState(() => isChecked = !isChecked),
                ),
              ),
              title: Text(
                'I understand',
                style: AppTextStyle.regularBlacks16w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isChecked
                      ? () {
                          Get.offAll(const LoginScreen());
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
                    'Continue',
                    style: AppTextStyle.semiBoldWhite18w600P,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
