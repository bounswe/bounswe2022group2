# Group 2 - Milestone 3 - Final Deliverables

## 1. [Group Milestone Report](#group-milestone-report)

* 1.1 [Executive Summary](#executive-summary)

  * 1.1.1 [Summary of the Project Status](#summary-of-the-project-status)
  * 1.1.2 [The Status of the Deliverables](#the-status-of-the-deliverables)
  * 1.1.3 [Final Release Notes](#final-release-notes)
  * 1.1.4 [Changes the Team Has Made or Planned Since Milestone 2 to Improve Development Process, and How Those Changes Have Impacted the Process](#changes-the-team-has-made-or-planned-since-milestone-2-to-improve-development-process-and-how-those-changes-have-impacted-the-process)
  * 1.1.5 [Reflections Related to the Final Milestone Demo Including Lessons Learned](#reflections-related-to-the-final-milestone-demo-including-lessons-learned)
  * 1.1.6 [What Could Be Done Differently in the Start of the Project to Finalize the Project](#what-could-be-done-differently-in-the-start-of-the-project-to-finalize-the-project)

* 1.2 [Progress Based on Teamwork](#progress-based-on-teamwork)

  * 1.2.1 [Summary of Work Performed by Each Team Member](#summary-of-work-performed-by-each-team-member)
  * 1.2.2 [Status of the Requirements](#status-of-the-requirements)
  * 1.2.3 [API Endpoints](#api-endpoints)
  * 1.2.4 [User Interface/User Experience](#user-interfaceuser-experience)
  * 1.2.5 [Annotations](#annotations)
  * 1.2.6 [Standards](#standards)
  * 1.2.7 [Scenarios](#scenarios)

## 2. [Project Artifacts](#project-artifacts)

* 2.1.1 [Manuals](#manuals)
  * 2.1.1.1 [User Manual](#user-manual)
  * 2.1.1.2 [System Manual](#system-manual)
* 2.1.2 [Software Requirements Specification (SRS)](#software-requirements-specification-srs)
* 2.1.3 [Software Design Documents (UML)](#software-design-documents-uml)
* 2.1.4 [User Scenarios and Mockups](#user-scenarios-and-mockups)
* 2.1.5 [Project Plan](#project-plan)
* 2.1.6 [Unit Tests](#unit-tests)

## 3. [Software Package](#software-package)

## 4. [Individual Milestone Reports](#individual-milestone-reports)

---------

# Group Milestone Report

***

## Executive Summary

***

### Summary of the Project Status

Learnify is an online platform that enables collaborative learning. We finished almost all portions of our project and deployed the web application, which can be accessed through a [public IP address](http://3.76.176.35/). The mobile application also can be installed using an apk file can be found [here](https://github.com/bounswe/bounswe2022group2/wiki/Learnify-Mobile-APK) or alternatively you can create an APK with the last version by following the guideline [here](https://github.com/bounswe/bounswe2022group2/wiki/System-Manual). At the end of the term, we are happy with the position we are as the whole team. We have accomplished almost everything we wanted to do. We implemented the features we set as our aims and you mentioned as important since the beginning of the semester.

The most important features we have in our app for both mobile and web are the followings:

  1. Image annotation
  2. Text annotation
  3. Semantic Search
  4. GeoLocation, event creation, attending an event

These are also the features you have mentioned in our project description, in the lectures again and again. We are happy to write here that we have finished all of them successfully with full integration in the all teams (mobile, web, back-end).

We believe that our application is ready to be used by real-users as an initial version. We have lots of functionalities in our app with nice UI/UX experiences. Apart from the functionalities, we also gave important to the usability and UX of the app. We also added multi-theme, multi-language support to our mobile app just because of this reason. We really did a great job!

In short, we achieved all of our aims and accomplished all the responsibilities you gave successfully as the whole team. We also did great presentations in all demos including the final demo. Here are the general view of full functionalities we support in our app:

1. Signup
2. Login
3. Email verification
4. Forgot password
5. Create/View/Edit profile screen
6. View other users' profiles
7. Create and view a learning space
8. Contribute to all learning spaces
9. Annotate texts
10. Annotate images
11. Semantic search for learning spaces
12. User search
13. Create events
14. Attend events
15. GeoLocation integration for location selection on map
16. Comment on post contents
17. View other users' text annotations
18. View other users' image annotations
19. Create/Edit/View posts under learning spaces
20. View all comments for posts
21. View participants of learning spaces
22. Enroll learning spaces
23. View enrolled, top-rated learning spaces
24. View recommended learning spaces
25. Multi-language feature with following language supports for mobile app:

* İngilizce
* Türkçe
* Almanca
* Fransızca
* İspanyolca
* Korece
* Japonca

26. Dark/Light theme support for mobile app

***

### The Status of the Deliverables

***

### Final Release Notes

***

### Changes the Team Has Made or Planned Since Milestone 2 to Improve Development Process, and How Those Changes Have Impacted the Process

Our management process and system were effective, so we didn't need to plan and make so many changes. We continued to regularly review our progress and sought ways to optimize our development process.However, we planned something regarding to the features of the app. Here is the list of the actions which we normally planned to take until the final milestone:

1. Create a separate database and microservice for annotation feature
2. Embed the exact W3C annotation model (we have already satisfy critical fields and information for this model and we are integrated with it) into the create annotation request on both mobile & web & backend for the new microservice
3. Connect the back-end for both text and image annotation feature on web
4. Create and integrate back-end for user search
5. Public profiles and displaying other users’ profiles
6. Following other people and displaying follower/following information
7. Improve the learning space recommendation system
8. Achievements for learning spaces
9. Upvote, edit and delete functionalities for annotations
10. Rating the learning spaces
11. Create and integrate back-end of the events part (currently it’s static)
12. Create and integrate back-end of the forum part (currently it’s static)
13. Improve the profile page and create the back-end connection

We can say that we successfully did the changes for items 1, 2, 3, 4, 5, 7, 11, 13. As you noticed, all of these are related to development, not management. Because, we already have issue templates (3 different templates), pull request template, github actions and well-followed meeting schedule/notes. Therefore, we didn't need so many changes related to the management, team communication, and so on.

For the general changes we did (not only after the 2nd milestone), you can refer to previous milestone reports. They include changes related to pull request template, GitHub actions, general meeting schedule, planning, feature prioritization and so on. We didn't include them here to avoid repeating ourselves. We have a great system after the second milestone and therefore we didn't need to change so much thing.

***

### Reflections Related to the Final Milestone Demo Including Lessons Learned

Our final milestone demo went very well overall and was very well received by the audience. As in the previous milestones, we received nice comments from people regarding to our app and demo. The only major problem we encountered was the semantic search problem. Our semantic search algorithm was working in a so "semantic" way that requires more than a strict threshold for relating keywords. In our demo, we had a problem with this. We nicely presented semantic search with the keywords we previously tried. However, when someone in the audience tried to do search, their keywords used to search didn't produce meaningful results that normally it should produce.

The lesson we learned from this issue is the fact that we need to test our features among the team as whole instead of some specific people who implemented that feature. If our app is used by the whole team members before the demo day, most probably we would not encounter a problem like this. Additionally, we need to consider and estimate the behavior of the audience and customer and take actions regarding to it. Even if a feature is not working as expected, we need to be able to justify it with valid reasons and explain the reasons to the audience in a language s/he can understand.

Other than this semantic search problem, we believe that we did again a really great job! Just as in the previous milestone demos. We are happy with the final milestone demo and we believe that the audience was also happy and excited with the presentation we did.

***

### What Could Be Done Differently in the Start of the Project to Finalize the Project

As we said in the previous sections, we are generally satisfied with the progress and the work done by the team. However, as in the all teams and projects, we also have some points we hope to make better at the beginning. Here are the most important ones:

* We believe that in general we constructed the sub-groups well. However, due to the limitation on the number of people in the team (11 people), our back-end team was consisting of 3 people. However, in general most of the work was done by 2 people. This situation caused the back-end to progress slowly, so we felt like we couldn't develop some features that we needed to improve in the middle of the semester. However, thanks to the all team member's effort, we handled this issue well, work hard and fulfill our responsibilities. As an optimization, we may construct the teams in a different way that allocates more people for the back-end development.
* Second thing we can do differently was the time we allocate for the new features. We generally did most of our work regarding to the implementation/coding in the last week before any demo. The reason for this problem is the intense lecture schedule everyone has. However, if we had implemented the features by spreading the tasks over the whole time, there would have been fewer bugs and there would be a less headache-inducing development process.

***

## Progress Based on Teamwork

***

### Summary of Work Performed by Each Team Member

***

* **Altay Acar**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||

* **Egemen Atik**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
* **Ezgi Aysel Batı**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||

* **Batuhan Çelik**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
* **Hasan Can Erol**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
* **Onur Kömürcü:**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
* **Ecenur Sezer**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||

* **Muhammed Enes Sürmeli:**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
* **Koray Tekin**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
* **Bahrican Yeşil:**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
* **Mehmet Gökay Yıldız**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
***

### Status of the Requirements

***

### API Endpoints

***

### User Interface/User Experience

***

### Annotations

***

### Standards

***

### Scenarios

---------

# Project Artifacts

***

## Manuals

***

### User Manual

***

### System Manual

***

## Software Requirements Specification (SRS)

***

## Software Design Documents (UML)

***

## User Scenarios and Mockups

***

## Project Plan

***

## Unit Tests

---------

# Software Package

---------

# Individual Milestone Reports

--------------------------  

## *Member:*  

Name: Altay Acar

Group: Group2 - Frontend Team

## *Responsibilities:*

## *Main Contributions:*

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

## *Pull Requests:*

## *Unit Tests:*

## *Additional Information:*  

---------------

## *Member:*  

Name: Egemen Atik

Group: Group2 - Android/Mobile Team

## *Responsibilities:*

## *Main Contributions:*

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

## *Pull Requests:*

## *Unit Tests:*

## *Additional Information:*

---------------

## *Member:*  

Name: Ezgi Aysel Batı

Group: Group2 - Android/Mobile Team

## *Responsibilities:*

## *Main Contributions:*

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

## *Pull Requests:*

## *Unit Tests:*

## *Additional Information:*  

---------------

## *Member:*  

Name: Mehmet Batuhan Çelik

Group: Group2 - Backend Team

## *Responsibilities:*

## *Main Contributions:*

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

## *Pull Requests:*

## *Unit Tests:*

## *Additional Information:*  

---------------

## *Member:*  

Name: Hasan Can Erol

Group: Group2 - Backend Team

## *Responsibilities:*

## *Main Contributions:*

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

## *Pull Requests:*

## *Unit Tests:*

## *Additional Information:*  

---------------

## *Member:*  

Name: Onur Kömürcü

Group: Group2 - Android/Mobile Team

## *Responsibilities:*

## *Main Contributions:*

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

## *Pull Requests:*

## *Unit Tests:*

## *Additional Information:*  

---------------

## *Member:*  

Name: Ecenur Sezer

Group: Group2 - Backend Team

## *Responsibilities:*

## *Main Contributions:*

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

## *Pull Requests:*

## *Unit Tests:*

## *Additional Information:*  

--------------------

## *Member:*  

Name: Muhammed Enes Sürmeli

Group: Group2 - Frontend Team

## *Responsibilities:*

## *Main Contributions:*

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

## *Pull Requests:*

## *Unit Tests:*

## *Additional Information:*  

--------------------

## *Member:*  

Name: Koray Tekin

Group: Group2 - Frontend Team

## *Responsibilities:*

## *Main Contributions:*

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

## *Pull Requests:*

## *Unit Tests:*

## *Additional Information:*  

--------------------

## *Member:*  

Name: Bahrican Yeşil

Group: Group2 - Android/Mobile Team

## *Responsibilities:*

**Final Milestone-3**

  1. Finding a free, satisfactory solution/package to display event locations on a map
  2. Integrating and implementing Open Street Map into the events
  3. Writing tests for event list and event preview item
  4. Writing tests for event details
  5. Implementing GeoLocation and Event classes according to W3C standards
  6. Determining the logic for displaying and selecting a point on a map (event locations)
  7. Implementing settings screen
  8. Writing app information details under the settings
  9. Adding multi-language support and setting to mobile app
  10. Adding multi-theme support and setting to mobile app
  11. Fixing annotation model to exactly comply with the W3C standards (after back-end did changes), also update places using annotation model accordingly
  12. Writing tests for settings screen
  13. Back-end connection of get events endpoint  
  14. Conducting research on Flutter packages, finding and integrating helpful and nice ones (like flutter map as I mentioned)
  15. Reviewing the works done by the mobile team on a regular basis
  16. Solving bugs, errors, problems encountered during the implementation of the mobile of our application regularly
  17. Helping to teammates, answering their questions, solving critical bugs&errors before the demo day
  18. Attending and participating general meetings regularly
  19. Attending and participating mobile team meetings regularly

--------------------

**Milestone-2**

  1. Creating a pull request template to better organize pull requests among the whole team
  2. Creating GitHub actions for Flutter & Android project, CI for Android project
  3. Implementation of posts section under the learning space detail screen (with post model, post items and post list)
  4. Writing tests of the chapter section of the learning space detail screen
  5. Doing a detailed research on text annotations with Flutter and determining how to implement text annotations on mobile
  6. Implementing annotatable text widget as a generic widget to use across the app and integrating it into posts section under the learning space detail screen
  7. Doing a detailed research on how to display text annotations, and determining the way to follow (highlighted random light background color)
  8. Doing a detailed research on how to solve the annotation overlapping problem for texts on mobile
  9. Implementing annotated/highlighted and clickable text widget as a generic widget to use across the app
  10. Implementing overlapped annotation support by mixing the colors and designing an algorithm to separate annotation parts
  11. Implementing a generic single choose dialog for use across the app
  12. Implementing multiple annotation selection dialog
  13. Implementing native splash screen (for opening phase of the app)
  14. Doing a detailed research on image annotations with Flutter and determining how to implement image annotations, discussion with Alper hoca and Suzan hoca regarding to the image annotations on mobile
  15. Implementing annotatable image widget as a generic widget to use across the app and integrating it into posts section under the learning space detail screen
  16. Doing a detailed research on how to display image annotations, and determining the way to follow, finding a solution for overlapped image annotations
  17. Implementing annotated image display functionality with paint info, integration of its logic into annotatable image widget
  18. Integration of the random user API to use while showing static content across the app
  19. Implementing events section of the learning space detail screen as static
  20. Back-end connection of the creating text annotation
  21. Back-end connection of the creating image annotation
  22. Writing tests for the text annotation feature
  23. Writing tests for the image annotation feature
  24. Implementing cropped image annotation preview for annotations screen
  25. Implementation of basic structure of the learning space detail screen on mobile with base sliver view and tab bar view
  26. Implementation of generic expandable item and list on mobile to use across the app (used in so many places)
  27. Implementing page transition animations for screen changes with navigation
  28. Documenting 2 mobile team meeting notes out of 5 notes
  29. Conducting research on Flutter packages, finding and integrating helpful and nice ones (like page transition as I mentioned)
  30. Reviewing the works done by the mobile team on a regular basis
  31. Solving bugs, errors, problems encountered during the implementation of the mobile of our application regularly
  32. Helping to teammates, answering their questions, solving critical bugs&errors before the demo day
  33. Attending and participating general meetings regularly
  34. Attending and participating mobile team meetings regularly

--------------------

**Milestone-1**

  1. Building the main structure of the Flutter project
  2. Implementing core managers: network, navigation, and local storage managers
  3. Adding multi-theme and multi-language structure base.
  4. Implementing sign up screen, making its back-end connection
  5. Writing tests of the sign up screen
  6. Implementing static profile screen
  7. Writing tests of the profile screen
  8. Make the app icon as our logo and configure the app name
  9. Implementing bottom navigation and app bars
  10. Reviewing all works done by the mobile teammates
  11. Determination of the endpoints, request and response bodies
  12. Implement app icon and app name to the required config files

## *Main Contributions:*

**Final Milestone-3**

--------------------

**Milestone-2**
I am a member of the mobile team for the development of our application which is Learnify. Therefore, most contributions were on the mobile side. However, I also did significant contributions to the general organization of our repository and the process of the team. I've created a project for our repository under the organization. I have created a pull request template to well-organize the PRs with explanatory descriptions, content details, and issue-closing information (just as I created issue templates in the previous term for CMPE352). I have also created GitHub actions for our Android/Mobile project since this is so important for continuous integration. I have mainly managed our mobile team meetings, I determined our situation and what we need to do before the mobile meetings. I helped to team with feature prioritization, scheduling, and sharing among the mobile team members.

Apart from these management contributions, I mainly took the whole responsibility for the text & image annotations on mobile with their all details. I have both implemented and solved the bugs realized in the development phase. I have also communicated with the back-end team and helped to build the annotation model&endpoints to be compatible with W3C standards. I implemented designs, functionalities, back-end connections, and tests, in short everything for text and image annotations on mobile. So, my main contribution to mobile is annotations.

Apart from the annotations, I implemented the posts section of the learning space detail screen which opened as the default tab view on the screen. I also implemented the event section as static by fetching user data from a 3rd party API temporarily until the back end is ready. I contributed with small but nice touches to the mobile app like page transition animations, a native splash screen, and so on. Other than these, I contributed to the mobile code base with lots of generic widgets used across the app on different screens.

--------------------

**Milestone-1**
I played active and important role while designing the API definition and project architecture while keeping needs of front and backend in mind. I reviewed all works done by the mobile team, build the communication between back-end and mobile teams. I actively reported the problems, missing points to them and had discussion on the processes. I explained the flow we should follow for email verification to all team members in our weekly meeting. I also expressed my suggestions on the request and response bodies.

I especially contributed to the mobile side with Flutter since I am a part of the mobile team. I have set up the base project, implemented the base managers (network, navigation, local), base widgets and logics which appear at almost every part of the app (like extensions, common widgets, helpers). I created the base structure to support multi-language and multi-theme features. I took the responsibility of the signup screen which was the first screen we developed on mobile. I developed various generic widgets while developing this screen like CustomFormField, ActionButton, and so on. I also created a base network manager to use across the app and built the back-end connection of the signup endpoint. I did a research on testing with Flutter and created the first tests of our app, wrote some examples and beneficial helpers. I also write both unit-widget tests and also the network request tests of the signup screen.

I also took the responsibility of the profile screen. Since the back-end connection and content of this screen is not ready yet, I implemented it as static (by using some dynamic data from login/signup screens). I managed the navigation from authentication screen to the home screen and movement/update of the data of authentication screens. I also wrote unit-widget tests for the profile screen. Additionally, I implemented the bottom and top app bars for the home screen. Finally, I configured the required files for the app logo and name.

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

**Final Milestone-3**

--------------------

**Milestone-2**

--------------------

**Milestone-1**

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

**Final Milestone-3**

--------------------

**Milestone-2**

--------------------

**Milestone-1**

## *Pull Requests:*

**Final Milestone-3**

--------------------

**Milestone-2**

--------------------

**Milestone-1**

## *Unit Tests:*

**Final Milestone-3**

--------------------

**Milestone-2**

--------------------

**Milestone-1**

## *Additional Information:*  

**Final Milestone-3**

--------------------

**Milestone-2**

--------------------

**Milestone-1**

---------------------------

## *Member:*  

Name: Mehmet Gökay Yıldız

Group: Group2 - Frontend Team

## *Responsibilities:*

## *Main Contributions:*

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

## *Pull Requests:*

## *Unit Tests:*

## *Additional Information:*  
