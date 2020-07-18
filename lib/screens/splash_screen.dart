import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:victor/widgets/main_drawer.dart';
import '../providers/user.dart';
import '../providers/session.dart';
import 'dart:math';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<String> quotes = [
    ' ईश्वर हमारे दुश्मनों पर दया करे, क्योंकि हम तो करेंगे नहीं',
    'आतंकवादियों को माफ करना ईश्वर का काम है, लेकिन उनकी ईश्वर से मुलाकात करवाना हमारा काम है',
    'यदि कोई व्यक्ति कहे कि उसे मृत्यु का भय नहीं है तो वह या तो झूठ बोल रहा होगा या फिर वो गोरखा ही होगा.',
    ' शांति से आप अपने घर में रह सकते है जबतक की भारतीय सेना सीमा पर तैनात है.',
    'जबतक भारतीय सेना सीमा पर जाग रही है तबतक आप चैन की नीद सो सकते है.',
    'यदि हमे अपना शौर्य सिद्ध करने से पहले मृत्यु भी आ जाये तो निश्चित ही मृत्यु भी हमारा शिकार बनेगी.',
    'हम भारतीय सेना से सिर्फ दो लोग ही मिलने आते है. एक या तो वो हमारे बहुत अच्छे दोस्त होते है, या दूसरा वे हमारे कट्टर दुश्मन होते है.',
    'भारतीय सैनिक लड़ता है इसलिए नही की, वह अपने सामने वालो से नफरत करता है. बल्कि वह अपने पीछे वालो से प्यार करता है.',
    'हमारा जीना संयोग हो सकता है, पर हमारा प्यार हमारी पसंद और हमारा दुश्मन को मारना हमारा व्यवसाय है.',
    'हम पूरे दमखम से जीतने के लिए लड़ते है, क्युकी जंग में कोई भी दुसरे स्थान पर नही आता है.',
    'मैं तिरंगा फहराकर वापस आऊंगा या फिर तिरंगे में लिपटकर आऊंगा, लेकिन मैं वापस अवश्य आऊंगा.',
    'जो आपके लिए जीवनभर का असाधारण रोमांच है, वो हमारी रोजमर्रा की जिंदगी है.',
    'हमारा झण्डा इसलिए नहीं फहराता कि हवा चल रही होती है, ये हर उस जवान की आखिरी साँस से फहराता है जो इसकी रक्षा में अपने प्राणों का उत्सर्ग कर देता है.',
    'इसका हमें अफसोस है कि अपने देश को देने के लिए हमारे पास केवल एक ही जीवन है.',
    'तू शहीद हुआ, तो न जाने, कैसे तेरी माँ सोयी होगी? लेकिन एक बात तो तय है कि .. तुझे लगने वाली गोली भी, सौ बार रोयी होगी.',
    'आसमान में हजारो सितारों के होने से कही अच्छा हमारे कंधे पर दो सितारे है.'
  ];
  var isInit = true;
  var isLoading = true;
  final _random = new Random();

  void addUser() {
    Navigator.of(context).pushNamed('/adduser');
  }

  void catExer() {
    Navigator.of(context).pushNamed('/categories');
  }

  void goToMeals() {
    Navigator.of(context).pushNamed('/meals');
  }

  void goToSignup() {
    Navigator.of(context).pushReplacementNamed('/adduser');
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Users>(context, listen: false).fetchAndSet().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<Users>(context).user;
    return Scaffold(
        appBar: AppBar(
          title: Text('Victor-(Balidan Sarvoparay)'),
        ),
        drawer: MainDrawer(),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (user == null
                ? Column(
                    children: <Widget>[
                      Center(
                        child: Card(
                          color: Colors.red,
                          child: Text(
                            quotes[_random.nextInt(quotes.length)],
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          ),
                        ),
                      ),
                      Center(
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton.icon(
                              icon: Icon(
                                Icons.directions_bike,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: goToSignup,
                              label: Text(
                                'Add User',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Column(
                    children: <Widget>[
                      Center(
                        child: Card(
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              quotes[_random.nextInt(quotes.length)],
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton.icon(
                              icon: Icon(
                                Icons.directions_bike,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: catExer,
                              label: Text(
                                'Exercises',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              color: Colors.orange[600],
                            ),
                          ),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton.icon(
                              color: Colors.green[600],
                              onPressed: goToMeals,
                              icon: Icon(
                                Icons.fastfood,
                                size: 30,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Meals Planner',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              )),
                        ),
                      )
                    ],
                  )));
  }
}
