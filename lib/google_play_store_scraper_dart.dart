library google_play_store_scraper_dart;

import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

/// A flutter package to scrape data from the Google Play Store
/// HOW TO USE?
/// 1. First create an object
///     GooglePlayScraperDart scraper = GooglePlayScraperDart();
/// 2. Then pass the appID to the app method to get a Future as a map of all the required data for example,
///     async scraper.app(appID: 'com.twitter.android')
/// For an example of how to use it, checkout the example/main.dart file

/// GooglePlayScraperDart main class
class GooglePlayScraperDart {
  /// domain for the google play website
  final String domain = 'https://play.google.com';

  /// creating a WebScraper object which helps us scrape data from the website
  final WebScraper webScraper = WebScraper('https://play.google.com');

  /// this method returns a Future with a Map of details about the required app from the Play Store
  /// [appID] is the appID for a particular app on the play store
  /// [gl] is an optional parameter for providing the Geographical location.
  /// It's default value is "in" i.e, for the the Geographical Location of India.
  /// You can provide any Geographical Location you want
  /// for example, "in" => India, "us" => USA, "ch" => China, "uk" => United Kingdom and so on..
  Future<Map<String, dynamic>> app(
      {@required String appID, String gl = 'in'}) async {
    /// defining the end-point of the website
    final String endpoint = '/store/apps/details?id=$appID&gl=$gl';

    /// this will contain the final result of the scrapping
    Map<String, dynamic> result = Map<String, dynamic>();

    if (await webScraper.loadWebPage(endpoint)) {
      try {
        /// grab the title of the app
        final title = webScraper.getElement('title', []).first['title'];
        //print(title);

        /// grab the description of the app
        final description =
            webScraper.getElement('div.W4P4ne', []).first['title'];
        //print('Description : ${description}');

        /// grab all additional info of the app
        final additionalInfo =
            webScraper.getElement('div.IQ1z0d > span.htlgb', []);
        //print('\n\n additionalInfo: $additionalInfo\n\n');

        final String updated = additionalInfo[0]['title'];
        //print('\n\n updated: $updated\n\n');

        final String size = additionalInfo[1]['title'];
        //print('\n\n size: $size\n\n');

        final String installs = additionalInfo[2]['title'];
        //print('\n\n installs: $installs\n\n');

        final String version = additionalInfo[3]['title'];
        //print('\n\n version: $version\n\n');

        final String androidVersion = additionalInfo[4]['title'];
        //print('\n\n androidVersion: $androidVersion\n\n');

        final String contentRating =
            (additionalInfo[5]['title']).split('Learn More')[0];
        //print('\n\n contentRating: $contentRating\n\n');

        final String developer =
            additionalInfo[additionalInfo.length - 2]['title'];
        //print('\n\n developer: $developer\n\n');

        /// grab all developer details
        final devElement = webScraper.getElement(
            'div.hAyfc > span.htlgb > div.IQ1z0d > span.htlgb > div > a',
            ['href']);
        //print('devElement => $devElement');

        String developerWebsite, developerEmail, privacyPolicy;

        for (int i = 0; i < devElement.length; i++) {
          if (devElement[i]['title'] == 'Visit website') {
            developerWebsite = devElement[i]['attributes']['href'];
            developerEmail = devElement[i + 1]['title'];
            privacyPolicy = devElement[i + 2]['attributes']['href'];
          }
        }
        //print('\n\n developerWebsite: $developerWebsite\n\n');
        //print('\n\n developerEmail: $developerEmail\n\n');
        //print('\n\n privacyPolicy: $privacyPolicy\n\n');

        /// grab the developer address
        final developerAddress = webScraper
            .getElement('div.IQ1z0d > span.htlgb > div', []).last['title'];
        //print('\n\nDeveloper Address :: ${developerAddress.last}\n');

        final ratingsScoreText = webScraper.getElement(
            'div.W4P4ne > c-wiz > div.K9wGie > div.BHMmbe', []).first['title'];
        //print('ratingsScoreText: $ratingsScoreText');

        final dataFromScripts = webScraper.getAllScripts();
        String ratingsScore = '',
            ratingsCount = '',
            price = '',
            priceCurrency = '';
        bool free = false;

        for (var scriptData in dataFromScripts) {
          if (scriptData.contains('ratingValue')) {
            var dataList = scriptData.split('",');
            for (var listElement in dataList) {
              if (listElement.contains('ratingValue')) {
                ratingsScore = listElement.split(':"')[1];
                //print('ratingsScore: $ratingsScore');
              }
              if (listElement.contains('ratingCount')) {
                ratingsCount = listElement.split(':"')[1].split('"},')[0];
                //print('ratingsCount: $ratingsCount');
              }
              if (listElement.contains('"price"')) {
                price = listElement.split(':"')[1];
                if (price == '0') free = true;
                //print('price: $price\n free: $free');
              }
              if (listElement.contains('"priceCurrency"')) {
                priceCurrency = listElement.split(':"')[1];
                //print('priceCurrency: $priceCurrency');
              }
            }
          }
        }

        /// grab the genre of the app
        final genreElement = webScraper.getElement(
            'div.jdjqLd > div.ZVWMWc > div.qQKdcc > span > a', ['href']);
        String developerID = '', genre = '', genreID = '';
        //print('\n genreElement: $genreElement\n');

        for (var genreEle in genreElement) {
          //print('genreEle: $genreEle');
          if ((genreEle['attributes']['href']).toString().contains('id')) {
            developerID =
                (genreEle['attributes']['href']).toString().split('id=')[1];
            //print('developerID: $developerID');
          }
          if ((genreEle['attributes']['href'])
              .toString()
              .contains('category')) {
            genre = genreEle['title'];
            genreID = (genreEle['attributes']['href'])
                .toString()
                .split('category/')[1];
            //print('genre: $genre');
            //print('genreID: $genreID');
          }
        }

        /// grab the app icon
        final iconElement = webScraper.getElement(
            'div.oQ6oV > div.hkhL9e > div.xSyT2c > img', ['src', 'alt']);
        //print('iconElement: $iconElement');
        String icon = '';

        for (var element in iconElement) {
          if ((element['attributes']['alt']).toString().toLowerCase() ==
              'cover art') {
            icon = element['attributes']['src'];
            //print('icon: $icon');
          }
        }

        /// creating the map containing all data
        result.addAll(
          {
            'title': title,
            'description': description,
            'updated': updated,
            'size': size,
            'installs': installs,
            'ratingsScore': ratingsScore,
            'ratingsScoreText': ratingsScoreText,
            'ratingsCount': ratingsCount,
            'price': price,
            'free': free,
            'priceCurrency': priceCurrency,
            'version': version,
            'androidVersion': androidVersion,
            'contentRating': contentRating,
            'developer': developer,
            'developerID': developerID,
            'developerEmail': developerEmail,
            'developerWebsite': developerWebsite,
            'developerAddress': developerAddress,
            'privacyPolicy': privacyPolicy,
            'genre': genre,
            'genreID': genreID,
            'icon': icon,
            'appID': appID,
            'url': 'https://play.google.com/store/apps/details?id=$appID&hl=en'
          },
        );
      } catch (error) {
        print('Cannot find the app on Play Store.'
            '\nPlease make sure that you have mentioned the correct appID '
            'and the app is available in the Geographical Location mentioned with the "gl" attribute passed to the app() method.'
            '\n If you have not mentioned anything for the "gl" attribute it defaults to the "in" i.e, the Geographical Location of India.');

        print('Error: $error');
      }
    } else {
      /// if there error in getting access to play store
      print('Cannot load url.'
          '\nPlease make sure that you are connected to the Internet.'
          '\nPlease make sure that you have mentioned the correct appID '
          'and the app is available in the Geographical Location mentioned with the "gl" attribute passed to the app() method.'
          '\n If you have not mentioned anything for the "gl" attribute it defaults to the "in" i.e, the Geographical Location of India.');
    }

    return result;
  }
}
