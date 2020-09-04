# google_play_store_scraper_dart

A flutter package to scrape data from the Google Play Store.

### Show some :heart: and :star: the repo to support the project


## Getting started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  google_play_store_scraper_dart:
```

In your library add the following import:

```dart
import 'package:google_play_store_scraper_dart/google_play_store_scraper_dart.dart';
```

For help getting started with Flutter, view the online [documentation](https://flutter.io/).


### How to use

```
1. First create an object

    GooglePlayScraperDart scraper = GooglePlayScraperDart();  

2. Then pass the appID to the app method to get a Future as a map of all the required data for example,  

    async scraper.app(appID: 'com.twitter.android'); 
 
For an example of how to use it, checkout the example/example_app.dart file  
```

You can checkout this example app [Example](https://github.com/varamsky/google_play_store_scraper_dart/blob/master/example/example_app.dart).

##Results

```map
{
title : Twitter - Apps on Google Play,
description : Join the conversation! Twitter is your go-to social media app and the source for what's happening in the world. Tweets cover trending topics from world news to local news, celebrity gossip to sports and gaming, politics to fun stories that go viral, if it happens in the world, it is trending now on Twitter. Find friends, share your opinion, gain followers or follow influential people - every voice can impact the world! Join over 2 BILLION users worldwide!Tweet, Retweet, Reply to Tweets, Share or Like all that’s trending now!Retweet, chat privately or go big and initiate a group conversation with your Twitter followers. Get all the social media news in one place - Search hashtags and influencers, chat with friends & other Twitter followers or follow your favorite celebrity alongside hundreds of interesting Twitter users. Read their content & all trending topics at a glance. Engage your social network with noteworthy links, photos and videos. Start microblogging, share your opinion and discover which of your daily Tweets were liked or Retweeted.Create Your Free Twitter Account Today!Twitter allows you to find interesting people or build a following of people who are interested in your opinion. Social networking has never been easier! Twitter allows celebs to build a personal connection and even chat with their fans. This is why Twitter has become one of the most used social media platforms in the world.Build an Engaging Profile*Customize your profile, add a photo, description, location, and background photo*Tweet often, expand your social network and optimize your posting times*Post visual content*Use hashtags in your tweets*Draw in followers from other social media platforms outside of TwitterKnow What’s Trending NowDiscover top trending hashtags, find the latest social media news and celebrity gossip, stories, entertainment and breaking news headlines. Whether you’re interested in sports highlights, pop culture and entertainment or politics, Twitter is your source of information.Live Streaming EventsJoin the conversation or watch live videos to deeply engage with large audiences & influencers directly from your mobile device. Go Live, create your own live streaming events, share videos or sit back and watch events from around the world.Like us on Facebook https://www.facebook.com/TwitterInc/Follow us on Instagram https://www.instagram.com/twitter/?hl=enPrivacy Policy: https://twitter.com/en/privacyTerms and Conditions: https://twitter.com/en/tosWe share device identifying data with some advertising partners which may include app opens that happen prior to signing up. Please see here for more details: https://help.twitter.com/en/safety-and-security/data-through-partnershipsRead ...
updated : August 31, 2020
size : Varies with device
installs : 1,000,000,000+
ratingsScore : 4.381053447723389
ratingsScoreText : 4.4
ratingsCount : 16246546
price : 0
free : true
priceCurrency : USD
version : Varies with device
androidVersion : Varies with device
contentRating : Rated for 12+Parental Guidance Recommended
developer : Twitter, Inc.
developerID : Twitter,+Inc.
developerEmail : google-play-emails@twitter.com
developerWebsite : https://support.twitter.com/articles/20169915
developerAddress : Twitter, Inc.
1355 Market Street, Suite 900
San Francisco, CA 94103
privacyPolicy : http://twitter.com/privacy
genre : News & Magazines
genreID : NEWS_AND_MAGAZINES
icon : https://lh3.googleusercontent.com/wIf3HtczQDjHzHuu7vezhqNs0zXAG85F7VmP7nhsTxO3OHegrVXlqIh_DWBYi86FTIGk=s180
appID : com.twitter.android
url : https://play.google.com/store/apps/details?id=com.twitter.android&hl=en
}
```



### Contributions

Feel free to make the code better, I am looking forward to contributions by the community.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/varamsky/google_play_store_scraper_dart/issues).  
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/varamsky/google_play_store_scraper_dart/pulls).

### Created & Maintained By

[Shubham Kumar](https://github.com/varamsky). You can connect with me on [LinkedIn](https://www.linkedin.com/in/shubhamkumar-l/), or just drop a mail at shubhamkumar5772@gmail.com :v:


<p align="center">
<a href="https://www.linkedin.com/in/shubhamkumar-l/">
    <img src="https://img.shields.io/badge/Support-Recommed%2FEndorse%20me%20on%20Linkedin-blue?style=for-the-badge&logo=linkedin" alt="Recommend me on LinkedIn" /></a>
</p>


# License

    Copyright 2020 Shubham Kumar

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.



## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).