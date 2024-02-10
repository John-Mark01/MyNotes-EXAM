# MyNotes App
## This is the app that got me an "A" in my iOS Development class. - https://softuni.bg/certificates/details/202630/34d56238
### It is a simple app that lets a user input a multiline text field and then save it as a note

## What I used to build this app: 
### MVC Design Pattern / AlertManager / CoreMotion / UserDefaults / OOP / Protocol-Delegate Pattern / UI Elements(buttons, labels, etc.)
Then the user can choose to save his note. The note is being saved through the UserDefaults class. After it has been saved, the user can view his last saved note within the TextView, using the button "View Note". The app has a couple of hidden features that were a part of the requirements of my university, such as:
- When there is no saved note or nothing in the TextView, then the "Save Note" button is inactive. Also, the "View Note" button is inactive, until a note is saved.
- When the user clicks on "Save Note", the note is being saved, and the "Save Note" button is being disabled. Only when the user taps "View Note", and makes a change to his note, then the "Save Note" button enables itself.
- In addition to the UI there are Accelerometer updates. This enables the user to lean his phone downwards. When done, his text will be deleted. This feature is there if the user wants to start over his note.
- Within the Core Motion accelerometer updates. there is also an Alert that prompts when the user's device is being tilted. It alerts the user that his text will be deleted. Then the user has a choice whether to delete the text or cancel.

<img width="309" alt="image" src="https://github.com/John-Mark01/MyNotes-EXAM/assets/147177515/d954f89d-ea54-4743-9a3f-2f2082ab4153">
