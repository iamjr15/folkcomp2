import '../../utils/index.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Terms and Conditions',
          style: AppTextStyle.semiBoldBlack22w600P,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonTextWidget('FOLK COMPUTING APP PRIVACY POLICY'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'These terms and conditions ("Terms") govern your use of the Folk Computing App ("the App"), developed and owned by HealthUnity ("the Company"). By accessing or using the App, you agree to comply with these Terms. If you do not agree with any part of these Terms, please refrain from using the App.'),
                getSixedBoxWidget(),
                commonTextWidget('1. App Description and Functionality'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'The Folk Computing App utilizes large language models, specifically GPT AI, to provide health suggestions to users. It is important to note that the App does not act as a medical professional but rather as a health-suggestive entity. The suggestions provided by the App do not exceed recommendations for "over-the-counter" treatments. Additionally, the App incorporates speech-to-text and text-to-speech functionalities to facilitate audio input and output for user flexibility. The current version of the App supports the Hindi language.'),
                getSixedBoxWidget(),
                commonTextWidget('2. Ownership and Contact Information'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'The Folk Computing App is developed and owned by HealthUnity. For any queries or concerns regarding the App, please contact us at contact@healthunity.org.'),
                getSixedBoxWidget(),
                commonTextWidget('3. App Language'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'The App is currently available in the Hindi language.'),
                getSixedBoxWidget(),
                commonTextWidget('4. Platform Availability'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'The Folk Computing App is currently available for the Android platform. The Company reserves the right to extend platform availability in the future.'),
                getSixedBoxWidget(),
                commonTextWidget('5. App Limitations and Use'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'The Folk Computing App is currently in a demo version and may not provide accurate data or information. It is important to understand that the App does not offer professional advice but solely provides suggestions. Users should exercise caution and consult a qualified healthcare professional for personalized medical advice. The Company shall not be held liable for any consequences resulting from the use or misuse of the App\'s suggestions.'),
                getSixedBoxWidget(),
                commonTextWidget('6. Data Collection and Privacy'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'The App utilizes the OpenAI API to access the GPT-3.5 model and Google Firebase for translation and speech-to-text functionalities. To access the App\'s features, users are required to create an account, which registers them in the App\'s Firebase userbase. The Company values user privacy and will handle all personal information in accordance with applicable data protection laws and regulations. For detailed information on data collection, storage, and usage, please refer to our Privacy Policy.'),
                getSixedBoxWidget(),
                commonTextWidget('7. Payment Terms'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'There are currently no payment terms associated with the use of the Folk Computing App. However, the Company reserves the right to introduce premium features or subscriptions in the future, which will be subject to separate terms and conditions.'),
                getSixedBoxWidget(),
                commonTextWidget('8. Disclaimer of Liability'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'The Folk Computing App is still under development and may contain inaccuracies or errors. The Company does not guarantee the accuracy, reliability, or completeness of the App\'s suggestions. Furthermore, the App may encounter grammatical or pronunciation errors in its responses. Users acknowledge and accept these limitations, and the Company shall not be held liable for any direct or indirect damages arising from the use of the App.'),
                getSixedBoxWidget(),
                commonTextWidget('9. Termination'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'The Company reserves the right to suspend or terminate your access to the Folk Computing App at any time without prior notice if you violate these Terms or engage in any unauthorized or unlawful activities.'),
                getSixedBoxWidget(),
                commonTextWidget('10. Modifications to the Terms'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'The Company reserves the right to modify these Terms at its discretion. Any changes will be effective immediately upon posting the updated Terms within the App. Your continued use of the App after any modifications constitute your acceptance of the revised Terms.'),
                getSixedBoxWidget(),
                commonTextWidget('11. Governing Law and Jurisdiction'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'These Terms shall be governed by and construed in accordance with the laws of United States of America. Any disputes arising out of or in connection with these Terms shall be subject to the exclusive jurisdiction of the courts of United States of America.'),
                getSixedBoxWidget(height: 30),
                commonTextWidget(
                    'For any questions or concerns regarding these Terms, please contact us at contact@healthunity.org'),
                getSixedBoxWidget(),
                commonTextWidget('Last updated: July 6th, 2023'),
                getSixedBoxWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text commonTextWidget(String text) => Text(text);

  SizedBox getSixedBoxWidget({double? height = 20}) => SizedBox(height: height);
}
