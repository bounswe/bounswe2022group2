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

## *Main Contributions:*

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

## *Pull Requests:*

## *Unit Tests:*

## *Additional Information:*  

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
