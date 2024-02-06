// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void launchURL(String url) {
  html.AnchorElement anchor = html.AnchorElement(href: url)..target = '_blank';
  anchor.click();
}
