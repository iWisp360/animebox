import 'dart:math';

enum CopyState { copied, spam, idle }

class ErrorPageController {
  static const List<String> _quotes = [
    "Houston, we’ve had a problem.",
    "I'm sorry, Dave. I'm afraid I can't do that.",
    "Well, this is awkward.",
    "Computer says no.",
    "That wasn't supposed to happen.",
    "A wild error appeared!",
    "Everything is fine. Keep calm.",
    "The wheels have completely come off.",
    "We’ve entered uncharted territory.",
    "System status: Total containment breach.",
    "It's not you, it's our code.",
  ];

  static String randomErrorQuote() => _quotes[Random().nextInt(_quotes.length)];
}
