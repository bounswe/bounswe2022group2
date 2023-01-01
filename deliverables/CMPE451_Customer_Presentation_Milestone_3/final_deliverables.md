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
