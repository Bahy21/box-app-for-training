import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import "package:googleapis_auth/auth_io.dart" as auth;

class FirebaseAccessToken {
  static Future<String> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "fanni-elmohtarf",
      "private_key_id": "e033e397142b04a9a4d97b4d0557b4ecf7f1abc2",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDWGdWx+bBeqJLU\nL5Q08/LIrnOqNs1TFaZ9pMe0O/JGcpwm0exoQH5MJCfp80rxk1LlS9tWdAl6tWP6\nGtSXZYkkJgzZQQJdDHTDCqcymX18zw2Shn1Us8z4kByqUGec/Otj8ITTTEvudi8D\nLf6RJRMgjbG/XK7ZKEwof4zGtZWNNxvE+Q2ikFQ6cCyti0aHP9qukPYp6cdBhlgl\n4h6sJlgqLcYieQ6Rx9Q6q2mKRgIDfFALR8YBXFd11XTvTv7/I3k8w9nVaWVmp6L/\n3KbCG++F+6Xndi1lZsGFshUfk+u9Z5yddD9LVJz4bI+N6Z/uKfF3wJTq9c4MXoBV\nYtbX85AhAgMBAAECggEADwAQH2gspdMmd2COgA/D57DGSIuOouayS50BA2UMTkh/\nHX6pcyvqlVvWoo7hxi9h2FASYdofJGZjRu18jc9mtn5Gee2ytFF4OEaNrI9Bsh4B\nF84dp5Kx1ovlQD8CJWb4eH/sVHAE5WQJGu5M5r8r2gTnak58bxlCTbeTBcSI4fP0\nyvtRsrp4Z3CS3ulqa1RY81wvNZMkRha34Ddi+J8L0jdZOeGuHVsAfdOU9opulISu\nKyhGLoFJiei9d7QlpG8wwfy6C1LXvWcRNQorRi/8BGRg7+wEZ54lCMcLRrykhUqp\nhhBPP16yN0MdRdeKBuvbFvEUVLCfauJKsVq6SiX/uQKBgQDsK2p5b9JmQZZka338\naiWYfaI552aGt7Kmfy5W/9kSpKLbZltzCcJ5FPsNdY035JaT3nBKKdPm8GCAJMr+\nnFlhC1wJTTKNzyoUXMJ09uz1eBQx6ahGQnNHxlC/5t8BSmaEwK9b7+8skZHKXOcc\n1O8xWL6H0o1GBmkOiF+YZywIKQKBgQDoFAqifxLAXRVIMU9ReTMjD+JOMAZUmpTT\noTW3qElfPMK8jtW/i9Vjds5xjZ9hSR+OHiPQA7ENvFoKgNg9boAD2NBUf40DTYtA\npUwskyTDL4W9hxfkBU7qxYeXQpDQnG7ZAF7CBS7rztLhEhrZUuY2na9VFEj/JAFb\njAWyLZunOQKBgQDUuI5g7z2d6TmjHccO0jUm0xKKAUmx0khR+4Ar0KsfRbeC0wFP\n7tyB30n554XZcEXIzrRpuJ8rBhyFj55gE0fWRzsRDb2ZSZ3nVV25qKfqucvG4WU2\nU6guYAxfrX30VaVdsYjB0K2ngT7F/UQWDh2cXwjOofGpvyBlfKROS6+3cQKBgGMq\nzTCKZBTWsZVbnK0PwQ4mZ2lJlCrqstWLeUy1GEUdzYiM8EEdG12ZErXq8kO730P3\nFQ55xVo9NaxvSfdWFFWQe9Tfe/4BUJObDmWtqnPNBrTp2QeSTRp8tWepBgBeF++Z\n/OOjG12fzvRlrBtZFQ4ZayZLuLVtSTc5KeXtHynhAoGBAOnMcZC85h9Frv5L3AOe\nwOSFvoI1gUg+rtwiWclzpc8OEu22KTzmCgKbRCChqhkM+E+zZP7RMcZOMbgPO2tT\n2gEw8JHFP9aHpPJPiRZhN/CfyDO1dGp0kluBwy9dLbnh+hh4Z+YtMEczKPvXjlAH\nAotSes4otOW9dEEOyExFPcib\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-4rvuk@fanni-elmohtarf.iam.gserviceaccount.com",
      "client_id": "111343033293303541191",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-4rvuk%40fanni-elmohtarf.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com",
    };
    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];
    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );
    auth.AccessCredentials credentials = await auth
        .obtainAccessCredentialsViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
          scopes,
          client,
        );
    client.close();
    debugPrint(credentials.accessToken.data);
    return credentials.accessToken.data;
  }
}
