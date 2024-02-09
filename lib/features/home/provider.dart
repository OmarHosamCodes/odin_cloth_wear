// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

/// Launches a URL in a new tab.
void launchURL(String url) {
  html.AnchorElement(href: url)
    ..target = '_blank'
    ..click();
}
