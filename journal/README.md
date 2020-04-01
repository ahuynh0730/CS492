# Project 4 - Journal

## Introduction

Demonstrate proficiency of prior material, and challenge yourself to demonstrate how to apply new concepts to meet functional requirements. Build a journaling application. Practice applying the concepts of navigation, forms, lists and data persistence. Enhance your application with adaptivity, dynamic theme switching, third-party packages for persistence, and encounter challenges of state management.

### Learning Outcomes

1. Demonstrate adaptive design principles by constructing an adaptive user interface with a mobile development SDK and the "master-detail" convention. (Week 7 MLO 1)
2. Implement navigation between different screens in an application. (Week 7 MLO 2)
3. Implement forms to capture, validate, and save user input. (Week 7 MLO 3)
4. Integrate ListView components to display data, navigate to a detail views, and to display updates to the underlying data. (Week 7 MLO 4)
5. Apply fundamental techniques of state management, such as "lifting up" and "passing down" state without the use of third-party state management libraries. (Week 8 MLO 1)
6. Apply basic asynchronous method calls to adhere to API requirements and employ non-blocking I/O. (Week 8 MLO 2)
7. Employ the loading, modification and saving of application configuration to manage user preferences. (Week 8 MLO 3)
8. Employ the loading of text file assets deployed with the application. (Week 8 MLO 4)
9. Demonstrate persistence with an on-device relational database. (Week 8 MLO 5)

## What you must do

Implement a program that models a journal, enabling users to create journal entries, which have a title, body, date and rating. You could use this to log good and bad days, favorite coffee shops, beverages, anime episodes, pair-programming dates - you get the idea. Here is a demonstration of a generic version of such a journal app:

The program should enable a user to view existing journal entries in a list, view a single journal entry, and add a new journal entry. In addition, the program should enable a user to change the application theme from light to dark. The theme preferences and journal data should persist between application restarts. Lastly, the application should be adaptive, based on the amount of horizontal space available on the screen. The functional requirements are:

    1. Display a "welcome" widget when the application starts and there are no journal entries.
    2. Provide the user, via a button in the right of the AppBar, with a toggle-able configuration option, presented in a Drawer, to change the theme from light to dark.
      1. Changing the configuration should immediately change the visual theme of the app.
      2. The configuration preference should persist between application restarts, and be honored when the user starts the application.
        1. When no prior saved preference exists, use the light theme.
        2. When the application starts, load the saved theme configuration, and immediately use it when creating the MaterialApp.
    3. Model a journal consisting of journal entries. A JournalEntry object has an id (an integer), title (a string), body (a string), rating (an integer), and date (a DateTime).
    4. Display a list of existing journal entries, by displaying the title and date of the journal entry.
    5. Display the details of the journal entry, including its title, body, date and numeric rating, when tapped on in the list.
    6. Enable the user to go "back" to the list when viewing the details of a journal entry full-screen.
    7. Adapt the interface to display the list of journal entries on the left, and the details of the entry on the right (in a "master-detail" layout convention) when the device has at least 800* pixels of horizontal space. (* If your simulator/device screen isn't large enough, just pick a width that makes sense, eg 500 or 700.)
    8. Display a FloatingActionButton that, when tapped, displays a form for entering attributes of a new journal entry.
    9. Validate the values in the form, ensuring that the title and body are not blank, and that the rating is an integer between 1 and 4.
    10. Create a new journal entry when the form's "Save" button is tapped, and return to the previous screen
    11. Ensure that new journal entries appear in the list after the form's "Save" button is tapped.
    12. Ensure that previously-created journal entries appear in the list when the application first starts.
    
In addition to the functional requirements above, your application should meet the following technical requirements:

1. Do not use a state management library, such as provider or scoped_model. Rely on manual state management and/or APIs in the Flutter SDK.
2. Use the "shared preferences" concept of mobile applications to load and save the theme configuration option, so that the chosen option persists between application restarts.
3. Use a sqlite database file to store, retrieve and update the journal entries, so that the data persists between application restarts. Do not "pre-create" the database file - have your app code do it on the device. Name the database file journal.sqlite3.db.Use the following queries or create your own:

    1. SELECT * FROM journal_entries;
    2. INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?);
      
4. Do not hard-code the database schema as a String in your code. Use the "assets" or "file i/o" concept of mobile applications to load the text of the initial SQL statement that creates the schema of the sqlite database.
