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
  |Milestone - 1| - | - |
  |Backend: Implementing Unit Tests for Login Endpoint|[Issue](https://github.com/bounswe/bounswe2022group2/issues/421)| 3 hrs |
  |Backend: Writing Tests for Verify Email Endpoint|[Issue](https://github.com/bounswe/bounswe2022group2/issues/418)| 2 hrs |
  |Backend: Implementation of Login API|[Issue](https://github.com/bounswe/bounswe2022group2/issues/380)| 3 hrs |
  |Backend: Email Verification API|[Issue](https://github.com/bounswe/bounswe2022group2/issues/364)| 4 hrs |
  |Research & Report for Backend Technologies (Backend Team)|[Issue](https://github.com/bounswe/bounswe2022group2/issues/321)|2 hrs|
  |Revising the Requirements : User - User Interaction|[Issue](https://github.com/bounswe/bounswe2022group2/issues/334)|2.5 hrs|
  |Revising the Requirements : Glossary|[Issue](https://github.com/bounswe/bounswe2022group2/issues/335)|1 hrs|
  |Prepaing the Slide for our First Demo|[Issue](https://github.com/bounswe/bounswe2022group2/issues/460)|1 hrs|
  |Milestone - 2| - | - |
  |Backend: POST Learning Space Enroll Endpoint| [#561](https://github.com/bounswe/bounswe2022group2/issues/561) | 3 hrs |
  |Backend: Implementing Unit Tests for Enrolling Learning Space|[#563](https://github.com/bounswe/bounswe2022group2/issues/563)| 2 hrs |
  |Backend: Create Annotation Endpoint|[#577](https://github.com/bounswe/bounswe2022group2/issues/577)|5 hrs|
  |Backend: Create Post Endpoint|[#589](https://github.com/bounswe/bounswe2022group2/issues/589)|3 hrs|
  |Backend: Edit Post Endpoint|[#600](https://github.com/bounswe/bounswe2022group2/issues/600)|2 hrs|
  |Backend: Edit Annotation Endpoint|[#602](https://github.com/bounswe/bounswe2022group2/issues/602)| 4 hrs |
  |Backend: Unit Tests for Create Post Endpoint|[#663](https://github.com/bounswe/bounswe2022group2/issues/663)|2 hrs|
  |Backend: Unit Tests for Edit Post Endpoint|[#665](https://github.com/bounswe/bounswe2022group2/issues/665)|2 hrs|
  |Milestone-2 Report: Annotations|[#675](https://github.com/bounswe/bounswe2022group2/issues/675)|2 hrs|
  |Milestone-2 Report: API Documentation|[#677](https://github.com/bounswe/bounswe2022group2/issues/677)|2.5 hrs|
  |Milestone-2 Report: Individual Report|[#691](https://github.com/bounswe/bounswe2022group2/issues/691)|1 hrs|
  |Final Milestone| - | - |
  |Backend: Create Annotations Service and POST Create Annotations Endpoint for Annotation Service| [#781](https://github.com/bounswe/bounswe2022group2/issues/781) |4 hrs |
  |Backend: GET Annotations by Learning Space and Post ID for Annotations Service|[#782](https://github.com/bounswe/bounswe2022group2/issues/782)| 3 hrs |
  |Backend: Create Annotations for Learnify App|[#786](https://github.com/bounswe/bounswe2022group2/issues/786)|4 hrs|
  |Backend: Get Annotations by Learning Space and Post ID for Learnify|[#810](https://github.com/bounswe/bounswe2022group2/issues/810)|3.5 hrs|
  |Backend: Documenting Endpoints that are related to Annotation-Service|[#812](https://github.com/bounswe/bounswe2022group2/issues/812)|2 hrs|
  |Backend: Give full functionality to Annotations Service|[#823](https://github.com/bounswe/bounswe2022group2/issues/823)| 4 hrs |
  |Backend: Upvote/Downvote Posts API|[#830](https://github.com/bounswe/bounswe2022group2/issues/830)|2.5 hrs|
  |Backend: User Search API|[#845](https://github.com/bounswe/bounswe2022group2/issues/845)|1 hrs|
  |Backend: Implement and Fix Unit Tests |[#865](https://github.com/bounswe/bounswe2022group2/issues/865)|5 hrs|
  |Final Milestone: Annotations & Standards|[#952](https://github.com/bounswe/bounswe2022group2/issues/952)|3.5 hrs|
  |Final Milestone: Individual Report|[#960](https://github.com/bounswe/bounswe2022group2/issues/960)|4 hrs|
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |Milestone - 1| - | - |
  |Backend: Implementing Unit Tests for Login endpoint |[#422](https://github.com/bounswe/bounswe2022group2/pull/422)| 2 hrs|
  |Backend: Implementing Tests for Verify Email Endpoint|[#420](https://github.com/bounswe/bounswe2022group2/pull/420)| 2 hrs|
  |380 implementation of login api|[#380](https://github.com/bounswe/bounswe2022group2/pull/380)| 3 hrs | 
  |Verify email endpoint|[#374](https://github.com/bounswe/bounswe2022group2/pull/374)| 3 hrs |
  | Milestone - 2| - |
  |561 backend post learning space join endpoint| [#562](https://github.com/bounswe/bounswe2022group2/pull/562)|3 hrs|
  |563 backend implementing unit tests for enrolling learning space|[#564](https://github.com/bounswe/bounswe2022group2/pull/564)| 2 hrs |
  |Backend: Create Annotation Endpoint|[#588](https://github.com/bounswe/bounswe2022group2/pull/588)| 5 hrs|
  |Backend: Create post endpoint implemented|[#590](https://github.com/bounswe/bounswe2022group2/pull/590)|3 hrs|
  |Backend: Annotation Endpoint Creator and LS IDs|[#597](https://github.com/bounswe/bounswe2022group2/pull/597)|2 hrs|
  |Backend: Edit Post Endpoint|[#601](https://github.com/bounswe/bounswe2022group2/pull/601)| 4 hrs |
  |Backend: Edit Annotations Endpoint|[#603](https://github.com/bounswe/bounswe2022group2/pull/603)|2 hrs|
  |Backend: Create Post endpoint Unit Test|[#664](https://github.com/bounswe/bounswe2022group2/pull/664)|2 hrs|
  |Backend: Unit Tests for Edit Post Endpoint|[#666](https://github.com/bounswe/bounswe2022group2/pull/666)|2 hrs|
  |Milestone-2 Report: Annotations|[#674](https://github.com/bounswe/bounswe2022group2/pull/674)|2 hrs|
  |Milestone-2 Report: API Documentation|[#685](https://github.com/bounswe/bounswe2022group2/pull/685)| 2.5 hrs|
  |Final Milestone| - | - |
  |Backend: POST Create Annotations for Annotation Service| [#785](https://github.com/bounswe/bounswe2022group2/pull/785)|3 hrs|
  |Backend: Create Annotation Endpoint for Learnify |[#803](https://github.com/bounswe/bounswe2022group2/pull/803)| 2 hrs |
  |Backend FIX: Annotation ID will hold LS and Post ID|[#804](https://github.com/bounswe/bounswe2022group2/pull/804)| 1 hrs|
  |Backend: Get Annotations by Id for Annotations Service|[#809](https://github.com/bounswe/bounswe2022group2/pull/809)|3 hrs|
  |Backend: Get Annotations by Learning Space and Post ID for Learnify Server|[#811](https://github.com/bounswe/bounswe2022group2/pull/811)|4 hrs|
  |BUGFIX: Duplicate Annotation IDs on Annotation Service POST Create Endpoint |[#818](https://github.com/bounswe/bounswe2022group2/pull/818)| 2 hrs |
  |Backend: Upvote/Downvote Post API|[#831](https://github.com/bounswe/bounswe2022group2/pull/831)|2 hrs|
  |Backend: User Search API |[#846](https://github.com/bounswe/bounswe2022group2/pull/846)|2 hrs|
  |Backend: Implementing and Bug Fixing Unit Tests|[#864](https://github.com/bounswe/bounswe2022group2/pull/864)|2 hrs|
  |Final Milestone: Update Annotations and Standards Section|[#954](https://github.com/bounswe/bounswe2022group2/pull/954)|2 hrs|
  |BUGFIX: Annotation Service Elastic IP taken and changed with old IP|[#965](https://github.com/bounswe/bounswe2022group2/pull/965)| 2.5 hrs|

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
  |**Final Milestone 3**|-|-|
  |Mobile: Integration of Open Street Map to the Events|[#750](https://github.com/bounswe/bounswe2022group2/issues/750)|2h 15m|
  |Mobile: Research on Map Packages in Flutter|[#751](https://github.com/bounswe/bounswe2022group2/issues/751)|2h 45m|
  |Mobile: Event List and Preview Test|[#753](https://github.com/bounswe/bounswe2022group2/issues/753)|1h 45m|
  |Mobile: Tests for Event Details|[#756](https://github.com/bounswe/bounswe2022group2/issues/756)|1h 30m|
  |Mobile: Implementing Settings Screen|[#758](https://github.com/bounswe/bounswe2022group2/issues/758)|3h 30m|
  |Mobile: Multi-language Support and Settings|[#761](https://github.com/bounswe/bounswe2022group2/issues/761)|2h 30m|
  |Mobile: Multi-Theme Support and Settings|[#763](https://github.com/bounswe/bounswe2022group2/issues/763)|1h 30m|
  |Mobile: Fix Annotation Model|[#765](https://github.com/bounswe/bounswe2022group2/issues/765)|3h 30m|
  |Mobile: Tests for Settings Screen|[#768](https://github.com/bounswe/bounswe2022group2/issues/768)|1h 30m|
  |Mobile: Back-end Connection of Get Events|[#773](https://github.com/bounswe/bounswe2022group2/issues/773)|3h|
  |Mobile: Back-end Connection of Get Annotations|[#813](https://github.com/bounswe/bounswe2022group2/issues/813)|2h 30m|
  |Final Milestone: Filling Executive Summary Section|[#936](https://github.com/bounswe/bounswe2022group2/issues/936)|2h 15m|
  |Final Milestone: Individual Contributions Report - Bahrican Yesil|[#938](https://github.com/bounswe/bounswe2022group2/issues/938)|3h|
  |Final Milestone: Summary of Work Table - Bahrican Yesil|[#939](https://github.com/bounswe/bounswe2022group2/issues/939)|1h 30m|
  |--------------|--------------|--------------|
  |**Milestone 2**|-|-|
  |Milestone 2: Individual Report - Bahrican Yesil|[#701](https://github.com/bounswe/bounswe2022group2/issues/701)|4h|
  |Mobile: Image Annotation Cropped Preview - Annotations Screen|[#614](https://github.com/bounswe/bounswe2022group2/issues/614)|2h 30m|
  |Mobile: Writing Tests of the Image Annotation Feature|[#608](https://github.com/bounswe/bounswe2022group2/issues/608)|1h 45m|
  |Mobile: Writing Tests of the Text Annotation Feature|[#606](https://github.com/bounswe/bounswe2022group2/issues/606)|1h 15m|
  |Mobile: Bug Fix for Chapter (Post) Tests|[#598](https://github.com/bounswe/bounswe2022group2/issues/598)|1h 15m|
  |Mobile: Back-end Connection of Creating Annotation|[#594](https://github.com/bounswe/bounswe2022group2/issues/594)|2h 30m|
  |Mobile: Implementation of the Events Section|[#583](https://github.com/bounswe/bounswe2022group2/issues/583)|6h|
  |Mobile: Implementation of the Annotated Image Logic|[#579](https://github.com/bounswe/bounswe2022group2/issues/579)|2h 30m|
  |Mobile: Implementation of the Image Annotation|[#578](https://github.com/bounswe/bounswe2022group2/issues/578)|5h 30m|
  |Mobile: Implementing Page Transition Animation|[#558](https://github.com/bounswe/bounswe2022group2/issues/558)|1h 15m|
  |Mobile: Create GitHub Actions for Flutter |[#554](https://github.com/bounswe/bounswe2022group2/issues/554)|1h 15m|
  |Mobile: Native Splash Screen|[#552](https://github.com/bounswe/bounswe2022group2/issues/552)|30m|
  |Mobile: Implementing Multiple Annotation Selection Dialog |[#546](https://github.com/bounswe/bounswe2022group2/issues/546)|3h 15m|
  |Mobile: Implementing Overlapped Annotation Support|[#545](https://github.com/bounswe/bounswe2022group2/issues/545)|4h 15m|
  |Mobile: Implementing Highlighted (Annotated) Text Widget|[#517](https://github.com/bounswe/bounswe2022group2/issues/517)|4h 15m|
  |Mobile: Implementing Annotatable Text Widget|[#505](https://github.com/bounswe/bounswe2022group2/issues/505)|5h 15m|
  |Documenting Meeting notes for Mobile Meeting #4|[#479](https://github.com/bounswe/bounswe2022group2/issues/479)|1h|
  |Mobile: Writing Tests of the Course Detail Chapter Section|[#478](https://github.com/bounswe/bounswe2022group2/issues/478)|1h 15m|
  |Mobile: Implementing Course Detail Chapter Section|[#477](https://github.com/bounswe/bounswe2022group2/issues/477)|5h 30m|
  |Creating a Pull Request Template|[#476](https://github.com/bounswe/bounswe2022group2/issues/476)|45m|
  |Milestone 2: Annotations Part of the Report - Mobile|[#719](https://github.com/bounswe/bounswe2022group2/issues/719)|1h 10m|
  |Milestone 2: Fill User Interface Part for Mobile|[#710](https://github.com/bounswe/bounswe2022group2/issues/710)|2h 30m|
  |--------------|--------------|--------------|
  |**Milestone 1**|-|-|
  |Implementation of MVVM Setup, Extensions and the Initial App Widget|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/350)|-|
  |Mobile: Implementing Sign Up Screen|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/358)|-|
  |Mobile: Writing Tests for Sign Up Screen|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/359)|-|
  |Mobile: Back-end Connection of Sign Up Endpoint|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/369)|-|
  |Mobile: Implementing Static Profile Screen|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/397)|-|
  |Mobile: Writing Tests of the Profile Screen|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/403)|-|
  |Mobile: Implementing the Navigation Manager|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/356)|-|
  |Mobile: Base Setup for Multi-Language and Multi-Theme Setup|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/357)|-|
  |Mobile: Bottom Navigation and App Bar Widgets|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/393)|-|
  |Mobile: Implement App Icon|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/401)|-|
  |Revising the Requirements: Authentication|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/331)|-|
  |Revising the Diagrams based on Signup&Login|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/337)|-|
  |Documenting Meeting Notes for the Meeting 3 of CMPE 451|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/348)|-|
  |Documenting Meeting Notes for the Meeting 1 of Mobile Team|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/349)|-|
  |Revising the Diagrams based on Signup&Login|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/337)|-|
  |Preparing Milestone 1 - CMPE 451 Deliverables|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/409)|-|
  |Updating Sidebar|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/313)|-|
  |Revising Mockups|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/326)|-|
  |Report and Research on Flutter|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/314)|-|
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |Mobile: Map integration into the Event Item|[#752](https://github.com/bounswe/bounswe2022group2/pull/752)|2h 15m|
  |Mobile: Event List and Preview Test|[#754](https://github.com/bounswe/bounswe2022group2/pull/754)|1h 45m|
  |Mobile: BUGFIX - Update Marker Image|[#755](https://github.com/bounswe/bounswe2022group2/pull/755)|30m|
  |Mobile: Tests Event Details|[#757](https://github.com/bounswe/bounswe2022group2/pull/757)|1h 30m|
  |Mobile: Implementing Settings Screen|[#760](https://github.com/bounswe/bounswe2022group2/pull/760)|3h 15m|
  |Mobile: Multi-Language Support - Settings|[#762](https://github.com/bounswe/bounswe2022group2/pull/762)|2h 30m|
  |Mobile: Multi Theme Support - Settings|[#764](https://github.com/bounswe/bounswe2022group2/pull/764)|1h 30m|
  |Mobile: Tests - Settings Screen|[#769](https://github.com/bounswe/bounswe2022group2/pull/769)|1h 30m|
  |Mobile: Fix Annotation Model|[#770](https://github.com/bounswe/bounswe2022group2/pull/770)|3h 30m|
  |Mobile: Back-end Connection of Get Events|[#833](https://github.com/bounswe/bounswe2022group2/pull/833)|3h|
  |Mobile: Back-end Connection of Get Annotations|[#816](https://github.com/bounswe/bounswe2022group2/pull/816)|2h 30m|
  |Mobile: Clickable Learning Space Participants|[#834](https://github.com/bounswe/bounswe2022group2/pull/834)|30m|
  |Fix failing profile screen test due to a hotfix before the demo|[#933](https://github.com/bounswe/bounswe2022group2/pull/933)|15m|
  |Mobile: Hotfix annotation source base url|[#925](https://github.com/bounswe/bounswe2022group2/pull/925)|10m|
  |Mobile: Hotfix annotation tests carousel slider|[#910](https://github.com/bounswe/bounswe2022group2/pull/910)|20m|
  |Mobile: HOTFIX Remove Default Images|[#905](https://github.com/bounswe/bounswe2022group2/pull/905)|20m|
  |Final Milestone: Executive Summary - Bahrican Yesil|[#937](https://github.com/bounswe/bounswe2022group2/pull/937)|2h 15m|
  |Final Milestone: Individual Contributions Report - Bahrican Yesil|[#943](https://github.com/bounswe/bounswe2022group2/pull/943)|3h|
  |Final Milestone: Summary of Work Table - Bahrican Yesil|[#940](https://github.com/bounswe/bounswe2022group2/pull/940)|1h 30m|
  |--------------|--------------|--------------|
  |**Milestone 2**|-|-|
  |Milestone 2: Individual Report of Bahrican|[#707](https://github.com/bounswe/bounswe2022group2/pull/707)|3h 15m|
  |Mobile: Hotfix - Set Default Values and lots of Demo Bugs|[#662](https://github.com/bounswe/bounswe2022group2/pull/662)|2h|
  |Mobile/bugfix/annotation model update|[#653](https://github.com/bounswe/bounswe2022group2/pull/653)|45m|
  |Mobile: Annotation Screen|[#613](https://github.com/bounswe/bounswe2022group2/pull/613)|1h 45m|
  |Mobile: Image Annotation Tests|[#612](https://github.com/bounswe/bounswe2022group2/pull/612)|1h 45m|
  |Mobile: Text Annotation Tests|[#607](https://github.com/bounswe/bounswe2022group2/pull/607)|1h 15m|
  |Mobile: BugFix - Chapter Unit Tests|[#599](https://github.com/bounswe/bounswe2022group2/pull/599)|1h 15m|
  |Mobile: Create Annotation Back End Connection|[#595](https://github.com/bounswe/bounswe2022group2/pull/595)|2h 30m|
  |Mobile: Learning Space Events Section|[#592](https://github.com/bounswe/bounswe2022group2/pull/592)|6h|
  |Integrate display logic for image annotations|[#582](https://github.com/bounswe/bounswe2022group2/pull/582)|2h 30m|
  |Mobile: Implementing Image Annotation|[#581](https://github.com/bounswe/bounswe2022group2/pull/581)|5h 30m|
  |Mobile: Fix Selected Categories Issue Between Page Transitions|[#580](https://github.com/bounswe/bounswe2022group2/pull/580)|40m|
  |Mobile: Implementing Page Transition Animation|[#559](https://github.com/bounswe/bounswe2022group2/pull/559)|1h 15m|
  |Create GitHub Actions for Flutter|[#555](https://github.com/bounswe/bounswe2022group2/pull/555)|1h 15m|
  |Mobile: Native Splash Screen|[#553](https://github.com/bounswe/bounswe2022group2/pull/553)|30m|
  |Mobile: Implementation of Multiple Annotation Selection Dialog |[#550](https://github.com/bounswe/bounswe2022group2/pull/550)|3h 15m|
  |Mobile/enhancement/overlapped annotations|[#547](https://github.com/bounswe/bounswe2022group2/pull/547)|30m|
  |Mobile: Highlighted/Annotated Text Widget|[#539](https://github.com/bounswe/bounswe2022group2/pull/539)|4h 15m|
  |Mobile: Annotatable Text Widget Implementation|[#538](https://github.com/bounswe/bounswe2022group2/pull/538)|5h 15m|
  |Completes tests of the chapter section|[#502](https://github.com/bounswe/bounswe2022group2/pull/502)|1h 15m|
  |Mobile: Learning Space Chapter Section|[#501](https://github.com/bounswe/bounswe2022group2/pull/501)|5h 30m|
  |Create a Pull Request Template|[#480](https://github.com/bounswe/bounswe2022group2/pull/480)|45m|
  |Milestone 2: Summary of Work - Bahrican|[#708](https://github.com/bounswe/bounswe2022group2/pull/708)|1h 15m|
  |Milestone 2: Mobile UI/UX Section - Bahrican|[#715](https://github.com/bounswe/bounswe2022group2/pull/715)|2h 30m|
  |Milestone 2: Mobile Related Additions to the Annotations Part|[#734](https://github.com/bounswe/bounswe2022group2/pull/734)|1h 10m|
  |--------------|--------------|--------------|
  |**Milestone 1**|-|-|
  |Initial app, MVVM design pattern and other helper functions|[#354](https://github.com/bounswe/bounswe2022group2/pull/354)|-|
  |Implementation of the Navigation Manager|[#360](https://github.com/bounswe/bounswe2022group2/pull/360)|-|
  |Base Setup for Multi Language and Multi Theme Support|[#361](https://github.com/bounswe/bounswe2022group2/pull/361)|-|
  |Implementation of Sign Up Screen|[#368](https://github.com/bounswe/bounswe2022group2/pull/368)|-|
  |Tests of the Sign Up Screen|[#373](https://github.com/bounswe/bounswe2022group2/pull/373)|-|
  |Back-end Connection of the Sign Up Screen and Tests|[#389](https://github.com/bounswe/bounswe2022group2/pull/389)|-|
  |Bottom Navigation and App Bar Widgets|[#394](https://github.com/bounswe/bounswe2022group2/pull/394)|-|
  |Static Profile Screen|[#400](https://github.com/bounswe/bounswe2022group2/pull/400)|-|
  |Profile Screen Tests|[#404](https://github.com/bounswe/bounswe2022group2/pull/404)|-|
  |Configuring app icon as our logo|[#402](https://github.com/bounswe/bounswe2022group2/pull/402)|-|
  |Creating milestone 1 deliverables and individual report|[#410](https://github.com/bounswe/bounswe2022group2/pull/410)|-|
  |Update Issue Templates|[#340](https://github.com/bounswe/bounswe2022group2/pull/340)|-|
  |Create the base folder structure and base files of the Flutter project|[#342](https://github.com/bounswe/bounswe2022group2/pull/342)|-|
  
* **Mehmet Gökay Yıldız**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  ||||
  
***

### Status of the Requirements
Note: C stands for Complated, I stands for In Progress, N stands for Not Started. First term is status of Frontend team, the second term is the status of the backend team, and the third term is the status of the mobile team.

For example, C/N/I means that the frontend team completed, the backend team is not started and the mobile team is still working on it.



## 1. Functional Requirements

### 1.1. 🧍 User Requirements

1.1.1. 🔑 Authentication

1.1.1.1. Signup

* 1.1.1.1.1. Guests shall enter an unused username, an unregistered email address, and a strong password to signup. C/C/C
* 1.1.1.1.2. Guests shall agree to the privacy policy and terms&conditions to signup. C/C/C



1.1.1.2. Login

* 1.1.1.2.1. Users shall provide their usernames and passwords to log in. C/C/C



1.1.1.3. Email Verification

* 1.1.1.3.1. Users shall enter the received verification codes (via their registered email addresses) to complete the email verification process. C/C/C


1.1.1.4. Forgot Password

* 1.1.1.4.1. Users shall first enter the email addresses they signed up with and then the verification code they received. C/C/C
* 1.1.1.4.2. Users shall be authenticated after verification and be logged in. C/C/C


1.1.1.5. Logout

* 1.1.1.5.1. Users shall be able to log out. N/N/N


1.1.1.6. Change Password

* 1.1.1.6.1. Users shall be able to change their passwords from the settings screen. C/N/N



1.1.2. 🗿 Profile Page

* 1.1.2.1. Users shall have a profile page. C/C/C
* 1.1.2.2. Users shall be able to edit their profile page. C/C/C
* 1.1.2.3. Users shall be abLe to display their full name on their profile pages. N/N/N
* 1.1.2.4. Users shall have a profile picture. C/C/C
* 1.1.2.5. Users shall be able to change their profile pictures. C/C/C
* 1.1.2.6. Users shall have a bio in their profile pages. C/C/C
* 1.1.2.7. Users shall have a "My Events" section on their profile pages. N/N/N
* 1.1.2.8. Users shall be able to determine their profile page visibility as public or private. N/N/N
* 1.1.2.9. Followers, Follows, My Events, Interest Areas, Achievements, Progress, Notes, and Annotations sections shall be hidden on private profiles. N/N/N

1.1.2.10. Interests and Knowledge

* 1.1.2.10.1 Users shall identify their interest areas  N/N/N
* 1.1.2.10.2 Users shall display their interest areas in their profile pages  C/N/N


1.1.2.11. Achievements

* 1.1.2.11.1. Users shall be able to earn achievements via the completion of a specific amount of Learning Spaces with related topics. N/N/N
* 1.1.2.11.2. Users shall view their achievements from the achievements section of their profile pages. N/N/N



1.1.2.12. Progress Tracking

* 1.1.2.12.1. Users shall be able to track their progress. N/N/N



1.1.2.13. Notes

* 1.1.2.13.1. Users shall view their notes taken on a learning space in the notes section of their profile pages. N/N/N


1.1.2.14. Annotations

* 1.1.2.14.1. Users shall be able to annotate post images and texts in learning spaces. C/C/C 
* 1.1.2.14.2. Users shall be able to view annotations made by other users. C/C/C 
* 1.1.2.14.3. Users shall be able to browse annotations by category, by course, by history, and by upvotes they have received. N/N/N
* 1.1.2.14.4. Users shall access the annotations they have added for course material from the annotations section of their profile pages. N/C/C



1.1.2.15. Learning Spaces

* 1.1.2.15.1. Users shall be able to see all learning spaces they created or enrolled in. C/C/C 



1.1.2.16. Reputation

* 1.1.2.16.1. Users shall be able to see the feedback they have received for their learning content contributions in the recommendations section. N/N/N



1.1.3 👩🏼‍💻 User Interaction

1.1.3.1. User-User Interaction

* 1.1.3.1.1. Users shall see each other's profiles. C/C/C
* 1.1.3.1.2. Users shall be able to follow each other. N/N/N
* 1.1.3.1.3. Users shall see the information of people they follow; their achievements and activities. N/N/N
* 1.1.3.1.4. Users shall be able to share notes with each other. N/N/N
* 1.1.3.1.5. Users shall be able to block other users. N/N/N
* 1.1.3.1.6. Users could prevent other users to see their profile by blocking them. N/N/N



1.1.3.2. User-Learning Space Interaction


1.1.3.2.1. Creating Learning Space & Content

* 1.1.3.2.1.1. Users shall enter a title and description and choose an icon and categories to create a learning space. C/C/C
 

1.1.3.2.2. Editing Learning Spaces

* 1.1.3.2.2.1. Users shall be able to edit all material they provided. C/C/C
* 1.1.3.2.2.2. Users shall be able to delete learning spaces they created. N/N/N


1.1.3.2.3. Enrolling to Learning Spaces

* 1.1.3.2.3.1. Users shall see the contents in the learning space. C/C/C
* 1.1.3.2.3.2. Users shall be able to navigate learning material in the order they desire. C/C/C
* 1.1.3.2.3.3. Users shall be able to review other users in terms of providing learning material by giving stars and optionally providing feedback. N/N/N
* 1.1.3.2.3.4. Users shall be able to report inappropriate comments in the discussion forum of the learning space. N/N/N


1.1.3.2.4. Notes and Annotation

* 1.1.3.2.4.1. Each user shall have his/her notes section under each lecture. C/N/N
* 1.1.3.2.4.2. Users shall create and edit notes under the notes section via typing. C/N/N
* 1.1.3.2.4.3. Users shall be able to mention other notes from other learning spaces or/and other users in his/her. N/N/N
* 1.1.3.2.4.4. Users shall connect, annotate and tag notes. N/N/N


1.1.3.2.5. Community Events

* 1.1.3.2.5.1. Participants shall be able to create community events for that learning space. C/C/C
* 1.1.3.2.5.2. Created events shall only be available to currently enrolled learners. N/N/N
* 1.1.3.2.5.3. Created events should have a specific date, duration, location and limit for the number of participants. C/C/C
* 1.1.3.2.5.4. The event creator can give a brief description of the topics of discussion for the event. C/C/C
* 1.1.3.2.5.5. Event creators shall be able to cancel events that they have created. N/N/N
* 1.1.3.2.5.6. Created events should be visible on the learning space info page along with the date, duration, location and number of participants. C/C/C
* 1.1.3.2.5.7. The number of learners who will join the event will be visible on the event information. C/C/C



1.1.3.2.6. Discussions Forum

* 1.1.3.2.7.1. Participants of a learning space shall be able to create discussion posts. C/N/N


1.1.4 📝 Learning Space Structure

* 1.1.4.1. Participants shall deliver learning material in form of posts which contain text and images. C/C/C
* 1.1.4.2. Learning Space shall have the main page where users can see introduction, events, sections, notes, annotations. C/C/C

 
 
1.1.5 🛂 Administration

* 1.1.5.1. Admin shall evaluate reports and takes action accordingly. N/N/N
* 1.1.5.2. Admin shall be able to ban users permanently and temporarily. N/N/N
* 1.1.5.3. Admin shall be able to view all contents. N/N/N
* 1.1.5.4. Admin shall be able to remove any content. N/N/N



### 1.2. 💻 System Requirements

1.2.1. 💡 Recommendations

* 1.2.1.1. Users will get various learning spaces as recommendations. C/C/C
* 1.2.1.2. These recommendations will be based on users' preferences about the topics of learning space. Learning spaces that have similar topics will be chosen to recommend. C/C/C
* 1.2.1.3. The recommendations will be displayed on the home page. C/C/C


1.2.2. 🔔 Notifications

  * 1.2.2.1 Users shall get notifications from the system. N/N/N
  * 1.2.2.2 The system shall notify users who did not complete almost done section of the registration. N/N/N
  * 1.2.2.3 The system shall notify users regarding any posts on the discussion forum of the lectures they take or give. N/N/N
  * 1.2.2.4 The system shall notify users when other users share notes with them. N/N/N
  * 1.2.2.5 The system shall notify users when they earn an achievement. N/N/N
  * 1.2.2.6 The system shall notify users to give feedback after each completed lecture. N/N/N
  * 1.2.2.7 The system shall notify lecturers when a user provides feedback on one of their courses. N/N/N
  * 1.2.2.8 The system shall notify users when an event is created for a lecture they are taking or giving. N/N/N
  * 1.2.2.9 The system shall notify users when a poll is created in a lecture they are taking. N/N/N
  * 1.2.2.10 The system shall notify users when they do not use the application for more than one day. N/N/N
  * 1.2.2.11 Users shall be able to turn their notifications on or off. N/N/N
  * 1.2.2.12 The system shall notify users when other users follow them. N/N/N
 

1.2.3. 🔎 Searching and Browsing 

  * 1.2.3.1 The system shall implement semantic searching. C/C/C
  * 1.2.3.2 The system shall allow users to search for other users. C/C/C
     * 1.2.3.2.1 The system shall allow searching for users by their username. C/C/C
  * 1.2.3.3 The system shall allow users to search for courses. C/C/C
  * 1.2.3.4 The system shall offer filters for search results. C/C/C
     * 1.2.3.4.1 The system shall allow users to filter search results as only users or only courses. C/C/C
  * 1.2.3.5 The system shall allow users to browse for recommended courses. C/C/C
  * 1.2.3.6 The system shall allow users to browse for learning spaces created or joined by a user's from his/her profile page. C/C/C
  * 1.2.3.7 The system shall allow users to browse their notes. N/N/N
  * 1.2.3.8 The system shall allow users to browse for notes filtered by their tags. N/N/N
  * 1.2.3.9 The system shall allow users to browse the activities and achievements of users they follow on the user's profile page. N/N/N


1.2.5. 💬 Forum/Discussion

* 1.2.5.1. The forum features should be unique to the learning space. There is also a discussion section for the learning space. N/N/N
* 1.2.5.2. The discussion contents should be stored. N/N/N
* 1.2.5.3. The forum should include a timestamp for each entry and the sender's name should be at top of the each entry. N/N/N
* 1.2.5.4. The discussion entry creator's name should direct any user to his/her profile page. N/N/N


1.2.6. 🏁 Almost Done 

* 1.2.6.1. System shall allow users to optionally provide additional information about their full names, birth date, state of education, gender just after the signup stage. N/N/N
* 1.2.6.2. System should allow users to select educational topics, and titles which they are interested in in the almost done stage. N/N/N


1.2.7. 🗑️ Delete Account

* 1.2.7.1. System shall allow users to delete their accounts. N/N/N
* 1.2.7.2. All personalized information about the deleted users have to be anonymized or completely deleted according to the privacy policy that will be determined later on. N/N/N


1.2.8. 🗒️ Annotations

* 1.2.8.1. Users shall be able to create annotations. C/C/C
* 1.2.8.2. Annotations should comply to the [W3 Web Annotation Data Model](https://github.com/bounswe/bounswe2022group2/wiki/W3-Web-Annotation-Data-Model). C/C/C
* 1.2.8.3. Owner of the annotations shall be able to set annotations as public or private. N/N/N
* 1.2.8.4. Created annotations shall be reachable from both profile page and relevant target resource(s). N/N/N
* 1.2.8.5. Annotations may have a body attribute. C/C/C
* 1.2.8.6. Annotations shall have a target attribute. C/C/C
* 1.2.8.7. Annotations may have more than one body attribute and one target attribute. C/C/C
* 1.2.8.8. Annotations with public visibility should be listed on that annotation's creator's profile page. N/N/N



## 2. Non-Functional Requirements

2.1. 🔓 Availability and Accessibility

* 2.1.1. System should have a Website interface that provides an web specific user experience. C (Only for front-end)
* 2.1.2. System should have a Android application interface that provides an mobile specific user experience. C (Only for mobile)
* 2.1.3. System should support [UTF-8](https://developer.mozilla.org/en-US/docs/Glossary/UTF-8) character encoding. C/C/C
* 2.1.4. System should support English language. C/C/C



2.2. 🔏 Privacy

* 2.2.1. Ethical concerns must be considered, so system must follow the rules defined by [GDPR](https://tr.wikipedia.org/wiki/Genel_Veri_Koruma_Y%C3%B6netmeli%C4%9Fi)/[KVKK](https://tr.wikipedia.org/wiki/Ki%C5%9Fisel_Verileri_Koruma_Kurumu).
     * 2.2.1.1 A well-defined explanation about how users data will be used must be given to users. N/N/N
     * 2.2.1.2 Users must agree to the Privacy Policy and User Agreement. C/C/C
     * 2.2.1.3 If any change happens in the policy, users must be notified about it. N/N/N
* 2.2.2. Learning Spaces can be private or public. If a LS is private, its content should not be visible to every user in the app. N/N/N

2.3.  🛡️ Security

* 2.3.1 All sensitive data shall be encrypted before storing. N/N/N
* 2.3.2 The system shall block the account if any security issue is observed. N/N/N

2.4.  🔧 Performance and Reliability
                                                                            
* 2.4.1 The system should be able to handle at least 10.000 users and 500 user actions simultaneously. N/N/N
* 2.4.2 The system should have a response time of at most 2.0 seconds excluding network based delay. N/N/N


2.5. 🧩 Usability
 
* 2.5.1 The system should provide a user-friendly interface. It should contain a basic site map and should not contain a confusing linking system. C/C/C
* 2.5.2 The system should provide a direct feedback mechanism. Upon interaction, user shall be informed about success or failure of their action. C/C/C
* 2.5.3 The system should have a well-chosen typeface that should be readable and clean. C/C/C


2.6. 🌋 Disaster Recovery

* 2.6.1 The system should get backups and send them off-site at regular intervals for the possibility of disasters. N/N/N
* 2.6.2 System shall be able to reinitialize itself and continue functioning in case of an unexpected shutdown. N/N/N
* 2.6.3 System shall keep logs regarding the unexpected shutdown. N/N/N


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

# Glossary
* **Achievement:** _Earnable success token that displays the completion of a course or other general accomplishments._
* **Activity:** _User behavior including creating on enrolling in learning spaces. Displayed on user profile for the other users._
* **Administrator:** _User with additional privileges in a course, the course admin is the course creator by default. Additional admins can be determined by the course creator optionally._
* **Annotate:** _To supply with critical or explanatory notes; comment upon in notes._
* **Authentication:** _The steps of establishing identity and verifying permission to access the platform._
* **Avatar:** _A static image that acts as a visual representation for the user._
* **Bio:** _A short text field edited by the user that is displayed on the user profile page._ 
* **Comment:** _A text of feedback provided with the rating when responding to an entry in the learning space._
* **Learning-Space:** _A co-learning platform instance where users can share various materials, on a specified subject._
* **Event:** _In-person meetings organized by the lecturer of a course, displayed on the course page. Includes geolocation, date, duration and person capacity._
* **Filter:** _An algorithm that categorizes, sorts, prioritizes, or blocks data through rule-based protocols._
* **Follow:** _Establish contact with another user in order to get in touch more easily and view their activities._
* **Forum:** _Communication platform provided within the course in order for the learners and the lecturer to interact._
* **Highlight:** _To emphasize or make prominent._
* **Inactivity:** _Lack of app use or interaction for a continuous amount of time._
* **Incomplete:** _A temporary grade indicating that a learner has not fulfilled one or more of the essential requirements for a course._
* **Interface:** _Graphic display of the application that makes it easier for use._
* **Knowledge base:** _A store of information or data that is available to draw on._
* **Co-learner:** _User enrolled in a learning space._
* **Message:** _A piece of information that is sent through Forum which contains letters and emojis._
* **Milestone:** _A significant point of progress that is reached in a course._
* **Note:** _A text of comment or explanation created by the user._
* **Poll:** _List of questions with options to choose from and no correct answer._
* **Private:** _A piece of information that can only be seen by chosen users._
* **Profile Page:** _Special page created for each user that contains their information._
* **Public:** _A piece of information that can be seen by all users._
* **Quiz:** _A special type of poll containing questions with a determined correct answer._
* **Reputation:** _Overall representation of how well a user's learning spaces have been rated._
* **Semantic Search:** _Semantic search is an alternative to the lexical search where contextual meaning is used to improve the accuracy of the results._
* **Strong password:** _A password whose length is at least 8 and which contains at least one number, one upper and one lower case letter._
* **Tag:** _Label used to categorize or identify content._
* **Typeface:** _Design of the lettering that can include variation in size, weight, slope, width, etc._
* **User:** _A person utilizing the application._

# Requirements

## 1. Functional Requirements

### 1.1. 🧍 User Requirements

<details><summary>1.1.1. 🔑 Authentication</summary><blockquote>

<details><summary>1.1.1.1. Signup</summary>

* 1.1.1.1.1. Guests shall enter an unused username, an unregistered email address, and a strong password to signup.
* 1.1.1.1.2. Guests shall agree to the privacy policy and terms&conditions to signup.

</details>

<details><summary>1.1.1.2. Login</summary>

* 1.1.1.2.1. Users shall provide their usernames and passwords to log in.

</details>

<details><summary>1.1.1.3. Email Verification</summary>

* 1.1.1.3.1. Users shall enter the received verification codes (via their registered email addresses) to complete the email verification process.
</details>

<details><summary>1.1.1.4. Forgot Password</summary>

* 1.1.1.4.1. Users shall first enter the email addresses they signed up with and then the verification code they received.
* 1.1.1.4.2. Users shall be authenticated after verification and be logged in.
</details>

<details><summary>1.1.1.5. Logout</summary>

* 1.1.1.5.1. Users shall be able to log out.

</details>

<details><summary>1.1.1.6. Change Password</summary>

* 1.1.1.6.1. Users shall be able to change their passwords from the settings screen.

</details>

</blockquote></details>

<details><summary>1.1.2. 🗿 Profile Page</summary><blockquote>

* 1.1.2.1. Users shall have a profile page.
* 1.1.2.2. Users shall be able to edit their profile page.
* 1.1.2.3. Users shall be able to display their full name on their profile pages.
* 1.1.2.4. Users shall have a profile picture.
* 1.1.2.5. Users shall be able to change their profile picture.
* 1.1.2.6. Users shall have a bio in their profile pages.
* 1.1.2.7. Users shall have a "My Events" section on their profile pages.
* 1.1.2.8. Users shall be able to determine their profile page visibility as public or private.
* 1.1.2.9. Followers, Follows, My Events, Interest Areas, Achievements, Progress, Notes, and Annotations sections shall be hidden on private profiles.

<details><summary>1.1.2.10. Interests and Knowledge</summary>

* 1.1.2.10.1 Users shall identify their interest areas
* 1.1.2.10.2 Users shall display their interest areas in their profile pages

</details>

<details><summary>1.1.2.11. Achievements</summary>

* 1.1.2.11.1. Users shall be able to earn achievements via the completion of a specific amount of Learning Spaces with related topics.
* 1.1.2.11.2. Users shall view their achievements from the achievements section of their profile pages.

</details>


<details><summary>1.1.2.12. Progress Tracking</summary>

* 1.1.2.12.1. Users shall be able to track their progress.

</details>

<details><summary>1.1.2.13. Notes</summary>

* 1.1.2.13.1. Users shall view their notes taken on a learning space in the notes section of their profile pages.

</details>

<details><summary>1.1.2.14. Annotations</summary>

* 1.1.2.14.1. Users shall be able to annotate post images and texts in learning spaces.
* 1.1.2.14.2. Users shall be able to view annotations made by other users.
* 1.1.2.14.3. Users shall be able to browse annotations by category, by course, by history, and by upvotes they have received.
* 1.1.2.14.4. Users shall access the annotations they have added for course material from the annotations section of their profile pages.
</details>


<details><summary>1.1.2.15. Learning Spaces</summary>

* 1.1.2.15.1. Users shall be able to see all learning spaces they created or enrolled in.

</details>

<details><summary>1.1.2.16. Reputation</summary>

* 1.1.2.16.1. Users shall be able to see the feedback they have received for their learning content contributions in the recommendations section.

</details>

</blockquote></details>

<details><summary>1.1.3 👩🏼‍💻 User Interaction</summary><blockquote>

<details><summary>1.1.3.1. User-User Interaction</summary>

* 1.1.3.1.1. Users shall see each other's profiles. 
* 1.1.3.1.2. Users shall be able to follow each other.
* 1.1.3.1.3. Users shall see the information of people they follow; their achievements and activities.
* 1.1.3.1.4. Users shall be able to share notes with each other.
* 1.1.3.1.5. Users shall be able to block other users.
* 1.1.3.1.6. Users could prevent other users to see their profile by blocking them.


</details>


<details><summary>1.1.3.2. User-Learning Space Interaction</summary>

<blockquote>

<details><summary>1.1.3.2.1. Creating Learning Space & Content</summary>

* 1.1.3.2.1.1. Users shall enter a title and description and choose an icon and categories to create a learning space.


</details>

<details><summary>1.1.3.2.2. Editing Learning Spaces</summary>

* 1.1.3.2.2.1. Users shall be able to edit all material they provided.
* 1.1.3.2.2.2. Users shall be able to delete learning spaces they created.

</details>

<details><summary>1.1.3.2.3. Enrolling to Learning Spaces </summary>

* 1.1.3.2.3.1. Users shall see the contents in the learning space.
* 1.1.3.2.3.2. Users shall be able to navigate learning material in the order they desire.
* 1.1.3.2.3.3. Users shall be able to review other users in terms of providing learning material by giving stars and optionally providing feedback.
* 1.1.3.2.3.4. Users shall be able to report inappropriate comments in the discussion forum of the learning space.

</details>

<details><summary>1.1.3.2.4. Notes and Annotation</summary>

* 1.1.3.2.4.1. Each user shall have his/her notes section under each lecture.
* 1.1.3.2.4.2. Users shall create and edit notes under the notes section via typing.
* 1.1.3.2.4.3. Users shall be able to mention other notes from other learning spaces or/and other users in his/her.
* 1.1.3.2.4.4. Users shall connect, annotate and tag notes.

</details>

<details><summary>1.1.3.2.5. Community Events</summary>

* 1.1.3.2.5.1. Participants shall be able to create community events for that learning space.
* 1.1.3.2.5.2. Created events shall only be available to currently enrolled learners.
* 1.1.3.2.5.3. Created events should have a specific date, duration, location and limit for the number of participants.
* 1.1.3.2.5.4. The event creator can give a brief description of the topics of discussion for the event.
* 1.1.3.2.5.5. Event creators shall be able to cancel events that they have created.
* 1.1.3.2.5.6. Created events should be visible on the learning space info page along with the date, duration, location and number of participants.
* 1.1.3.2.5.7. The number of learners who will join the event will be visible on the event information. 

</details>


<details><summary>1.1.3.2.6. Discussions Forum</summary>

* 1.1.3.2.7.1. Participants of a learning space shall be able to create discussion posts.

</details>

</details>

</blockquote></details>

<details><summary>1.1.4 📝 Learning Space Structure</summary><blockquote>

* 1.1.4.1. Participants shall deliver learning material in form of posts which contain text and images.
* 1.1.4.2. Learning Space shall have the main page where users can see introduction, events, sections, notes, annotations.
* 1.1.4.3. The creator of a learning space shall be able to add additional admins to the learning space.


</details>

<details><summary>1.1.5 🛂 Administration</summary><blockquote>

* 1.1.5.1. Admin shall evaluate reports and takes action accordingly.
* 1.1.5.2. Admin shall be able to ban users permanently and temporarily.
* 1.1.5.3. Admin shall be able to view all contents.
* 1.1.5.4. Admin shall be able to remove any content.

</details>

</blockquote>
</details>


### 1.2. 💻 System Requirements

<details><summary>1.2.1. 💡 Recommendations </summary><blockquote>

* 1.2.1.1. Users will get various learning spaces as recommendations.
* 1.2.1.2. These recommendations will be based on users' preferences about the topics of learning space. Learning spaces that have similar topics will be chosen to recommend.
* 1.2.1.3. The recommendations will be displayed on the home page.

</blockquote></details>

<details><summary>1.2.2. 🔔 Notifications</summary><blockquote>

  * 1.2.2.1 Users shall get notifications from the system.
  * 1.2.2.2 The system shall notify users who did not complete almost done section of the registration.
  * 1.2.2.3 The system shall notify users regarding any posts on the discussion forum of the lectures they take or give.
  * 1.2.2.4 The system shall notify users when other users share notes with them.
  * 1.2.2.5 The system shall notify users when they earn an achievement.
  * 1.2.2.6 The system shall notify users to give feedback after each completed lecture.
  * 1.2.2.7 The system shall notify lecturers when a user provides feedback on one of their courses.
  * 1.2.2.8 The system shall notify users when an event is created for a lecture they are taking or giving.
  * 1.2.2.9 The system shall notify users when a poll is created in a lecture they are taking.
  * 1.2.2.10 The system shall notify users when they do not use the application for more than one day.
  * 1.2.2.11 Users shall be able to turn their notifications on or off.
  * 1.2.2.12 The system shall notify users when other users follow them.

</blockquote></details>

<details><summary>1.2.3. 🔎 Searching and Browsing </summary><blockquote>

  * 1.2.3.1 The system shall implement semantic searching.
  * 1.2.3.2 The system shall allow users to search for other users.
     * 1.2.3.2.1 The system shall allow searching for users by their username.
  * 1.2.3.3 The system shall allow users to search for courses.
  * 1.2.3.4 The system shall offer filters for search results.
     * 1.2.3.4.1 The system shall allow users to filter search results as only users or only courses.
  * 1.2.3.5 The system shall allow users to browse for recommended courses.
  * 1.2.3.6 The system shall allow users to browse for learning spaces created or joined by a user's from his/her profile page.
  * 1.2.3.7 The system shall allow users to browse their notes.
  * 1.2.3.8 The system shall allow users to browse for notes filtered by their tags.
  * 1.2.3.9 The system shall allow users to browse the activities and achievements of users they follow on the user's profile page.
</blockquote></details>

<details><summary>1.2.5. 💬 Forum/Discussion </summary><blockquote>

* 1.2.5.1. The forum features should be unique to the learning space. There is also a discussion section for the learning space.
* 1.2.5.2. The discussion contents should be stored.
* 1.2.5.3. The forum should include a timestamp for each entry and the sender's name should be at top of the each entry.
* 1.2.5.4. The discussion entry creator's name should direct any user to his/her profile page.

</blockquote>
</details>

<details><summary>1.2.6. 🏁 Almost Done </summary><blockquote>

* 1.2.6.1. System shall allow users to optionally provide additional information about their full names, birth date, state of education, gender just after the signup stage.
* 1.2.6.2. System should allow users to select educational topics, and titles which they are interested in in the almost done stage.

</blockquote>
</details>

<details><summary>1.2.7. 🗑️ Delete Account </summary><blockquote>

* 1.2.7.1. System shall allow users to delete their accounts.
* 1.2.7.2. All personalized information about the deleted users have to be anonymized or completely deleted according to the privacy policy that will be determined later on.

</blockquote>
</details>

<details><summary>1.2.8. 🗒️ Annotations </summary><blockquote>

* 1.2.8.1. Users shall be able to create annotations.
* 1.2.8.2. Annotations should comply to the [W3 Web Annotation Data Model](https://github.com/bounswe/bounswe2022group2/wiki/W3-Web-Annotation-Data-Model).
* 1.2.8.3. Owner of the annotations shall be able to set annotations as public or private.
* 1.2.8.4. Created annotations shall be reachable from both profile page and relevant target resource(s).
* 1.2.8.5. Annotations may have a body attribute.
* 1.2.8.6. Annotations shall have a target attribute.
* 1.2.8.7. Annotations may have more than one body attribute and one target attribute.
* 1.2.8.8. Annotations with public visibility should be listed on that annotation's creator's profile page.

</blockquote>

</details>

## 2. Non-Functional Requirements

<details><summary>2.1. 🔓 Availability and Accessibility</summary><blockquote>


* 2.1.1. System should have a Website interface that provides an web specific user experience.
* 2.1.2. System should have a Android application interface that provides an mobile specific user experience.
* 2.1.3. System should support [UTF-8](https://developer.mozilla.org/en-US/docs/Glossary/UTF-8) character encoding.
* 2.1.4. System should support English language.

</details>

<details><summary>2.2. 🔏 Privacy</summary><blockquote>

 
* 2.2.1. Ethical concerns must be considered, so system must follow the rules defined by [GDPR](https://tr.wikipedia.org/wiki/Genel_Veri_Koruma_Y%C3%B6netmeli%C4%9Fi)/[KVKK](https://tr.wikipedia.org/wiki/Ki%C5%9Fisel_Verileri_Koruma_Kurumu).
     * 2.2.1.1 A well-defined explanation about how users data will be used must be given to users.
     * 2.2.1.2 Users must agree to the Privacy Policy and User Agreement.
     * 2.2.1.3 If any change happens in the policy, users must be notified about it. 
* 2.2.2. Learning Spaces can be private or public. If a LS is private, its content should not be visible to every user in the app.
</details>

<details><summary>2.3.  🛡️ Security</summary><blockquote>

 
* 2.3.1 All sensitive data shall be encrypted before storing.
* 2.3.2 The system shall block the account if any security issue is observed. 
</details>

<details><summary>2.4.  🔧 Performance and Reliability</summary><blockquote>

 
* 2.4.1 The system should be able to handle at least 10.000 users and 500 user actions simultaneously. 
* 2.4.2 The system should have a response time of at most 2.0 seconds excluding network based delay.
</details>

<details><summary>2.5. 🧩 Usability </summary><blockquote>

 
* 2.5.1 The system should provide a user-friendly interface. It should contain a basic site map and should not contain a confusing linking system.
* 2.5.2 The system should provide a direct feedback mechanism. Upon interaction, user shall be informed about success or failure of their action. 
* 2.5.3 The system should have a well-chosen typeface that should be readable and clean.
</details>

<details><summary>2.6. 🌋 Disaster Recovery </summary><blockquote>

* 2.6.1 The system should get backups and send them off-site at regular intervals for the possibility of disasters.
* 2.6.2 System shall be able to reinitialize itself and continue functioning in case of an unexpected shutdown.
* 2.6.3 System shall keep logs regarding the unexpected shutdown. 
</details>

***

## Software Design Documents (UML)

### Use Case Diagram
Link: [Use Case Diagram](https://lucid.app/lucidchart/975d6056-2874-4fb9-8642-fc1a3a88aab4/edit?invitationId=inv_acc885f2-fa4a-491c-888a-b14b05e8aa09&page=0_0#) \
![Use Case Diagram](https://user-images.githubusercontent.com/74411541/195986879-a1ec4b01-a0f4-4ced-9b93-ab9658aabcfa.png "use case")

### Class Diagram
Link: [Class Diagram](https://lucid.app/lucidchart/8688dac0-de02-48d2-bed7-f1ef8d62aba6/edit?invitationId=inv_26b91b21-bb1b-47cd-96e4-a1a28fc9b0ce&page=0_0#) \
![Class Diagram](https://user-images.githubusercontent.com/74411541/195987280-940454c0-bef8-4322-b2dd-198f710fb97f.png "class")

### Sequence Diagram
Link: [Sequence Diagram](https://lucid.app/lucidchart/12990ace-9701-4be5-8ec5-cd83aebead91/edit?invitationId=inv_b9ba75d9-be43-49fd-9fcc-08c90d5c7fd8&page=0_0#) \
![Sequence Diagram](https://user-images.githubusercontent.com/100771925/210212213-bd049344-06a3-4abf-b767-bb7f4f3b3793.png "sequence")

***

## User Scenarios and Mockups

### Registered Lecturer Scenario, Hasan Taşkıran

#### Persona
<img align="left" src="https://user-images.githubusercontent.com/60237280/159185638-b2a3171d-030c-4779-87a8-a9cb0379bade.jpg" width="310" > 

<pre>
- Hasan Taşkıran
- 33 years old, male, lives in Levent, İstanbul
- Personality
    * Practical
    * Social
    * Helpful
    * Busy, tense 
- Full-time mobile app developer at Andrestan in Levent/Istanbul
- Has more than 10 years of experience in the mobile app development area
</pre>

#### User Story
Hasan is an experienced mobile app developer. He has various experiences in different companies previously and currently working in a company as a full time mobile app developer. Contrary to what is believed about software developers, he is an extrovert and social person. In time off from work, he wants to share his knowledge, some programming tips with junior developers. Since he has a busy business life, he wants to share what he knows in the easiest and fastest way without having to allocate so much time. He cannot allocate enough time to prepare, record, edit and share course videos. Just because of this, he cannot use some popular educational platforms that allow lecturers to share course videos and learners to watch them. He is using our application's website since he can easily collect his notes, tips, explanations in time and share them whenever they are ready with the learners as a course.

#### Goals
- He wants to create a course by providing required information for a course creation.
- He wants to set a course name, indicates a topic, provides a description and define the pre-requirements for this course.
- He wants to create separate sections for the course to have a learning progress step by step.
- He wants to set the privacy status of some sections of the created course as private because those sections are not ready to publish yet and still under construction.

#### Pre-Conditions
- He has already signed up, has an account, and a filled profile.
- He has logged in to the our web app so that the initial screen he saw is the home screen.
- He has experience in most of the features like creating notes, courses, and so on.
- He is actively using the app, he already has some courses, learners, and reputation from them. 


#### Scenario
1) To begin, he opens the application's website.
3) The website navigates him to the home page after the launch.
4) Then he clicks the "Add Course" button.
5) He then is navigated to the "Course Creation Page".
6) He fills the course information, including the name, description, requirements, and other elements.
7) Finally, he creates the course.

#### Acceptance Criteria
* **Login**
    * 1.1.1.2.1. Users shall provide their username and passwords to be able to login if they logged out or they are kicked out due to long inactivity.

* **Lecture Creation**
    * 1.1.3.2.1.1. Lectures shall be given a unique title during creation.
    * 1.1.3.2.1.2. Lecturer shall state the lectures topic in a specified field for sake of categorization.

* **Lecture Structure**
    * 1.1.4.1. Lectures shall deliver lecture material in text, images, and embedded videos.
    * 1.1.4.2. Lectures shall have an Introduction where the lecturer presents the lecture in a text.

* **Lecture Privacy**
    * 1.1.3.2.2.3. Lecturer should be able to set a part of the lecture as hidden to be able to edit in different times.

#### Mock-up
1. He has already created an account and logged in.<br/>
2. In the home page, he clicks 'Add Course' link.<br/>
![l1-click](https://user-images.githubusercontent.com/36857236/161304264-a3533bd9-7a57-4f70-b2f1-52cfaba81522.PNG)<br/>
3. After seeing the initial 'Course Creating Page'...<br/>
![l2](https://user-images.githubusercontent.com/36857236/159791942-a471b9bd-648c-472b-92db-59eb26a40231.PNG)<br/>
3.(continued) ...he fills the page with desired information.<br/>
![l3-click](https://user-images.githubusercontent.com/36857236/161304320-26da0e4c-9075-499a-95ad-6db1e1728fb7.png)<br/>
4. After filling the page, he clicks on 'Create Course!' button. After the click, webpage feedbacks Hasan that the course creation process is successful via a pop-up.<br/>
![l4](https://user-images.githubusercontent.com/36857236/159792646-0454b789-0ba3-466d-a85e-a177ae2ffa40.png)

### Unregistered Learner Scenario, Ai Zheng

#### Persona
<img align="left" src="https://media.istockphoto.com/id/1344252956/tr/foto%C4%9Fraf/modern-young-woman-of-asian-ethnicity-e-learning-via-laptop-at-the-modern-and-cozy.jpg?s=612x612&w=0&k=20&c=SuExMG33lSq4nEuYjJeDT2rMaH6s9KzhMARiK5kltB4=" width="280" > 

<pre>
- Ai Zheng
- 17 years old, female, lives in Hong Kong
-Personality:
    *Cheerful
    *Curious
    *Artistic
    *Extroverted
-High school student
-Interested in video game art, especially 3D modelling.
</pre>

#### User Story
Ai is a highschool student who has been going to golfing with her parents and admired how her parents golf. Her admiration became her inspiration and she got into golfing recently. While looking for sources to learn to drive a golf cart, she heard that Cosmo Kramer, one of actor worked in one of her favourite TV-series "Seinfeld". Interested in Kramer's lectures, Ai signs in to our application to check out Kramer's lecturer profile. While signing in, she decides to keep her profile private because she wants to avoid attention and she thinks a new learners profile won't help to anyone. After signing in, she searches Kramer's lectures and his profile. and sees that overall learner satisfaction from Kramer's courses are particularly high when it comes to the terms of golfing! Thus, she goes on to one of Kramer's lectures on driving a golf cart. After seeing interaction between learners, thinking about having fellow learners to talk about ideas and encouraging each other like people do in lecture's community, she enrolls. The first section after introduction is "An Electric Golf Cart: What Is It and Who’s It For?" where Kramer talks about the basics of an electric golf cart. Ai annotates some history about golf carts as an additional information for learners. At the end of first lecture, Kramer has set a quiz type poll to check learner's familiarity with the storage of golf carts. Ai completes the poll and she was successful enough to earn the lecture's first badge.

#### Goals
- Since she is not registered to the app yet, firstly she wants to create an account for herself.
- She wants to look at lecturer profiles and view overall learner satisfaction from those lecturers' courses and take lectures about topics she is interested in from lecturers she choose.
- Then, she intends to earn these lectures' achievements, earn badges after completing necessary tasks or quizzes and more importantly, learn from them.
- While learning the lectures, she wants to create notes related to the learning material. Thus, she wants to connect, annotate, tag and share these notes.
- This user cares about privacy, so she wants to be able to choose who can see her profile page, achievements, badges. Furthermore, she wants to be able to block other users if she wishes.


#### Pre-Conditions
- She does not have an account for the app, so she has not logged in to the app yet.
- She tries to create her account, so that the initial screen she saw is the "Create A New Account" page.
- After creating the account, she sees the page where she chooses the interests before navigating to the home screen.
- She has experience in most of the features of the app like creating notes, taking lectures, earning badges, blocking other users.


#### Scenario
1. Initially, she opens the website.
2. In the homepage, she clicks "Sign Up" button to create a new account.
3. She fills the required information, makes her profile private and reads and accepts the privacy policy.
4. The system sends a verification email to the given email address. 
5. She verifies her email address and logins into her account.
6. At the first login, she have to select one or more topic that she interests. System directs her to the home page.
7. At the home page, she clicks the search button and types a lecturer name.
8. She reads the learner feedbacks about the courses from the lecturer profile.
9. She chooses and enrolls one of the courses which she is looking for.
10. She accesses this course under the "Enrolled Courses" page.
11. She starts to learn the topic from the course contents.
12. During the learning progress, she takes notes and annotates them. 
13. At the end of the first part of the course, she takes a quiz.
14. She earns one badge from the lecturer because she finished the first part of the course.
15. To see this badge, she clicks the "Profile" button.
16. Finally, she can see her first badge here.

#### Acceptance Criteria
* **Signup**
     * 1.1.1.1.1. Guests shall enter their username, email address and strong passwords to be able to signup. These are the required information that users have to provide to enter the app.
     * 1.1.1.1.2. Guests shall check the checkbox which indicates the agreement text of the privacy policy and terms&conditions to be able to signup. It is a required action.

* **Email Verification**
     * 1.1.1.3.1. Users shall enter the received verification codes (via their registered email addresses) to complete the email verification process.

* **Searching and Browsing**
     * 1.2.3.2 The system shall allow users to search for other users.
          * 1.2.3.2.1 The system shall allow searching for users by their username.
          * 1.2.3.2.2 The system should suggest users based on full name when search query gives no result for usernames.

* **Recommendation**
     * 1.1.2.13.2.1. Users shall be able to see the feedback they have received for the courses they provide teaching material in the recommendations section.
     * 1.1.2.13.2.2. Users shall be able to view comment and star rating for each feedback, alongside the commentator’s name and first letter of their surname, a basic profile picture with their initials, and the name of the course.

* **Taking Lectures**
     * 1.1.3.2.3.1. Users shall see the content within sections as lecturer intended.
     * 1.1.3.2.3.2. Users shall navigate in lecture material.
     * 1.1.3.2.3.3. Users shall see which parts of the lecture they completed.
     * 1.1.3.2.3.5. Users shall receive confirmation of their expertise on the topic upon completion of a lecture.
     * 1.1.3.2.4.4. Users shall annotate lecture content by matching lecture content to notes.

* **Notes and Annotation**
     * 1.1.3.2.4.1. Each user shall have his/her notes section under each lecture.
     * 1.1.3.2.4.2. User shall create and edit notes under notes section via typing.

* **Achievements**
     * 1.1.2.11.1. Users shall view the achievements they earned from the courses they have studied in the achievements section of their profile pages

#### Mockup  
1. She has already downloaded the app. Initially, she launches the app.
2. In the homepage, she clicks "Sign Up" button to create a new account.
<img width="793" alt="1" src="https://user-images.githubusercontent.com/68481602/159768813-a49e87ca-35cd-410e-a597-aebc94194fd2.png">

3. She fills the required information, makes her profile private and reads and accepts the privacy policy.
<img width="818" alt="2" src="https://user-images.githubusercontent.com/68481602/159774261-31a6bd1e-4483-4b9f-b03e-2459e9ea924e.png">
<img width="818" alt="3" src="https://user-images.githubusercontent.com/68481602/159774287-0f3f0bee-8c75-430a-ab5d-e965f6a16dbb.png">

4. The system sends a verification email to the given email address. 
<img width="943" alt="4" src="https://user-images.githubusercontent.com/68481602/159769711-04f478ac-a54c-415f-ab8c-d74148b689b8.png">

5. She verifies her email address and logins into her account.
6. At the first login, she have to select one or more topic that she interests. System directs her to the home page.
<img width="947" alt="5" src="https://user-images.githubusercontent.com/68481602/159769777-f25d28c5-e3aa-47e2-98f1-2462e4f6ce84.png">

7. At the home page, she clicks the search button and types a lecturer name.
<img width="943" alt="6" src="https://user-images.githubusercontent.com/68481602/159769825-c6c5bff8-2d31-4915-a4be-d8a341766aaa.png">
<img width="944" alt="7" src="https://user-images.githubusercontent.com/68481602/159769856-cbf1f0d0-b422-4c5b-b03d-637c3b2b0474.png">

8. She reads the learner feedbacks about the courses the lecturer profile.
9. She chooses and enrolls one of the courses which she is looking for.
<img width="943" alt="8" src="https://user-images.githubusercontent.com/68481602/159769997-6ba3d001-e643-41f4-866a-514a10b30ce1.png">

10. She accesses this course under the "Enrolled Courses" page.
<img width="945" alt="9" src="https://user-images.githubusercontent.com/68481602/159770073-3d14d6f8-9b31-47fc-9b58-b689402004fd.png">

11. She starts to learn the topic from the course contents.
<img width="944" alt="10" src="https://user-images.githubusercontent.com/68481602/159770134-d3b455ca-2807-4e12-81a3-9da0e37ebf1a.png">

12. During the learning progress, she takes notes and annotates them. 
<img width="955" alt="11" src="https://user-images.githubusercontent.com/68481602/159770159-f8fd4c7a-d05e-4520-9cec-7b7dccc533c0.png">

13. At the end of the first part of the course, she takes a quiz.
<img width="944" alt="12" src="https://user-images.githubusercontent.com/68481602/159770203-c12cbdc6-9510-48fd-8e92-cafdaf8ff88e.png">

14. She earns one badge from the lecturer because she finished the first part of the course.
<img width="944" alt="13" src="https://user-images.githubusercontent.com/68481602/159770269-c936d987-df7d-4a1b-a261-9eff4bdaea38.png">

15. To see this badge, she clicks the "Profile" button.
<img width="940" alt="14" src="https://user-images.githubusercontent.com/68481602/159770298-edc6a8ed-74df-4fb9-ae77-387bef2f7cf4.png">

16. Finally, she can see her first badge here.
<img width="948" alt="15" src="https://user-images.githubusercontent.com/68481602/159770321-d213a1b5-d4ad-444d-9638-910dd628bdb7.png">

### Lecturer Creates Community Event Scenario, Ezgi Ece Smith

#### Persona
<img align="left" src="https://user-images.githubusercontent.com/56553280/159314799-6888ca70-3b33-4fc4-9165-79757e793ec9.jpg" width="200" > 

<pre>
- Ezgi Ece Smith
- 46 years old, female, lives in Hisarüstü, İstanbul
- Personality
    * Impatient
    * Strict
    * Sarcastic
    * Friendly
- Works at AI Robotics Lab in Bogazici University.
- Loves teaching so much want to do it even in her free time.
</pre>

  

#### User Story
Ezgi Ece has been a lecturer for the last 20 years at Bogazici University. She has graduated from ODTÜ and got her PhD from Harvard University on Artificial Intelligence. She loves teaching and interacting with students, and was very sad when she couldn't meet her students face to face due to the pandemic.  In her free time, she likes bird watching and taking long hikes. She likes to test out different methods to reach more students and teach more efficiently. She tried our app for this purpose and loved it so much started exploring different features. She shares lots of notes and sources with her students. 


#### Goals
- She wants to get to know her students better.
- She thinks she can accomplish this by hosting a meeting event.
- She wants to make sure the details for the meeting are shared by all students so that no one misses out.
- She would like to answer her students' questions instantly.

#### Pre-Conditions
- She is signed up for the platform.  
- She has created a course and the course has students enrolled.  
- She has opened the website and logged in to her profile. 
- She has accessed the course page for the course she is giving.


#### Scenario
1) She has already launched the website and has navigated to the course page.
2) She clicks the chat button to view the chat for the course.
3) She clicks the "Create Community Event" button.
4) Application launches a dialog that asks for location, date, duration and participant limit.
5) She fills in the fields with the relevant information and clicks "Create Event".
6) The event is created and displayed on the course info page.


#### Acceptance Criteria  
* 1.1.1.2. Login  
    * 1.1.1.2.1. Users shall provide their username and passwords to be able to login if they logged out or they are kicked out due to long inactivity.  
* 1.1.3.2.5. Community Events  
    * 1.1.3.2.5.1. Users who are qualified as lecturers shall create community events.

    * 1.1.3.2.5.2. Created events shall include currently enrolled learners.

    * 1.1.3.2.5.4. Events have a specific date, duration, and limit for the number of participants.

    * 1.1.3.2.5.7. These events will be visible on the course info page along with the date, duration, and the number of participants.

    * 1.1.3.2.5.9. The number of students who will join the event will be visible to both lecturers and students. 


#### Mockup  
1) She has already launched the website and has navigated to the course page.
![ComEvent1](https://user-images.githubusercontent.com/74256913/161118819-4ca087d4-0944-4034-ab69-9536952d0474.png) 

2) She clicks the chat button to view the chat for the course.
![ComEvent2](https://user-images.githubusercontent.com/74256913/161118827-75b1bb82-f81d-444a-a078-f1bc57943b5b.png)

3) She clicks the "Create Community Event" button.
4) Application launches a dialog that asks for location, date, duration and participant limit.
![ComEven3](https://user-images.githubusercontent.com/74256913/161118832-69cf2b52-6be4-43d0-8d1c-dcb5a65f017a.png)

5) She fills in the fields with the relevant information and clicks "Create Event".
![ComEven4](https://user-images.githubusercontent.com/74256913/161118836-71a9abd4-b96b-4c72-aa3f-7cf1abe4e687.png)

6) The event is created and displayed on the course info page.
![ComEvent5](https://user-images.githubusercontent.com/74256913/161118842-0c27412c-38e9-4835-be29-a7a9f522f7fc.png)
![ComEvent6](https://user-images.githubusercontent.com/74256913/161118844-b900053d-abb1-47b9-ac29-831677bf1fe8.png)

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

 **Milestone - 1:**
 
  1. Implementing the login endpoint
  2. Implementing the verify email endpoint
  3. Testing and documenting both endpoints
  4. Implementing unit tests for both endpoints
  5. Reviewing all works done by backend teammates  
  6. Doing research on technologies needed to use on backend development
 
 ----------
 
 **Milestone - 2:**
 
   1. Creating enroll to Learning Space Endpoint.
  2. Implementing unit tests for enroll to learning space endpoint.
  3. Creating post.js model.
  4. Creating Create Post endpoint.
  5. Implementing the unit tests for Create Post Endpoint.
  6. Creating Edit Post Endpoint.
  7. Implementing the unit tests for Edit Post Endpoint.
  8. Research about W3C models and standarts to prepare backend implementation.
  9. Creating annotation.js model.
  10. Creating Create Annotation endpoint.
  11. Creating Edit Annotations endpoint.
  12. Reviewing the works done by the backend team.
  13. Solving bugs, errors, problems encountered during the implementation of the database connection regularly.
  14. Attending and participating general meetings regularly.
  15. Attending and participating frontend team meetings regularly.
  16. Deploying the new version of dev branch when requested.
  17. Creating Postman documentation with examples for newly implemented endpoints.
 
 ----------
 
 **Milestone - 3:**
  1. Initializing annotation service external application
  2. Initializing Docker containers for the annotation service
  3. Writing dockerfile of annotation service
  4. Creating an AWS instance to keep annotation service
  5. Deploy the annotation service application
  6. Implement GET Annotations by ID endpoint for annotation service
  7. Implement POST Create Annotations endpoint for annotation service
  8. Implement GET Annotations by ID endpoint for Learnify, to provide connection to annotation service
  9. Implement POST Create Annotations by ID endpoint for Learnify, to provide connection to annotation service
  10. Implement Vote Post endpoint
  11. Write unit tests for Vote Post endpoint
  12. Implement user search API
  13. Solving bugs, errors, problems encountered during the implementation of the database connection regularly.
  14. Attending and participating general meetings regularly.
  15. Attending and participating frontend team meetings regularly.
  16. Deploying the new version of dev branch when requested.
  17. Creating Postman documentation with examples for newly implemented endpoints.
 
 -------------
 

## *Main Contributions:*

   I am a member of our small backend team of two in Learnify project. Throughout the term I would generalize my responsibilities as 
Developing and maintaining the server-side of the web application, including the implementation of server-side logic, databases, and APIs.
Collaborating with the front-end developers to ensure that the user interface is properly integrated with the backend.
Working with the team to design and implement features for the platform, such as the ability for users to create and annotate posts in learning spaces.
Ensuring the security and scalability of the application by implementing appropriate measures such as input validation, secure coding practices, and performance optimization.
Troubleshooting and debugging issues as they arise, and collaborating with the team to find and implement solutions.
Participating in code reviews and contributing to the overall development process by sharing knowledge and best practices with the team.
Staying up-to-date with the latest technologies and industry trends, and incorporating them into the platform as appropriate.

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:
 
 **Milestone - 1:**
 
  1. [Backend: Implementing Unit Tests for Login Endpoint](https://github.com/bounswe/bounswe2022group2/issues/421)
  2. [Backend: Writing Tests for Verify Email Endpoint](https://github.com/bounswe/bounswe2022group2/issues/418)
  3. [Backend: Implementation of Login API](https://github.com/bounswe/bounswe2022group2/issues/380)
  4. [Backend: Email Verification API](https://github.com/bounswe/bounswe2022group2/issues/364)
 
 -----------
 
**Milestone - 2:**
 
  1. [Backend: POST Learning Space Enroll Endpoint](https://github.com/bounswe/bounswe2022group2/issues/561)
  2. [Backend: Implementing Unit Tests for Enrolling Learning Space](https://github.com/bounswe/bounswe2022group2/issues/563)
  3. [Backend: Create Annotation Endpoint](https://github.com/bounswe/bounswe2022group2/issues/577)
  4. [Backend: Create Post Endpoint](https://github.com/bounswe/bounswe2022group2/issues/589)
  5. [Backend: Edit Post Endpoint](https://github.com/bounswe/bounswe2022group2/issues/600)
  7. [Backend: Edit Annotation Endpoint](https://github.com/bounswe/bounswe2022group2/issues/602)
  8. [Backend: Unit Tests for Create Post Endpoint](https://github.com/bounswe/bounswe2022group2/issues/663)
  9. [Backend: Unit Tests for Edit Post Endpoint](https://github.com/bounswe/bounswe2022group2/issues/665)
 ---------------
 
 **Milestone - 3:**
 
  1. [Backend: Create Annotations Service and POST Create Annotations Endpoint for Annotation Service](https://github.com/bounswe/bounswe2022group2/issues/781)
  2. [Backend: GET Annotations by Learning Space and Post ID for Annotations Service](https://github.com/bounswe/bounswe2022group2/issues/782)
  3. [Backend: Create Annotation for Learnify App](https://github.com/bounswe/bounswe2022group2/issues/786)
  4. [Backend: GET Annotations by Learning Space and Post ID for Learnify](https://github.com/bounswe/bounswe2022group2/issues/810)
  5. [Backend: Give full functionality to Annotations Service](https://github.com/bounswe/bounswe2022group2/issues/823)
  7. [Backend: Upvote/Downvote Posts API](https://github.com/bounswe/bounswe2022group2/issues/830)
  8. [Backend: User Search API](https://github.com/bounswe/bounswe2022group2/issues/845)
  9. [Backend: Implement and Fix Unit Tests](https://github.com/bounswe/bounswe2022group2/issues/865)
 
 
 ----------------

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:
 
 **Milestone - 1:**
 
  1. [Research & Report for Backend Technologies (Backend Team)](https://github.com/bounswe/bounswe2022group2/issues/321)
  2. [Revising the Requirements : User - User Interaction](https://github.com/bounswe/bounswe2022group2/issues/334)
  3. [Revising the Requirements : Glossary](https://github.com/bounswe/bounswe2022group2/issues/335)
  4. [Revising the Diagrams based on User - User Interaction](https://github.com/bounswe/bounswe2022group2/issues/336)
  5. [Reviewing the Revising the Requirements: Achievements and Badges](https://github.com/bounswe/bounswe2022group2/issues/333)
  6. [Reviewing the Revising the Diagrams based on Signup&Login](https://github.com/bounswe/bounswe2022group2/issues/337)
  7. [Reviewing the Revising the Diagrams based on Achievements](https://github.com/bounswe/bounswe2022group2/issues/346)
  8. [Reviewing the Dockerization of the API](https://github.com/bounswe/bounswe2022group2/issues/355)
  9. [Prepaing the Slide for our First Demo](https://github.com/bounswe/bounswe2022group2/issues/460)
 --------------
 
 **Milestone - 2:**
  
 1. [Milestone-2 Report: Annotations](https://github.com/bounswe/bounswe2022group2/issues/675)
  2. [Milestone-2 Report: API Documentation](https://github.com/bounswe/bounswe2022group2/issues/677)
  3. [Milestone-2 Report:Indiviual Report](https://github.com/bounswe/bounswe2022group2/issues/691)
 
 --------------
 
 **Milestone - 3:**
  
 1. [Backend: Documenting Endpoints that are related to Annotation-Service](https://github.com/bounswe/bounswe2022group2/issues/812)
  2. [Final Milestone: Annotations & Standards](https://github.com/bounswe/bounswe2022group2/issues/952)
  3. [Final Milestone: API Documentation](https://github.com/bounswe/bounswe2022group2/issues/953)
  3. [Final Milestone: Indiviual Report](https://github.com/bounswe/bounswe2022group2/issues/960)
 ----------------
 

## *Pull Requests:*
 
 **Milestone - 1:**
 
 1. Backend: Implementing Unit Tests for Login endpoint  [#422](https://github.com/bounswe/bounswe2022group2/pull/422)
  2. Backend: Implementing Tests for Verify Email Endpoint [#420](https://github.com/bounswe/bounswe2022group2/pull/420)
  3. 380 implementation of login api [#380](https://github.com/bounswe/bounswe2022group2/pull/380)
  4. Verify email endpoint [#374](https://github.com/bounswe/bounswe2022group2/pull/374)

 --------------
 
 **Milestone - 2:**
  
 1. 561 backend post learning space join endpoint [#562](https://github.com/bounswe/bounswe2022group2/pull/562)
   2. 563 backend implementing unit tests for enrolling learning space  [#564](https://github.com/bounswe/bounswe2022group2/pull/564)
   3. Backend: Create Annotation Endpoint [#588](https://github.com/bounswe/bounswe2022group2/pull/588)
   4. Backend: Create post endpoint implemented [#590](https://github.com/bounswe/bounswe2022group2/pull/590)
   5. Backend: Annotation Endpoint Creator and LS IDs [#597](https://github.com/bounswe/bounswe2022group2/pull/597)
   6.Backend: Edit Post Endpoint [#601](https://github.com/bounswe/bounswe2022group2/pull/601)
   7. Backend: Edit Annotations Endpoint [#603](https://github.com/bounswe/bounswe2022group2/pull/603)
   8. Backend: Create Post endpoint Unit Test [#664](https://github.com/bounswe/bounswe2022group2/pull/664)
   9. Backend: Unit Tests for Edit Post Endpoint [#666](https://github.com/bounswe/bounswe2022group2/pull/666)
   10. Milestone-2 Report: Annotations [#674](https://github.com/bounswe/bounswe2022group2/pull/674)
   11. Milestone-2 Report: API Documentation [#685](https://github.com/bounswe/bounswe2022group2/pull/685)
 
 --------------
 
 **Milestone - 3:**
 
  1. Backend: POST Create Annotations for Annotation Service [#785](https://github.com/bounswe/bounswe2022group2/pull/785)
   2. Backend: Create Annotation Endpoint for Learnify  [#803](https://github.com/bounswe/bounswe2022group2/pull/803)
   3. Backend FIX: Annotation ID will hold LS and Post ID [#804](https://github.com/bounswe/bounswe2022group2/pull/804)
   4. Backend: Get Annotations by Id for Annotations Service [#809](https://github.com/bounswe/bounswe2022group2/pull/809)
   5. Backend: Get Annotations by Learning Space and Post ID for Learnify Server [#811](https://github.com/bounswe/bounswe2022group2/pull/811)
   6. BUGFIX: Duplicate Annotation IDs on Annotation Service POST Create Endpointt [#818](https://github.com/bounswe/bounswe2022group2/pull/818)
   7. Backend: Upvote/Downvote Post API [#831](https://github.com/bounswe/bounswe2022group2/pull/831)
   8. Backend: User Search API [#846](https://github.com/bounswe/bounswe2022group2/pull/664)
   9. Backend: Implementing and Bug Fixing Unit Tests [#864](https://github.com/bounswe/bounswe2022group2/pull/864)
   10. Final Milestone: Update Annotations and Standards Section [#954](https://github.com/bounswe/bounswe2022group2/pull/954)
 
 ----------------

## *Unit Tests:*
  
 1. Backend: Implementing Tests for Verify Email Endpoint [#420](https://github.com/bounswe/bounswe2022group2/pull/676)
  2. Backend: Implementing Unit Tests for Login endpoint [#422](https://github.com/bounswe/bounswe2022group2/pull/422)
  3. 563 backend implementing unit tests for enrolling learning space [#564](https://github.com/bounswe/bounswe2022group2/pull/564)
  4. Backend: Create Post endpoint Unit Test [#664](https://github.com/bounswe/bounswe2022group2/pull/664)
  5. Backend: Unit Tests for Edit Post Endpoint [#666](https://github.com/bounswe/bounswe2022group2/pull/666)
  6. Backend: Implementing and Bug Fixing Unit Tests [#864](https://github.com/bounswe/bounswe2022group2/pull/864)

## *Additional Information:*  
 
   None

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

I am a member of the mobile team for the development of our application which is Learnify. Therefore, most contributions were on the mobile side. However, I also did significant contributions to the general organization of our repository and the process of the team. I found a free and satisfactory solution for displaying event locations on a map: Open Street Map. I researched and tried various solutions (like Google Maps, Yandex Maps) before deciding. I also did its integration to our mobile application, I configured and customized it according to our needs. Additionally, I determined the way we should follow to mark a point in the map while creating an event.

Apart from the items above, I added multi-theme and multi-language supports to our app. These features were so critical while serving an app to real users. Since we aim to have global users from all around the world, we prioritized and added these features.

My last main contribution is to update annotation model on mobile side according to the changes made by the back-end team (to exactly, %100, comply with W3C standards).

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

  1. [Mobile: Integration of Open Street Map to the Events](https://github.com/bounswe/bounswe2022group2/issues/750)
  2. [Mobile: Event List and Preview Test](https://github.com/bounswe/bounswe2022group2/issues/753)
  3. [Mobile: Tests for Event Details](https://github.com/bounswe/bounswe2022group2/issues/756)
  4. [Mobile: Implementing Settings Screen](https://github.com/bounswe/bounswe2022group2/issues/758)
  5. [Mobile: Multi-language Support and Settings](https://github.com/bounswe/bounswe2022group2/issues/761)
  6. [Mobile: Multi-Theme Support and Settings](https://github.com/bounswe/bounswe2022group2/issues/763)
  7. [Mobile: Fix Annotation Model](https://github.com/bounswe/bounswe2022group2/issues/765)
  8. [Mobile: Tests for Settings Screen](https://github.com/bounswe/bounswe2022group2/issues/768)
  9. [Mobile: Back-end Connection of Get Events](https://github.com/bounswe/bounswe2022group2/issues/773)
  10. [Mobile: Back-end Connection of Get Annotations](https://github.com/bounswe/bounswe2022group2/issues/813)
  
--------------------

**Milestone-2**

  1. [Mobile: Implementing Annotatable Text Widget](https://github.com/bounswe/bounswe2022group2/issues/505)
  2. [Mobile: Implementing Highlighted (Annotated) Text Widget](https://github.com/bounswe/bounswe2022group2/issues/517)
  3. [Mobile: Implementing Overlapped Text Annotation Support](https://github.com/bounswe/bounswe2022group2/issues/545)
  4. [Mobile: Implementation of the Image Annotation](https://github.com/bounswe/bounswe2022group2/issues/578)
  5. [Mobile: Implementation of the Annotated Image Display Logic](https://github.com/bounswe/bounswe2022group2/issues/579)
  6. [Mobile: Implementation of the Events Section](https://github.com/bounswe/bounswe2022group2/issues/583)
  7. [Mobile: Back-end Connection of Creating Annotation](https://github.com/bounswe/bounswe2022group2/issues/594)
  8. [Mobile: Writing Tests of the Text Annotation Feature](https://github.com/bounswe/bounswe2022group2/issues/606)
  9. [Mobile: Writing Tests of the Image Annotation Feature](https://github.com/bounswe/bounswe2022group2/issues/608)
  10. [Mobile: Image Annotation Cropped Preview - Annotations Screen](https://github.com/bounswe/bounswe2022group2/issues/614)
  11. [Mobile: Writing Tests of the Text Annotation Feature](https://github.com/bounswe/bounswe2022group2/issues/606)
  12. [Mobile: Implementing Learning Space Detail Chapter Section](https://github.com/bounswe/bounswe2022group2/issues/477)
  13. [Mobile: Writing Tests of the Learning Space Detail Chapter Section](https://github.com/bounswe/bounswe2022group2/issues/478)
  14. [Mobile: Implementing Page Transition Animation](https://github.com/bounswe/bounswe2022group2/issues/558)
  15. [Mobile: Native Splash Screen](https://github.com/bounswe/bounswe2022group2/issues/552)

--------------------

**Milestone-1**

  1. [Implementation of MVVM Setup, Extensions and the Initial App Widget](https://github.com/bounswe/bounswe2022group2/issues/350)
  2. [Mobile: Implementing Sign Up Screen](https://github.com/bounswe/bounswe2022group2/issues/358)
  3. [Mobile: Writing Tests for Sign Up Screen](https://github.com/bounswe/bounswe2022group2/issues/359)
  4. [Mobile: Back-end Connection of Sign Up Endpoint](https://github.com/bounswe/bounswe2022group2/issues/369)
  5. [Mobile: Implementing Static Profile Screen](https://github.com/bounswe/bounswe2022group2/issues/397)
  6. [Mobile: Writing Tests of the Profile Screen](https://github.com/bounswe/bounswe2022group2/issues/403)
  7. [Mobile: Implementing the Navigation Manager](https://github.com/bounswe/bounswe2022group2/issues/356)
  8. [Mobile: Base Setup for Multi-Language and Multi-Theme Setup](https://github.com/bounswe/bounswe2022group2/issues/357)
  9. [Mobile: Bottom Navigation and App Bar Widgets](https://github.com/bounswe/bounswe2022group2/issues/393)
  10. [Mobile: Implement App Icon](https://github.com/bounswe/bounswe2022group2/issues/401)

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

**Final Milestone-3**

  1. [Final Milestone: Individual Contributions Report - Bahrican Yesil](https://github.com/bounswe/bounswe2022group2/issues/938)
  2. [Mobile: Research on Map Packages in Flutter](https://github.com/bounswe/bounswe2022group2/issues/751)
  3. [Final Milestone: Filling Executive Summary Section](https://github.com/bounswe/bounswe2022group2/issues/936)
  4. [Final Milestone: Summary of Work Table - Bahrican Yesil](https://github.com/bounswe/bounswe2022group2/issues/939)

--------------------

**Milestone-2**

  1. [Creating a Pull Request Template](https://github.com/bounswe/bounswe2022group2/issues/476)
  2. [Documenting Meeting notes for Mobile Meeting #4](https://github.com/bounswe/bounswe2022group2/issues/479)
  3. [Mobile: Create GitHub Actions for Flutter](https://github.com/bounswe/bounswe2022group2/issues/554)
  4. [Milestone 2: Individual Report](https://github.com/bounswe/bounswe2022group2/issues/701)
  5. [Milestone 2: Annotations Part of the Report - Mobile](https://github.com/bounswe/bounswe2022group2/issues/719)
  6. [Milestone 2: Fill User Interface Part for Mobile](https://github.com/bounswe/bounswe2022group2/issues/710)

--------------------

**Milestone-1**

  1. [Revising the Requirements: Authentication](https://github.com/bounswe/bounswe2022group2/issues/331)
  2. [Revising the Diagrams based on Signup&Login](https://github.com/bounswe/bounswe2022group2/issues/337)
  3. [Documenting Meeting Notes for the Meeting 3 of CMPE 451](https://github.com/bounswe/bounswe2022group2/issues/348)
  4. [Documenting Meeting Notes for the Meeting 1 of Mobile Team](https://github.com/bounswe/bounswe2022group2/issues/349)
  5. [Revising the Diagrams based on Signup&Login](https://github.com/bounswe/bounswe2022group2/issues/337)
  6. [Preparing Milestone 1 - CMPE 451 Deliverables](https://github.com/bounswe/bounswe2022group2/issues/409)
  7. [Updating Sidebar](https://github.com/bounswe/bounswe2022group2/issues/313)
  8. [Revising Mockups](https://github.com/bounswe/bounswe2022group2/issues/326)
  9. [Report and Research on Flutter](https://github.com/bounswe/bounswe2022group2/issues/314)

## *Pull Requests:*

**Final Milestone-3**

1. Mobile: Map integration into the Event Item [#752](https://github.com/bounswe/bounswe2022group2/pull/752)
2. Mobile: Event List and Preview Test [#754](https://github.com/bounswe/bounswe2022group2/pull/754)
3. Mobile: BUGFIX - Update Marker Image [#755](https://github.com/bounswe/bounswe2022group2/pull/755)
4. Mobile: Tests Event Details [#757](https://github.com/bounswe/bounswe2022group2/pull/757)
5. Mobile: Implementing Settings Screen [#760](https://github.com/bounswe/bounswe2022group2/pull/760)
6. Mobile: Multi-Language Support - Settings [#762](https://github.com/bounswe/bounswe2022group2/pull/762)
7. Mobile: Multi Theme Support - Settings [#764](https://github.com/bounswe/bounswe2022group2/pull/764)
8. Mobile: Tests - Settings Screen [#769](https://github.com/bounswe/bounswe2022group2/pull/769)
9. Mobile: Fix Annotation Model [#770](https://github.com/bounswe/bounswe2022group2/pull/770)
10. Mobile: Back-end Connection of Get Events [#833](https://github.com/bounswe/bounswe2022group2/pull/833)
11. Mobile: Back-end Connection of Get Annotations [#816](https://github.com/bounswe/bounswe2022group2/pull/816)
12. Mobile: Clickable Learning Space Participants [#834](https://github.com/bounswe/bounswe2022group2/pull/834)
13. Final Milestone Report: Individual Report - Bahrican Yesil [#943](https://github.com/bounswe/bounswe2022group2/pull/943)
14. Final Milestone Report: Executive Summary - Bahrican Yesil [#937](https://github.com/bounswe/bounswe2022group2/pull/937)
15. Final Milestone Report: Summary of Work Table - Bahrican Yesil [#940](https://github.com/bounswe/bounswe2022group2/pull/940)

--------------------

**Milestone-2**

1. Create a Pull Request Template [#480](https://github.com/bounswe/bounswe2022group2/pull/480)
2. Milestone 1: Evaluation of Tools And Processes - Mobile [#484](https://github.com/bounswe/bounswe2022group2/pull/484)
3. Mobile: Learning Space Chapter Section [#501](https://github.com/bounswe/bounswe2022group2/pull/501)
4. Mobile: Annotatable Text Widget Implementation [#538](https://github.com/bounswe/bounswe2022group2/pull/538)
5. Mobile: Highlighted/Annotated text widget [#539](https://github.com/bounswe/bounswe2022group2/pull/539)
6. Mobile: Enhancement-Overlapped annotations [#547](https://github.com/bounswe/bounswe2022group2/pull/547)
7. Mobile: Implementation of Multiple Annotation Selection Dialog [#550](https://github.com/bounswe/bounswe2022group2/pull/550)
8. Mobile: Native Splash Screen [#553](https://github.com/bounswe/bounswe2022group2/pull/553)
9. Creates GitHub Actions for Flutter [#555](https://github.com/bounswe/bounswe2022group2/pull/555)
10. Mobile: Page Transition Animation [#559](https://github.com/bounswe/bounswe2022group2/pull/559)
11. Mobile: Fix Selected Categories Issue Between Page Transitions [#580](https://github.com/bounswe/bounswe2022group2/pull/580)
12. Mobile: Image Annotation [#581](https://github.com/bounswe/bounswe2022group2/pull/581)
13. Integrate display logic for image annotations [#582](https://github.com/bounswe/bounswe2022group2/pull/582)
14. Mobile: Create Annotation Back End Connection [#595](https://github.com/bounswe/bounswe2022group2/pull/595)
15. Mobile: BugFix - Chapter Unit Tests [#599](https://github.com/bounswe/bounswe2022group2/pull/599)
16. Mobile: Text Annotation Tests [#607](https://github.com/bounswe/bounswe2022group2/pull/607)
17. Mobile: Image Annotation Tests [#612](https://github.com/bounswe/bounswe2022group2/pull/612)
18. Mobile: Annotation Screen [#613](https://github.com/bounswe/bounswe2022group2/pull/613)
19. Mobile: Bugfix/annotation model update [#653](https://github.com/bounswe/bounswe2022group2/pull/653)
20. Mobile: Hotfix - Set Default Values and lots of Demo Bugs [#662](https://github.com/bounswe/bounswe2022group2/pull/662)
21. Milestone 2: Individual Report of Bahrican [#707](https://github.com/bounswe/bounswe2022group2/pull/707)
22. Milestone 2: Summary of Work - Bahrican [#708](https://github.com/bounswe/bounswe2022group2/pull/708)
23. Milestone 2: Mobile UI/UX Section - Bahrican [#715](https://github.com/bounswe/bounswe2022group2/pull/715)
24. Milestone 2: Mobile Related Additions to the Annotations Part [#734](https://github.com/bounswe/bounswe2022group2/pull/734)

--------------------

**Milestone-1**

1. Initial app, MVVM design pattern and other helper functions [#354](https://github.com/bounswe/bounswe2022group2/pull/354)
2. Implementation of the Navigation Manager [#360](https://github.com/bounswe/bounswe2022group2/pull/360)
3. Base Setup for Multi Language and Multi Theme Support [#361](https://github.com/bounswe/bounswe2022group2/pull/361)
4. Implementation of Sign Up Screen [#368](https://github.com/bounswe/bounswe2022group2/pull/368)
5. Tests of the Sign Up Screen [#373](https://github.com/bounswe/bounswe2022group2/pull/373)
6. Back-end Connection of the Sign Up Screen and Tests [#389](https://github.com/bounswe/bounswe2022group2/pull/389)
7. Bottom Navigation and App Bar Widgets [#394](https://github.com/bounswe/bounswe2022group2/pull/394)
8. Static Profile Screen [#400](https://github.com/bounswe/bounswe2022group2/pull/400)
9. Profile Screen Tests [#404](https://github.com/bounswe/bounswe2022group2/pull/404)
NOTE: Hours before the final demo presentation, one of our team-mates did a HOTFIX on the updated profile screen. After this hotfix, the tests for the profile screen became failing. We didn't have enough time to fix this test since we were dealing with demo presentation. Therefore, I was able to fix the problem in the profile screen test evening of the demo day (after taken the tag). I also contacted with Suzan hoca and she said to me to note this issue in my report. So, please consider the lastly updated code version in the GitHub for the profile screen test. Recently updated version is working successfully, and all tests are passed.
10. Configuring app icon as our logo [#402](https://github.com/bounswe/bounswe2022group2/pull/402)
11. Creating milestone 1 deliverables and individual report [#410](https://github.com/bounswe/bounswe2022group2/pull/410)
12. Update Issue Templates [#340](https://github.com/bounswe/bounswe2022group2/pull/340)
13. Create the base folder structure and base files of the Flutter project [#342](https://github.com/bounswe/bounswe2022group2/pull/342)

## *Unit Tests:*

1. Mobile: Image Annotation Tests [#612](https://github.com/bounswe/bounswe2022group2/pull/612)
2. Mobile: Text Annotation Tests [#607](https://github.com/bounswe/bounswe2022group2/pull/607)
3. Mobile: Chapter Section Tests under Learning Space Detail Screen [#502](https://github.com/bounswe/bounswe2022group2/pull/502)
4. Mobile: Profile Screen Tests [#404](https://github.com/bounswe/bounswe2022group2/pull/404)
NOTE: Hours before the final demo presentation, one of our team-mates did a HOTFIX on the updated profile screen. After this hotfix, the tests for the profile screen became failing. We didn't have enough time to fix this test since we were dealing with demo presentation. Therefore, I was able to fix the problem in the profile screen test evening of the demo day (after taken the tag). I also contacted with Suzan hoca and she said to me to note this issue in my report. So, please consider the lastly updated code version in the GitHub for the profile screen test. Recently updated version is working successfully, and all tests are passed.
5. Mobile: Signup Screen Tests [#373](https://github.com/bounswe/bounswe2022group2/pull/373)
6. Mobile: Sign Up Screen Back-end Connection Tests [#389](https://github.com/bounswe/bounswe2022group2/pull/389)
7. Mobile: Event List and Preview Test [#754](https://github.com/bounswe/bounswe2022group2/pull/754)
8. Mobile: Tests Event Details [#757](https://github.com/bounswe/bounswe2022group2/pull/757)
9. Mobile: Tests - Settings Screen [#769](https://github.com/bounswe/bounswe2022group2/pull/769)

## *Additional Information:*

**Final Milestone-3**

Since the beginning of this term, I didn't miss any lecture/lab hours and participated in all of the team/sub-group meetings actively. I also took responsibility in the process that we prepare our mobile app into the demo-day. I solved critical bugs, checked and corrected the back-end connection, data update in the app. I also answered incoming questions in the demo day and helped to our presenter. I took the responsibility of the 2 most significant features we developed until the final milestone 2 on mobile side, which are the annotation and geo-location features.

--------------------

**Milestone-2**

Since the beginning of this term, I didn't miss any lecture/lab hours and participated in all of the team/sub-group meetings actively. I also took responsibility in the process that we prepare our mobile app into the demo-day. I solved critical bugs, checked and corrected the back-end connection, data update in the app. I also answered incoming questions in the demo day and helped to our presenter. I took the responsibility of most significant feature we developed until the milestone 2 on mobile side, which is the annotation feature.

--------------------

**Milestone-1**

I built the base file, folder structure on mobile project. We have decided to use MVVM design pattern while implementing the project and I created a base structure for it. I have informed my teammates about the user flow we should follow.

I actively participated in and give suggestions about the endpoints we should have. I also give suggestions about the request and response bodies of the endpoints. I explained some concepts and real-life examples of the front designs both for web and mobile. I contributed to the logic we should implement in the authentication flow (signup-login-forgot password-email verification)

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
