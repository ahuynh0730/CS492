# Project 3: Call Me Maybe

## Introduction

Establish a productive comfort level with the Flutter SDK by mastering the basic ingredients found in every application. Build a straightforward three-tab application. Practice applying the concepts of widgets, layouts, images, fonts, and themes. Enhance your application with responsive design, basic navigation, state, and third-party packages.

### Learning Outcomes

Learning Outcomes
1. Explain the fundamental concepts behind the Flutter SDK and its ecosystem of tools and libraries. (Week 4 MLO 1)
2. Interpret the Flutter SDK documentation and developer resources to build software that meets requirements. (Week 5 MLO 1)
3. Construct mobile software interfaces consisting of a hierarchy of widgets, positioned in a layout with constraints. (Week 5 MLO 2)
4. Integrate assets, such as images and fonts, and apply themes for consistent visual design. (Week 5 MLO 4)
5. Employ elements of responsive design to create mobile applications that work on different screen sizes. (Week 6 MLO 1)
6. Respond to user interaction gestures and use pre-built widgets to manage tab-based navigation. (Week 6 MLO 2)
7. Identify the model layer of an application, implement appropriate classes, and create stateful widgets. (Week 6 MLO 3)
8. Integrate library packages as application dependencies and use a third-party API to access system services via URLs. (Week 6 MLO 4)

## What you must do

The program should be a three-tab application and should be visually styled beyond the intentionally minimum "look and feel" shown above. The program should be responsive to different device orientations, invoke platform services, and support some stateful interaction. The application should:

    1. Display three tabs, consisting of icons, at the top area of the screen.
    2. Tapping any tab should display one of three things: a Business Card, a Resume or a Predictor.
      1. The Business Card should display a photo, name, title, phone number, web site url (eg GitHub profile), and email address.
        1. The structure of the layout should be similar to what is shown in the example above.
        2. The information here can be made up, to honor your privacy.
        3. When tapping the phone number, the device's text messaging app should appear.
        4. When tapping the web site url, a web browser should appear and display that web page.
        5. You should use text sizes, styles, fonts, and colors on this screen. For example, a colored non-white background with white fancy text.
        6. Use your photo, or a any avatar photo, instead of the Placeholder shown in the example above.
      2. The Resume should display your name, contact details and other basic resume components. Most importantly, it should display a long list of prior work experience.
        1. Anti-requirement: do not use a ListView widget. 
        2. Your contact details and work experience can be made up, to honor your privacy.
        3. You should use text sizes and styles that are larger/different than the simple example above.
        4. Each "prior position" should consist of job title, company, dates of employment, location, and a brief description.
          1. The visual layout of each "prior position" should be similar to what is shown in the example above.
        5. Ensure that you have enough of these "prior positions" to occupy more than what can fit on the screen.
        6. You should be able to scroll the screen up and down to see more content.
      3. The Predictor should exhibit behavior similar to a "magic eight ball (Links to an external site.)" and playfully predict whether or not you will get called back after an interview.
        1. Anti-requirement: do not use a button widget.
        2. The Predictor screen should display a fun prompt, and a Text widget asking the user to tap for an answer.
          1. The Text widget should be "tappable" and cause the screen to display a new random answer.
        3. There should be eight possible answers, which are entirely up to you.
    3. The application should support all orientations except upside-down.
      1. The layout should be responsive enough to look good and be usable in any orientation.
      2. The content should not be hidden by notches or curved corners of the device screen.
      3. The Business Card and Predictor screens should not cause overflow or require scrolling, in any orientation.
      4. When oriented horizontally, the Resume content should expand horizontally, and still allow for vertical scrolling.
