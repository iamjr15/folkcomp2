import 'package:medical_diagnosis/networks/apis.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

import '../../utils/index.dart';

import '../../models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String selectedLang = 'hi_IN';
  FocusNode chatFocus = FocusNode();
  ScrollController scrollController = ScrollController();
  TextEditingController chatController = TextEditingController();
  List<ChatModel> chats = <ChatModel>[
    // ChatModel(
    //   chat: 'Testing',
    //   isGenerated: true,
    // ),
    // ChatModel(
    //   chat: 'मुझे पेट दर्द है',
    //   isGenerated: false,
    // ),
  ];

  final bool _logEvents = true;
  final bool _onDevice = false;
  final bool hasSpeech = false;
  String lastError = '';
  String lastStatus = '';
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    initSpeechState();
    super.initState();
  }

  @override
  void dispose() {
    chatFocus.dispose();
    chatController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  Future<void> initSpeechState() async {
    _logEvent('Initialize');
    try {
      var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: _logEvents,
      );
      _logEvent('---hasSpeech=$hasSpeech');
      if (hasSpeech) {}
      if (!mounted) return;

      setState(() {});
    } catch (e) {
      setState(() {
        lastError = 'Speech recognition failed: ${e.toString()}';
      });
    }
  }

  void startListening() {
    _logEvent('start listening');

    speech.listen(
      onResult: resultListener,
      listenFor: const Duration(seconds: 30),
      pauseFor: const Duration(seconds: 3),
      partialResults: true,
      localeId: selectedLang,
      cancelOnError: true,
      listenMode: ListenMode.confirmation,
      onDevice: _onDevice,
    );
    // gu_IN = gujarati
    // hi_IN = hindi
    // ta_IN = tamil
    // te_IN = telugu
    // bn_BD = bangali
    setState(() {});
  }

  void stopListening() {
    _logEvent('stop');
    speech.stop();
  }

  void cancelListening() {
    _logEvent('cancel');
    speech.cancel();
  }

  void resultListener(SpeechRecognitionResult result) {
    _logEvent(
        'Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
    setState(() {
      if (result.finalResult) chatController.text = result.recognizedWords;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    _logEvent(
        'Received error status: $error, listening: ${speech.isListening}');
    setState(() => lastError = '${error.errorMsg} - ${error.permanent}');
  }

  void statusListener(String status) {
    _logEvent(
        'Received listener status: $status, listening: ${speech.isListening}');
    setState(() => lastStatus = status);
  }

  void _logEvent(String eventDescription) {
    if (_logEvents) {
      var eventTime = DateTime.now().toIso8601String();
      // ignore: avoid_print
      print('---$eventTime ---$eventDescription');
    }
  }

  void sendMsg() async {
    var text = chatController.text;
    var chat = ChatModel.fromJson({
      "chat": text,
      "isGenerated": false,
    });
    chats.insert(0, chat);

    var typing = ChatModel.fromJson({
      "chat": "assistant typing...",
      "isGenerated": true,
    });
    chats.insert(0, typing);
    chatController.clear();
    setState(() {});

    final res = await API.callAI(text);
    print('---${res == "null"}--res=$res');
    if (res != 'null') {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          var data = ChatModel.fromJson({
            "chat": res,
            "isGenerated": true,
          });
          chats.insert(0, data);
          setState(() => {});
          chats.removeWhere(
              (c) => c.chat == 'assistant typing...' && c.isGenerated);
          setState(() => {});
        },
      );
      setState(() {});
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    } else {
      print('---else');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'folkComputing v2',
          style: AppTextStyle.semiBoldBlack22w600P,
        ),
        leading: const SizedBox(),
        leadingWidth: 0.1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppAsset.logout,
              width: 45,
              height: 35,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() => selectedLang = 'hi_IN');
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: selectedLang == 'hi_IN'
                                ? languageBtnBlue
                                : ultraLightGrey,
                          ),
                          child: Text(
                            'हिंदी',
                            style: AppTextStyle.semiBoldBlack20w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() => selectedLang = 'ta_IN');
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: selectedLang == 'ta_IN'
                                ? languageBtnBlue
                                : ultraLightGrey,
                          ),
                          child: Text(
                            'தமிழ்',
                            style: AppTextStyle.semiBoldBlack20w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() => selectedLang = 'te_IN');
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: selectedLang == 'te_IN'
                                ? languageBtnBlue
                                : ultraLightGrey,
                          ),
                          child: Text(
                            'తెలుగు',
                            style: AppTextStyle.semiBoldBlack20w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() => selectedLang = 'bn_BD');
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: selectedLang == 'bn_BD'
                                ? languageBtnBlue
                                : ultraLightGrey,
                          ),
                          child: Text(
                            'বাংলা',
                            style: AppTextStyle.semiBoldBlack20w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                primary: false,
                shrinkWrap: true,
                itemCount: chats.length,
                controller: scrollController,
                itemBuilder: (context1, index) {
                  var chat = chats[index].chat.toString();
                  var isGenerated = chats[index].isGenerated;

                  return Align(
                    alignment: isGenerated
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: size.width * 0.8,
                      ),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: isGenerated ? lightBlue : lightYellow,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                          bottomLeft: isGenerated
                              ? const Radius.circular(0)
                              : const Radius.circular(10),
                          bottomRight: isGenerated
                              ? const Radius.circular(10)
                              : const Radius.circular(0),
                        ),
                      ),
                      child: Text(
                        chat,
                        style: AppTextStyle.semiBoldBlack18w600,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      startListening();
                    },
                    child: Image.asset(
                      AppAsset.microphone,
                      width: 50,
                      height: 40,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: grey,
                      focusNode: chatFocus,
                      controller: chatController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ultraLightGrey,
                        hintText: 'type..',
                        hintStyle: AppTextStyle.regularGrey20w500P,
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      style: AppTextStyle.regularBlack20w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (chatController.text.isNotEmpty) {
                        chatFocus.unfocus();
                        sendMsg();
                        // var chat = ChatModel.fromJson({
                        //   "chat": chatController.text,
                        //   "isGenerated": false,
                        // });
                        // chats.insert(0, chat);
                        // var typing = ChatModel.fromJson({
                        //   "chat": "assistant typing...",
                        //   "isGenerated": true,
                        // });
                        // chats.insert(0, typing);
                        // Future.delayed(
                        //   const Duration(seconds: 2),
                        //   () {
                        //     var test = ChatModel.fromJson({
                        //       "chat": "Test",
                        //       "isGenerated": true,
                        //     });
                        //     chats.insert(0, test);

                        //     chats.removeWhere((c) =>
                        //         c.chat == 'assistant typing...' &&
                        //         c.isGenerated);
                        //     setState(() => {});
                        //   },
                        // );
                        // chatController.clear();
                        // setState(() {});
                        // scrollController.animateTo(
                        //   scrollController.position.minScrollExtent,
                        //   duration: const Duration(milliseconds: 100),
                        //   curve: Curves.ease,
                        // );
                      }
                    },
                    child: Image.asset(
                      AppAsset.send,
                      width: 45,
                      height: 35,
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
