import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class URLServices {
  static Future<void> goToMap(
      {required BuildContext context,
      required double lat,
      required double lng}) async {
    String url = '';
    String urlAppleMaps = '';

    try {
      if (Platform.isAndroid) {
        url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          throw 'Could not launch $url';
        }
      } else {
        urlAppleMaps = 'https://maps.apple.com/?q=$lat,$lng';
        url = 'comgooglemaps://?saddr=&daddr=$lat,$lng&directionsmode=driving';
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else if (await canLaunchUrl(Uri.parse(urlAppleMaps))) {
          await launchUrl(Uri.parse(urlAppleMaps));
        } else {
          throw 'Could not launch $url';
        }
      }
    } catch (e, stackTrace) {
      print('Error launching URL: $e');
      print('Stack Trace: $stackTrace');
    }
  }

  static Future<void> gotoURL({required String link}) async {
    final Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint('Cannot lauch URL');
    }
  }

  static Future<void> goToCall({required int numberPhone}) async {
    String path = '0 ${numberPhone.toString()}';

    final Uri urlCall = Uri(scheme: 'tel', path: path);

    if (await canLaunchUrl(urlCall)) {
      await launchUrl(urlCall);
    } else {
      debugPrint('Cannot make the call');
    }

    debugPrint('Number Phone: $numberPhone');
  }
}
