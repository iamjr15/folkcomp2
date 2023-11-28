import '../../utils/index.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Privacy Policy',
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
                    'This Privacy Policy governs the manner in which HealthUnity ("the Company") collects, uses, maintains, and discloses information collected from users ("User" or "you") of the Folk Computing App ("the App"). This Privacy Policy applies to the App and all services offered by the Company.'),
                getSixedBoxWidget(),
                commonTextWidget('1. Information Collection'),
                getSixedBoxWidget(),
                commonTextWidget(
                    '1.1 Personal Information: In order to access and use the App, users are required to create an account. During the registration process, the App may collect certain personal information, including but not limited to:'),
                getSixedBoxWidget(height: 10),
                commonTextWidget('* Full name'),
                commonTextWidget('* Email address'),
                commonTextWidget('* Username and password'),
                commonTextWidget(
                    '* Other information voluntarily provided by the user'),
                getSixedBoxWidget(),
                commonTextWidget(
                    '1.2 Usage Information: The App may collect non-personal information about how users interact with the App, such as device information, IP addresses, and usage patterns. This information is collected to improve the performance, functionality, and user experience of the App.'),
                getSixedBoxWidget(),
                commonTextWidget('2. Information Usage'),
                getSixedBoxWidget(),
                commonTextWidget(
                    '2.1 Personal Information: The personal information collected from users may be used for the following purposes:'),
                getSixedBoxWidget(height: 10),
                commonTextWidget('* To create and manage user accounts'),
                commonTextWidget(
                    '* To provide personalized suggestions and features within the App'),
                commonTextWidget(
                    '* To communicate with users, respond to inquiries, and provide customer support'),
                commonTextWidget(
                    '* To send periodic emails regarding the App and related services'),
                getSixedBoxWidget(),
                commonTextWidget(
                    '2.2 Non-Personal Information: Non-personal information collected may be used for statistical analysis, research, and to improve the overall functionality and performance of the App.'),
                getSixedBoxWidget(),
                commonTextWidget('3. Information Disclosure'),
                getSixedBoxWidget(),
                commonTextWidget(
                    '3.1 Protection of Personal Information: The Company implements appropriate data collection, storage, and processing practices, as well as security measures, to protect against unauthorized access, alteration, disclosure, or destruction of personal information stored within the App.'),
                getSixedBoxWidget(),
                commonTextWidget(
                    '3.2 Third-Party Service Providers: The Company may engage trusted third-party service providers to assist in operating the App and delivering services to users. These third parties may have access to personal information for the sole purpose of performing their tasks on behalf of the Company and are obligated not to disclose or use it for any other purpose.'),
                getSixedBoxWidget(),
                commonTextWidget(
                    '3.3 Legal Compliance: The Company may disclose personal information if required by law, regulation, legal process, or government request.'),
                getSixedBoxWidget(),
                commonTextWidget('4. Data Retention'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'The Company retains personal information for as long as necessary to fulfill the purposes outlined in this Privacy Policy, unless a longer retention period is required or permitted by law.'),
                getSixedBoxWidget(),
                commonTextWidget('5. User Rights'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'Users have the following rights regarding their personal information:'),
                getSixedBoxWidget(height: 10),
                commonTextWidget(
                    '* To access and obtain a copy of their personal information held by the Company'),
                commonTextWidget(
                    '* To request the correction or update of inaccurate or outdated personal information'),
                commonTextWidget(
                    '* To request the deletion of their personal information, subject to applicable legal requirements and the Company\'s data retention policies'),
                commonTextWidget(
                    '* To withdraw consent for the collection, use, or disclosure of personal information, where applicable'),
                getSixedBoxWidget(),
                commonTextWidget('6. Children\'s Privacy'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'The Folk Computing App is not intended for use by children under the age of 13. The Company does not knowingly collect personal information from children under 13 years of age. If a parent or guardian becomes aware that their child has provided personal information without their consent, they should contact the Company immediately.'),
                getSixedBoxWidget(),
                commonTextWidget('7. Changes to this Privacy Policy'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'The Company reserves the right to update or revise this Privacy Policy at any time. Users will be notified of any changes by updating the "Effective Date" at the top of this policy. Users are encouraged to review this Privacy Policy periodically to stay informed about how the Company is protecting and using personal information.'),
                getSixedBoxWidget(),
                commonTextWidget('8. Contact Us'),
                getSixedBoxWidget(),
                commonTextWidget(
                    'If you have any questions or concerns regarding this Privacy Policy or the practices of the Folk Computing App, please contact us at contact@healthunity.org'),
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
