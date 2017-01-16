# HipChat

```
This application is a demonstration of chatt applicat that takes a chat message string and returns a JSON string containing information about its contents. Special content to look for includes:

1. @mentions - A way to mention a user. Always starts with an '@' and ends when hitting a non-word character. (http://help.hipchat.com/knowledgebase/articles/64429-how-do-mentions-work-)
2. Emoticons - For this exercise, you only need to consider 'custom' emoticons which are ASCII strings, no longer than 15 characters, contained in parenthesis. You can assume that anything matching this format is an emoticon. (http://hipchat-emoticons.nyh.name)
3. Links - Any URLs contained in the message, along with the page's title.
```
# iOS Solution

# Xcode Unit Testing (TDD)
Very basic demonstration of Xcode unit testing module.

Some test cases:
- using only mentions
- using only emoticons
- using only links
- using mentions, emoticons, and links

Dev specs:
- detect and parse mentions
- detect and parse emoticons
- detect and parse links
- detect and parse all of above

# Implementation Swift 3.0
- Core logic for detection and parsing using Factory Pattern (scalable design for any kind of parsing/detecion)
- Output string to JSON
- Complete functional UI
