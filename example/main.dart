import 'package:flutter/material.dart';
import 'package:google_play_store_scraper_dart/google_play_store_scraper_dart.dart'; // import the package file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// create a GooglePlayScraperDart object
    GooglePlayScraperDart scraper = GooglePlayScraperDart();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Example App',
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Play store data'),
          ),
          body: FutureBuilder(
            /// call to scraper.app() method with the appID of the required app for example, com.twitter.android
            future: scraper.app(appID: 'com.twitter.android'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return (snapshot.hasData)
                    ? ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 2.0,
                          );
                        },
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          String key = snapshot.data.keys.elementAt(index);
                          return Column(
                            children: <Widget>[
                              /// creating a ListTile with the details received from the scraper
                              ListTile(
                                title: Text("$key"),
                                subtitle: Text("${snapshot.data[key]}"),
                              ),
                            ],
                          );
                        },
                      )
                    : Center(
                        // if there is no data available about the appID provided
                        child: Text('No data available'),
                      );
              }
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
