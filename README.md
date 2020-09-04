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