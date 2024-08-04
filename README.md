# Weather Forecast App

This project is a weather forecast application built using Flutter and OpenWeatherAPI. It retrieves weather data from a remote API and displays it to the user.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Running the App](#running-the-app)
- [Testing](#testing)
- [Dependencies](#dependencies)

## Features

- Fetches weather forecast data from a remote API
- Displays weather data in a user-friendly format
- Supports searching for weather by city name
- Supports offline by cachinng last fetched data
- Unit test for models, usecase, and cubit

## Installation 

 - Clone the repository ```git clone https://github.com/Daffa2101/weather_app.git```
 - No need to update the Api Key

## Running the App

- Open terminal
- Run ```flutter pub get```
- Run ```dart run build_runner build --delete-conflicting-outputs```
- Start running the app from main.dart

## Testing
- Open terminal
- Run ```flutter test```

## Dependencies Choices
 - BloC, saya menggunakan bloc karena telah familiar dengan state management ini. Pada app ini saya menggunakan cubit. Saya merasa dengan menggunakan bloc penulisan logika bisnis menjadi lebih clean.
 
 - Shared Preferences, saya menggunakan shared preferences sebagai local directory simple untuk membantu dalam menyimpan last fetched data sehingga app dapat berjalan secara offline. 

 - Dio, saya memilih menggunakan Dio karena dio menyediakan kemudahan dalam mengelola error-error yang mungkin terjadi ketia proses pemanggilan API.



