import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static Future<String> callAI(String text) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer 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',
      'Cookie':
          '__cf_bm=0BI.D.Wst2PCi5psIdTC4i94paAABWfZyN4yFrCRvKY-1700744462-0-ATjV+q5K7wbc4b2sj1Qu/yde+zrd/JwAZDdynVa7vDewU6CFm3zA2ePzaSUYBcvS2XXxNB6ukv3GAYqZui93xJM=; _cfuvid=2l1BlcYL_vXGHyrv7I_eRmVToUzWJDNCzMAmJbFknV0-1700744462634-0-604800000; __cf_bm=RNLvkUpax89KsQMRz7e7KRt8Xg2854LvKPPuh4rLfMk-1700745068-0-AYsf92UTojqZeg96Zbh0fX/SJPdj7E68MBltltd0X87SMeRRgZ2MoUfryf7WsKC2pyOBV1bfrxlkY+5bIGRIdug=; _cfuvid=GQeawGo7XzAmWJqysfibp7D.j6PAXgeMYM.Epc8cB1g-1700745068579-0-604800000; __cf_bm=Q16gOyfwZK2I1FhOX5Ii0lRPj9Z1AqMeAfqXJ6Ebxwk-1700746720-0-AdntyA+zUIYldLUcICqPIzuq5GhDzAaid2SyCH1SbwMdqbwOThJWJjOvNaVe9n+1V4sK15uY4PrgKvQSLoqniQg=; _cfuvid=Px5vw0a0t7lkPx_OX5WSeGRjc3cqRymVO3INFQ.569w-1700746720667-0-604800000'
    };
    var request = http.Request(
        'POST', Uri.parse('https://api.openai.com/v1/chat/completions'));
    request.body = json.encode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": text}
      ],
      "max_tokens": 512,
      "top_p": 1,
      "temperature": 0.5,
      "frequency_penalty": 0,
      "presence_penalty": 0
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      final jsonData = json.decode(data);
      final res = jsonData['choices'][0]['message']['content'].toString();
      print('----------data=$res');
      return res;
    } else {
      print('----------response.reasonPhrase=${response.reasonPhrase}');
      return 'null';
    }
  }
}
