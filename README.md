# book_app_api

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Powered by Dart Frog][dart_frog_badge]][dart_frog_link]

An example api book application built with dart_frog and firebase

> To start the server you need to write the following in terminal 
```shell
dart_frog dev
```

> **_NOTE:_** The server run on port 8080 by default to use a specific port
```shell
dart_frog dev --port your_port
```
> the api contains **admin** route as well as **user** route each of which contains another
> 3 routes **category**, **popular** and **search**
> within **category** route there is another route **add_book** so that the admin can
> add a new book in this category

> So we have 3 endpoints on admin part `admin/category/add_book`, `admin/popular` and `admin/search`
> and another 3 endpoints on user part `user/category`, `user/popular` and `user/search`

> **_NOTE:_** the user have limited permissions so he can send a **get** request only
> but the admin can create new category, delete it, add new book or delete it and so on..

A demo on postman
[![Postman: Demo][postman_badge]][postman_link]

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[dart_frog_badge]: https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge
[dart_frog_link]: https://dartfrog.vgv.dev
[postman_badge]: https://www.bing.com/images/blob?bcid=qKzFHNESoSIGnlpN9F2m7-o11GlG.....08
[postman_link]: https://elements.getpostman.com/redirect?entityId=23987421-ddd6139a-172e-4b7f-84f0-5c22c2380ddb&entityType=collection
