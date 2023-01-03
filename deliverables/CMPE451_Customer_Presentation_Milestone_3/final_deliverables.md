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

As we approach the end of our software development course, we are pleased to announce the successful completion of all deliverables for our Learnify online learning platform project, a collaborative effort that has been a central aspect of our educational program. The fulfillment of this project represents a major achievement for our team, one that reflects the dedication, commitment, and intellectual curiosity that we have brought to bear throughout the course of its development. It is with a sense of pride and accomplishment that we reflect upon the knowledge and skills gained through this highly enriching experience, and we look forward to applying these foundations as we continue to pursue our professional development as software developers. We are grateful for the opportunity to have participated in this project and look forward to building upon the skills and knowledge acquired throughout this journey as we embark upon the next phase of our careers.
 
|Deliverable|Status|Date Delivered|
|-----|:--------:|:------:|
|[**Group Milestone Report**](#group-milestone-report)|Delivered|02/01/2023|
|[**Project Artifacts**](#project-artifacts)<br><br><ul><li>[**Manuals**](#manuals)<br><ul><li>[**User Manual**](#user-manual)<li>[**System Manual**](#system-manual)</li></ul><li>[**Software Requirements Specification (SRS)**](#software-requirements-specification-srs)</li><li>[**Software Design Documents (UML)**](#software-design-documents-uml)</li><li>[**User Scenarios and Mockups**](#user-scenarios-and-mockups)</li><li>[**Project Plan**](#project-plan)</li><li>[**Unit Tests**](#unit-tests)</li></li></ul>|Delivered|02/01/2023|
|[**Software Package**](#software-package)<br><br><ul><li>[**Deployed Software**](#software-package)<br></li><li>[**Final Release Version**](#software-package)<br></li><li>[**Instructions For Building (with Docker)**](#software-package)<br></li><li>[**Database Content**](#software-package)<br></li></ul>|Delivered|02/01/2023|
|[**Individual Milestone Reports**](#individual-milestone-reports)|Delivered|02/01/2023|

***

### Final Release Notes

Release: 0.9.0 Customer presentation 3

What has changed?

- Event functionality has added to our application. Users can create and participate in events using mobile app or the learnify webpage.
- Annoration back-end is moved to its seperate server using new annotations microservice and now working completely independent of monolithic back-end server. 
- Profile functionality has been added, users can search and see each others profiles, change their bios and profile pictures.
- Semantic recomendations are added, using semantic encoding of learningspaces, semantic engine finds the most suitable learningspaces to recomend to a particular user.
- Comment functionality is added, users now can comment on posts under learning spaces.
- Users now can upvote and downwote posts to show their opinion about posts.
- Multi-language feature addded to the mobile app.
- About us sections are added to the web and mobile apps.
- Our mobile app now supports dark mode to improve accesability.

What is fixed?

- Web application is connected to the new annotation server using W3 annotation model.
- Annotation service is seperated from the back-end and now serves an API to allow other services to access our annotations.

What will be fixed in next releases?

- Semantic search treshold will be fine tuned.
- Authentication will be improved with a new auth middleware. 
- Learning space creators will be able to select learningspace header pictures and icons.
- Notes functionality will be added.

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
  |**Final Milestone 3**|-|-|
  |--------------|--------------|--------------|
  |Frontend: Learning Space Preview Box Backend Connection|[#766](https://github.com/bounswe/bounswe2022group2/issues/766)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Create Event Component|[#772](https://github.com/bounswe/bounswe2022group2/issues/772)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for Learning Space Preview Box|[#788](https://github.com/bounswe/bounswe2022group2/issues/788)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Home Page My Learning Spaces Backend Connection|[#791](https://github.com/bounswe/bounswe2022group2/issues/791)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Home Page Popular Learning Spaces Backend Connection|[#792](https://github.com/bounswe/bounswe2022group2/issues/792)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: My Learning Spaces Page|[#802](https://github.com/bounswe/bounswe2022group2/issues/802)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for My Learning Spaces Page|[#806](https://github.com/bounswe/bounswe2022group2/issues/806)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Popular Learning Spaces Page|[#808](https://github.com/bounswe/bounswe2022group2/issues/808)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for Popular Learning Spaces Page|[#819](https://github.com/bounswe/bounswe2022group2/issues/819)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: User Search Component|[#870](https://github.com/bounswe/bounswe2022group2/issues/870)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Custom Map Picker Component|[#892](https://github.com/bounswe/bounswe2022group2/issues/892)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Recommended Learning Spaces Part in Home Page|[#900](https://github.com/bounswe/bounswe2022group2/issues/900)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Recommended Learning Spaces Page|[#906](https://github.com/bounswe/bounswe2022group2/issues/906)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Text and Image Annotation Backend Connection|[#918](https://github.com/bounswe/bounswe2022group2/issues/918)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |**Milestone 2**|-|-|
  |--------------|--------------|--------------|
  |Frontend: Implementation of Home Page|[#518](https://github.com/bounswe/bounswe2022group2/issues/518)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Implementation of Categories Page|[#544](https://github.com/bounswe/bounswe2022group2/issues/544)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Implementation of Learning Spaces by Category Page|[#605](https://github.com/bounswe/bounswe2022group2/issues/605)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: HOTFIX Learning Space Page Structural Overflow|[#636](https://github.com/bounswe/bounswe2022group2/issues/636)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Implementation of Semantic Search Bar|[#652](https://github.com/bounswe/bounswe2022group2/issues/652)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for Categories Page|[#673](https://github.com/bounswe/bounswe2022group2/issues/673)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for Learning Spaces by Categories Page|[#679](https://github.com/bounswe/bounswe2022group2/issues/679)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for Navigation Bar and Semantic Search Component|[#682](https://github.com/bounswe/bounswe2022group2/issues/682)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |**Milestone 1**|-|-|
  |--------------|--------------|--------------|
  |Revising the Requirements Specification|[#323](https://github.com/bounswe/bounswe2022group2/issues/323)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Research & Report for Frontend Technologies (Frontend Team)|[#327](https://github.com/bounswe/bounswe2022group2/issues/327)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Documenting Meeting Notes for the Meeting 2 of CMPE 451|[#328](https://github.com/bounswe/bounswe2022group2/issues/328)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Revising the Requirements Specification: Notifications|[#329](https://github.com/bounswe/bounswe2022group2/issues/329)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Designing the Logo and Determining Color Scheme, Typeface of the Project|[#353](https://github.com/bounswe/bounswe2022group2/issues/353)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Implementation of Sign Up Page|[#376](https://github.com/bounswe/bounswe2022group2/issues/376)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Backend Connection for the Sign Up Page|[#405](https://github.com/bounswe/bounswe2022group2/issues/405)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Dockerization of the Frontend|[#412](https://github.com/bounswe/bounswe2022group2/issues/412)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Adding Form Validations for Sign Up Form|[#424](https://github.com/bounswe/bounswe2022group2/issues/424)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for Sign Up Page|[#451](https://github.com/bounswe/bounswe2022group2/issues/451)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |AWS Deployment of the Web Application|[#459](https://github.com/bounswe/bounswe2022group2/issues/459)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |--------------|--------------|--------------|
  |Frontend: Learning Space Preview Box BE Connection|[#767](https://github.com/bounswe/bounswe2022group2/pull/767)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for the Learning Space Preview Box Component|[#790](https://github.com/bounswe/bounswe2022group2/pull/790)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Home Page My Learning Spaces Backend Connection|[#796](https://github.com/bounswe/bounswe2022group2/pull/796)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Home Page Popular Learning Spaces Backend Connection|[#801](https://github.com/bounswe/bounswe2022group2/pull/801)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: My Learning Spaces Page|[#805](https://github.com/bounswe/bounswe2022group2/pull/805)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for My Learning Spaces Page|[#807](https://github.com/bounswe/bounswe2022group2/pull/807)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Popular Learning Spaces Page|[#817](https://github.com/bounswe/bounswe2022group2/pull/817)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for Popular Learning Spaces Page|[#839](https://github.com/bounswe/bounswe2022group2/pull/839)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Create Event Component|[#860](https://github.com/bounswe/bounswe2022group2/pull/767)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: User Search Component|[#881](https://github.com/bounswe/bounswe2022group2/pull/881)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Recommended Learning Spaces in Home Page|[#902](https://github.com/bounswe/bounswe2022group2/pull/902)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Recommended Learning Spaces Page|[#909](https://github.com/bounswe/bounswe2022group2/pull/909)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Annotation BE Connection|[#922](https://github.com/bounswe/bounswe2022group2/pull/922)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |**Milestone 2**|-|-|
  |--------------|--------------|--------------|
  |Frontend: Implementation of Home Page|[#536](https://github.com/bounswe/bounswe2022group2/pull/536)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Implementation of Categories Page|[#571](https://github.com/bounswe/bounswe2022group2/pull/571)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Learning Spaces by Category Pages Implementation|[#633](https://github.com/bounswe/bounswe2022group2/pull/633)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: HOTFIX Learning Space Page Structural Overflow|[#637](https://github.com/bounswe/bounswe2022group2/pull/637)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Semantic Search Bar Implementation|[#655](https://github.com/bounswe/bounswe2022group2/pull/655)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for Categories Page|[#676](https://github.com/bounswe/bounswe2022group2/pull/676)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for Learning Spaces by Category Page|[#680](https://github.com/bounswe/bounswe2022group2/pull/680)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit Tests for Navigation Bar and Semantic Search Component|[#684](https://github.com/bounswe/bounswe2022group2/pull/684)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |**Milestone 1**|-|-|
  |--------------|--------------|--------------|
  |Frontend: Sign up page implementation|[#387](https://github.com/bounswe/bounswe2022group2/pull/387)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Dockerization of Frontend|[#413](https://github.com/bounswe/bounswe2022group2/pull/413)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Sign Up Form Validation|[#426](https://github.com/bounswe/bounswe2022group2/pull/426)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Backend connection for sign up page|[#438](https://github.com/bounswe/bounswe2022group2/pull/438)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|
  |Frontend: Unit tests for sign up page|[#456](https://github.com/bounswe/bounswe2022group2/pull/456)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)|

* **Egemen Atik**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |Mobile: Implementing Create Event Screen|[#842](https://github.com/bounswe/bounswe2022group2/issues/842)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Backend Connection For Create Event Screen|[#873](https://github.com/bounswe/bounswe2022group2/issues/873)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Implement geolocation selection screen|[#887](https://github.com/bounswe/bounswe2022group2/issues/887)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Backend Connection for Attend Event|[#911](https://github.com/bounswe/bounswe2022group2/issues/911)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Revision in the Home Screen|[#916](https://github.com/bounswe/bounswe2022group2/issues/916)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Translate texts in the application to other languages|[#919](https://github.com/bounswe/bounswe2022group2/issues/919)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Final Milestone: UML Diagrams, SRS, User Scenarios and Mockups|[#946](https://github.com/bounswe/bounswe2022group2/issues/946)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Final Milestone: User Manual|[#951](https://github.com/bounswe/bounswe2022group2/issues/951)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Final Milestone: Individual Contributions Report of Egemen Atik|[#988](https://github.com/bounswe/bounswe2022group2/issues/988)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |**Milestone 2**|-|-|
  |Mobile: Implementing Information Section of Learning Space Detail Screen|[#524](https://github.com/bounswe/bounswe2022group2/issues/524)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Enhancement on Learning Space Detail Screen|[#616](https://github.com/bounswe/bounswe2022group2/issues/616)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Implementing Add/Edit Post Screen|[#618](https://github.com/bounswe/bounswe2022group2/issues/618)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Backend Connection For Taken Learning Spaces and Recommended Learning Spaces|[#634](https://github.com/bounswe/bounswe2022group2/issues/634)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Backend Connection For Add/Edit Post|[#645](https://github.com/bounswe/bounswe2022group2/issues/645)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Milestone-2 Report: Progress According To Requirements|[#705](https://github.com/bounswe/bounswe2022group2/issues/705)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Milestone-2 Report: Individual Report|[#706](https://github.com/bounswe/bounswe2022group2/issues/706)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |**Milestone 1**|-|-|
  |Update Personal Wiki Pages|[#324](https://github.com/bounswe/bounswe2022group2/issues/324)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Update Requirements Page|[#325](https://github.com/bounswe/bounswe2022group2/issues/325)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Revising the Requirements: Lecture Structure|[#341](https://github.com/bounswe/bounswe2022group2/issues/341)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Revising the Diagrams based on Lecture Structure|[#347](https://github.com/bounswe/bounswe2022group2/issues/347)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Implementing Verification Screen|[#395](https://github.com/bounswe/bounswe2022group2/issues/395)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Writing Tests for Verification Screen|[#417](https://github.com/bounswe/bounswe2022group2/issues/417)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Documenting Meeting Notes for the Meeting 4 of CMPE 451|[#425](https://github.com/bounswe/bounswe2022group2/issues/425)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Documenting Meeting Notes for the Meeting 2 of Mobile Team|[#427](https://github.com/bounswe/bounswe2022group2/issues/427)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Back-end Connection of Verification Screen|[#434](https://github.com/bounswe/bounswe2022group2/issues/434)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Writing Network Connection Tests for Verification Screen|[#454](https://github.com/bounswe/bounswe2022group2/issues/454)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Scrollable Horizontal Course List Widget For Home Screen|[#457](https://github.com/bounswe/bounswe2022group2/issues/457)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Milestone 1: Reviewing Our First Milestone: Against Objectives and Customer Presentation Parts|[#481](https://github.com/bounswe/bounswe2022group2/issues/481)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Milestone 1: Filling Individual Works and Responsibilities Parts of Group Review|[#483](https://github.com/bounswe/bounswe2022group2/issues/483)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |Mobile: Create event screen|[#869](https://github.com/bounswe/bounswe2022group2/pull/869)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Create event backend connection|[#880](https://github.com/bounswe/bounswe2022group2/pull/880)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Geolocation selection widget|[#897](https://github.com/bounswe/bounswe2022group2/pull/897)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Attend event backend connection|[#914](https://github.com/bounswe/bounswe2022group2/pull/914)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Home screen revision|[#917](https://github.com/bounswe/bounswe2022group2/pull/917)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Translate texts|[#920](https://github.com/bounswe/bounswe2022group2/pull/920)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Translate newly added words|[#926](https://github.com/bounswe/bounswe2022group2/pull/926)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Final milestone: Add software requirements specification, UML diagrams, user scenarios and mockups to report|[#947](https://github.com/bounswe/bounswe2022group2/pull/947)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Add user manual|[#984](https://github.com/bounswe/bounswe2022group2/pull/984)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |**Milestone 2**|-|-|
  |Mobile: Implementation of learning space information section|[#528](https://github.com/bounswe/bounswe2022group2/pull/528)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile/learning space detail enhancement|[#587](https://github.com/bounswe/bounswe2022group2/pull/587)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile/post add edit screen|[#623](https://github.com/bounswe/bounswe2022group2/pull/623)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile/taken recommended ls backend connection|[#642](https://github.com/bounswe/bounswe2022group2/pull/642)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile/backend connection add edit post|[#649](https://github.com/bounswe/bounswe2022group2/pull/649)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Fix overflow error in enroll button and form fields in ls create/edit…|[#667](https://github.com/bounswe/bounswe2022group2/pull/667)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Milestone-2: Egemen's individual report|[#709](https://github.com/bounswe/bounswe2022group2/pull/709)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Egemen's individual contribution table and report are added|[#721](https://github.com/bounswe/bounswe2022group2/pull/721)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Milestone-2 : Progress according to to requirements|[#733](https://github.com/bounswe/bounswe2022group2/pull/733)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Milestone-2: Mobile screens implemented by Egemen|[#738](https://github.com/bounswe/bounswe2022group2/pull/738)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |**Milestone 1**|-|-|
  |Mobile/verification screen|[#416](https://github.com/bounswe/bounswe2022group2/pull/416)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile/verification screen tests|[#432](https://github.com/bounswe/bounswe2022group2/pull/432)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Back-End Connection of Verification Screen|[#435](https://github.com/bounswe/bounswe2022group2/pull/435)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Verification screen network tests|[#455](https://github.com/bounswe/bounswe2022group2/pull/455)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Mobile: Scrollable horizontal course list widget for home screen|[#462](https://github.com/bounswe/bounswe2022group2/pull/462)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Add personal efforts of Egemen Atik|[#490](https://github.com/bounswe/bounswe2022group2/pull/490)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  |Add against objectives and customer presentation review parts|[#515](https://github.com/bounswe/bounswe2022group2/pull/515)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)|
  
* **Ezgi Aysel Batı**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |Mobile: Add Comments to a Post | [#821](https://github.com/bounswe/bounswe2022group2/issues/821) | 6 hr |
  |Documenting Meeting Notes for the Meeting 7 of CMPE 451| [#698](https://github.com/bounswe/bounswe2022group2/issues/698) | 30 min |
  |Mobile: View All Comments| [#885](https://github.com/bounswe/bounswe2022group2/issues/885)| 2 hr|
  |Final Milestone: User Interface / User Experience|[#962](https://github.com/bounswe/bounswe2022group2/issues/962)|1.5 hr|
  |Final Milestone: System Manual|[#961](https://github.com/bounswe/bounswe2022group2/issues/961)| 15 min |
  |**Milestone 2**|-|-|
  |Mobile: Implementing Create/Edit Learning Space Screen|[#510](https://github.com/bounswe/bounswe2022group2/issues/510)| 6 hr | 
  |Mobile: Implementing Annotation Screen|[#560](https://github.com/bounswe/bounswe2022group2/issues/560)| 2.5 hr |  
  |Mobile: Backend Connection of Create Learning Space|[#570](https://github.com/bounswe/bounswe2022group2/issues/570)| 2 hr |  
  |Mobile: Get Categories from Backend|[#586](https://github.com/bounswe/bounswe2022group2/issues/586)| 1 hr |  
  |Mobile: Forum/Discussion Screen|[#620](https://github.com/bounswe/bounswe2022group2/issues/620)| 1 hr | 
  |Mobile: Icon Selector for Create LS Screen|[#639](https://github.com/bounswe/bounswe2022group2/issues/639)| 4.5 hr |
  |Requirements Revision|[#678](https://github.com/bounswe/bounswe2022group2/issues/678)| 2 hr |
  |**Milestone 1**|-|-|
  |Mobile Team: Setting up development Environment #372|[Issue](https://github.com/bounswe/bounswe2022group2/issues/372)| 45 min |
  |Mobile: Implementing Forget Password Screen #375|[Issue](https://github.com/bounswe/bounswe2022group2/issues/375)| 4 hr |
  |Mobile: Writing Tests for Forget Password Screen #383|[Issue](https://github.com/bounswe/bounswe2022group2/issues/383)| 1 hr |
  |Mobile: Back-end Connection of Forget Password/Verify Email Endpoint #384|[Issue](https://github.com/bounswe/bounswe2022group2/issues/384)| 1 hr|
  |Mobile: Custom Widget For Course Preview #408|[Issue](https://github.com/bounswe/bounswe2022group2/issues/408)| 5 hr|
  |Revising the Requirements: User-Lecture Interaction #330|[Issue](https://github.com/bounswe/bounswe2022group2/issues/330)| 1 hr|
  |Updating ReadMe #317|[Issue](https://github.com/bounswe/bounswe2022group2/issues/317)| 20 min |
  |Revising the Diagrams based on User - Lecture Interaction #343|[Issue](https://github.com/bounswe/bounswe2022group2/issues/343)| 20 min |
  |Writing System Manual For Mobile #407|[Issue](https://github.com/bounswe/bounswe2022group2/issues/407)| 20 min |
  
  |Pull Request Title|Link|
  |-----|:--------:|
  |**Final Milestone 3**|-|
  |Mobile: post comments |https://github.com/bounswe/bounswe2022group2/pull/826|
  |hotfix - fix profile username |https://github.com/bounswe/bounswe2022group2/pull/930|
  |**Milestone 2**|-|
  |Mobile: create edit Learning Space screen|[#565](https://github.com/bounswe/bounswe2022group2/pull/565)|  
  |Mobile/create ls backend | [#585](https://github.com/bounswe/bounswe2022group2/pull/585)|  
  |Mobile: Annotation Screen - 560 | [#613](https://github.com/bounswe/bounswe2022group2/pull/613)|
  |Mobile: LS Forum | [#622](https://github.com/bounswe/bounswe2022group2/pull/622)|  
  |Mobile: create ls image selection | [#640](https://github.com/bounswe/bounswe2022group2/pull/640) |
  |**Milestone 1**|-|
  |Mobile/forget password screen|[#382](https://github.com/bounswe/bounswe2022group2/pull/382)|
  |Mobile: course preview widget |[#430](https://github.com/bounswe/bounswe2022group2/pull/430)|
  |Mobile: forget password backend|[#433](https://github.com/bounswe/bounswe2022group2/pull/433)|
  |Mobile: implement tests for forget password|[#442](https://github.com/bounswe/bounswe2022group2/pull/442)|

* **Batuhan Çelik**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |-----|:--------:|:--------:|
  |Learning space recomendation endpoint|[888](https://github.com/bounswe/bounswe2022group2/issues/888)|2 hours|
  |Event Participation functionality for backend|[828](https://github.com/bounswe/bounswe2022group2/issues/828)|1 hours|
  |Implementation of profile page for backend|[797](https://github.com/bounswe/bounswe2022group2/issues/797)|3 hours|
  |Event Enpoints implementation|[780](https://github.com/bounswe/bounswe2022group2/issues/780)|4 hours|
  |**Milestone 2**|-|-|
  |POST /learningspace endpint implementation|[532](https://github.com/bounswe/bounswe2022group2/issues/532)|4 hours|
  |GET /categories endpoint implementation|[551](https://github.com/bounswe/bounswe2022group2/issues/551)|2 hours|
  |Semantic search implementation for backend|[566](https://github.com/bounswe/bounswe2022group2/issues/566)|30 hours|
  |Getters for the learningspace|[574](https://github.com/bounswe/bounswe2022group2/issues/574)|2 hours|
  |Getters for learningspaces : random ls getter for main page.|[615](https://github.com/bounswe/bounswe2022group2/issues/615)|1 hour|
  |GET learning spaces using user information|[619](https://github.com/bounswe/bounswe2022group2/issues/619)|2 hours|
  |**Milestone 1**|-|-|
  |Documentation of meeting notes 1 of CMPE451 #309|[Issue](https://github.com/bounswe/bounswe2022group2/issues/309)|1 hours|
  |Update Project plan for upcoming semester #316|[Issue](https://github.com/bounswe/bounswe2022group2/issues/316)|4 hours|
  |Revising non functional requirements #339|[Issue](https://github.com/bounswe/bounswe2022group2/issues/339)|1 hour|
  |Backend: Initialization of backend project #351|[Issue](https://github.com/bounswe/bounswe2022group2/issues/351)|1 hour|
  |Backend: Dockerization of the API #355|[Issue](https://github.com/bounswe/bounswe2022group2/issues/355)|1 hour|
  |Backend: Sign up endpoint #365|[Issue](https://github.com/bounswe/bounswe2022group2/issues/365)|3 hours|
  |Backend: AWS deployment of backend #423|[Issue](https://github.com/bounswe/bounswe2022group2/issues/423)|1 hour|
  |Backend: GET /courses(mock endpoint) #437|[Issue](https://github.com/bounswe/bounswe2022group2/issues/437)|1 hour|
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |-----|:--------:|:-----:|
  |learning space recommendation endpoint|[889](https://github.com/bounswe/bounswe2022group2/issues/889)|2 hours|
  |Revision of tests : POST /auth/signup , POST /learningspace, POST /events, POST /events/participate/:eventId|[878](https://github.com/bounswe/bounswe2022group2/issues/878)|5 hours|
  |Event participation functionality for backend|[829](https://github.com/bounswe/bounswe2022group2/issues/829)|1 hours|
  |implementation of profile page for the backend|[820](https://github.com/bounswe/bounswe2022group2/issues/820)|3 hours|
  |Event endpoints implementation: Create event and getters|[794](https://github.com/bounswe/bounswe2022group2/issues/794)|3 hours|
  |**Milestone 2**|-|-|
  |POST /learningspace implementation|[540](https://github.com/bounswe/bounswe2022group2/issues/540)|4 hours|
  |get categories endpoint implementation and categories logic in learning spaces|[556](https://github.com/bounswe/bounswe2022group2/issues/556)|4 hours|
  |Semantic search implementation for backend|[573](https://github.com/bounswe/bounswe2022group2/issues/573)|30 hours|
  |Getters for the learning spaces|[575](https://github.com/bounswe/bounswe2022group2/issues/575)|2 hours|
  |615 getters for learningspaces: get most participated learning spaces if a query is not given|[617](https://github.com/bounswe/bounswe2022group2/issues/617)|1 hours|
  |GET endpoints regarding user and learningspace relation|[621](https://github.com/bounswe/bounswe2022group2/issues/621)|2 hours|
  |Milestone 2: Merge dev to master(Getting release)|[670](https://github.com/bounswe/bounswe2022group2/issues/670)|1 hour|
  |**Milestone 1**|-|-|
  |351 initialization of the backend project |[#352](https://github.com/bounswe/bounswe2022group2/pull/352)|1 hour|
  |365 sign up endpoint |[#366](https://github.com/bounswe/bounswe2022group2/pull/366) [#391](https://github.com/bounswe/bounswe2022group2/pull/391)|[#428](https://github.com/bounswe/bounswe2022group2/pull/428)|3 hours|
  |355 dockerization of the api |[#367](https://github.com/bounswe/bounswe2022group2/pull/367)|1 hour|
  |hotfix: usermodel update|[#436](https://github.com/bounswe/bounswe2022group2/pull/436)|30 minutes|
  |return mock course data|[#443](https://github.com/bounswe/bounswe2022group2/pull/443)|1 hour|
  |create readme.md for learnify folder with setup instructions|[#472](https://github.com/bounswe/bounswe2022group2/pull/472)|1 hour|
  |adding AWS, Docker, Gmail and NodeJS to tools evaluation|[#488](https://github.com/bounswe/bounswe2022group2/pull/488)|1.5 hours|
  |GET /courses|[#437](https://github.com/bounswe/bounswe2022group2/pull/437)|1 hour|
  
* **Hasan Can Erol**
  |Issue Title|Link|Time Consumption|
  |--------------|--------|--------|
  |**Final Milestone 3**|-|-|
  |Backend: Put edit comment endpoint|[#862](https://github.com/bounswe/bounswe2022group2/issues/862)|2h|
  |Backend: Comment on Posts Endpoint and Unit Tests|[#779](https://github.com/bounswe/bounswe2022group2/issues/779)|8h|
  |Documenting meting notes of Meeting 8 for CMPE451|[#759](https://github.com/bounswe/bounswe2022group2/issues/759)|30m|
  |Final Milestone: Individual Contributions Report for Hasan Can Erol|[#963](https://github.com/bounswe/bounswe2022group2/issues/963)|1h|
  |Final Milestone: Summary of Work Table for Hasan Can Erol|[#964](https://github.com/bounswe/bounswe2022group2/issues/964)|1h|
  |--------------|--------|--------|
  |**Milestone 2**| - | - |
  |Milestone-2 Report: Executive Summary|[#704](https://github.com/bounswe/bounswe2022group2/issues/704)|-|
  |--------------|--------|--------|
  |**Milestone 1**| - | - |
  |Backend: Implementation of Resend Email Verification|[#406](https://github.com/bounswe/bounswe2022group2/issues/406)|-|
  |Revising the Requirements: Profile Page|[#345](https://github.com/bounswe/bounswe2022group2/issues/345)|-|
  |Revisions About All the Diagrams|[#322](https://github.com/bounswe/bounswe2022group2/issues/322)|-|
  |Reviewing the Updating Communication Plan|[#315](https://github.com/bounswe/bounswe2022group2/issues/315)|-|
  |Reviewing the Revising the Requirements: Chat to forum Transformation|[#344](https://github.com/bounswe/bounswe2022group2/issues/344)|-|
  
  |Pull Request Title|Link|Time Consumption|
  |--------------|--------|--------|
  |**Milestone 3**| - | - |
  |Backend: Edit comment endpoint |[#863](https://github.com/bounswe/bounswe2022group2/pull/863)| 2h |
  |Create comment endpoint minor bugfix|[#849](https://github.com/bounswe/bounswe2022group2/pull/849)| 15m |
  |Backend: Create Comment endpoint and Unit Tests|[#784](https://github.com/bounswe/bounswe2022group2/pull/784)| 8h |
  |--------------|--------|--------|
  |**Milestone 2**| - | - |
  |Executive Summary|[#703](https://github.com/bounswe/bounswe2022group2/pull/703)|-|
  |--------------|--------|--------|
  |**Milestone 1**| - | - |
  |Backend: Implementing Resend The Verification Code|[#411](https://github.com/bounswe/bounswe2022group2/pull/411)|-|
  |Adding Moving Forward|[#512](https://github.com/bounswe/bounswe2022group2/pull/512)|-|
  
* **Onur Kömürcü:**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |Mobile: Documenting Meeting Notes #6|[#774](https://github.com/bounswe/bounswe2022group2/issues/774)|40 minutes|
  |Mobile: Updating My Profile Page|[#775](https://github.com/bounswe/bounswe2022group2/issues/775)|7 hours|
  |Mobile: Implementing Other User's Profile Page|[#776](https://github.com/bounswe/bounswe2022group2/issues/776)|1h 30m|
  |Mobile: User Search Backend Connection|[#866](https://github.com/bounswe/bounswe2022group2/issues/866)|2 hours|
  |Mobile: Get and Update My Profile Backend Connection|[#867](https://github.com/bounswe/bounswe2022group2/issues/867)|10 hours|
  |Mobile: Get Other Users Profile Backend Connection|[#868](https://github.com/bounswe/bounswe2022group2/issues/868)|3 hours|
  |Final Milestone: Project Plan|[#956](https://github.com/bounswe/bounswe2022group2/issues/956)|30 minutes|
  |Final Milestone: Mobile App Scenario|[#957](https://github.com/bounswe/bounswe2022group2/issues/957)|1h 40m|
  |Final Milestone: Summary of Work Table for Onur Kömürcü|[#958](https://github.com/bounswe/bounswe2022group2/issues/958)|2 hours|
  |Final Milestone: Individual Contributions Report for Onur Kömürcü|[#959](https://github.com/bounswe/bounswe2022group2/issues/959)|2 hours|
  |--------------|--------------|--------------|
  |**Milestone 2**|-|-|
  |Mobile: Implementing Search Page|[#567](https://github.com/bounswe/bounswe2022group2/issues/567)|20 hours|
  |Mobile: Implementing Learnifies Page|[#568](https://github.com/bounswe/bounswe2022group2/issues/568)|4 hours|
  |Mobile: Backend Connection for Search Page|[#584](https://github.com/bounswe/bounswe2022group2/issues/584)|5 hours|
  |Mobile: Implementing User Preview Widget|[#593](https://github.com/bounswe/bounswe2022group2/issues/593)|2 hours|
  |Mobile: Static User Search Implementation and Additional Improvements|[#635](https://github.com/bounswe/bounswe2022group2/issues/635)|7 hours|
  |Mobile: Tests for ViewAllScreen and TakenLsScreen|[#646](https://github.com/bounswe/bounswe2022group2/issues/646)|1h 30m|
  |Documenting Meeting Notes of Meeting #5 of the Mobile Team|[#527](https://github.com/bounswe/bounswe2022group2/issues/527)|40 minutes|
  |Milestone-2 Report: Updating Project Plan|[#690](https://github.com/bounswe/bounswe2022group2/issues/690)|1 hour|
  |Milestone-2: Individual Report|[#714](https://github.com/bounswe/bounswe2022group2/issues/690)|1h 30m|
  |Milestone 2: Fill User Interface Part for Mobile|[#710](https://github.com/bounswe/bounswe2022group2/issues/710)|50 minutes|
  |--------------|--------------|--------------|
  |**Milestone 1**|-|-|
  |Mobile Team: Setting up development Environment|[#372](https://github.com/bounswe/bounswe2022group2/issues/372)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Onur-Kömürcü)|
  |Mobile - Implementing Login Page Including Backend Connection|[#396](https://github.com/bounswe/bounswe2022group2/issues/396)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Onur-Kömürcü)|
  |Mobile: Writing Tests for Login Page|[#447](https://github.com/bounswe/bounswe2022group2/issues/447)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Onur-Kömürcü)|
  |Revising the Requirements Specification|[#323](https://github.com/bounswe/bounswe2022group2/issues/323)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Onur-Kömürcü)|
  |Update the Project plan for upcoming semester|[#316](https://github.com/bounswe/bounswe2022group2/issues/316)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Onur-Kömürcü)|
  |Milestone 1: Project Plan|[#448](https://github.com/bounswe/bounswe2022group2/issues/448)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Onur-Kömürcü)|
  |Milestone 1: Evaluation of the Status of Deliverables|[#491](https://github.com/bounswe/bounswe2022group2/issues/491)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Onur-Kömürcü)|
  |Updating Communication Plan|[#377](https://github.com/bounswe/bounswe2022group2/issues/377)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Onur-Kömürcü)|
  |Revising the Diagrams based on Achievements|[#346](https://github.com/bounswe/bounswe2022group2/issues/346)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Onur-Kömürcü)|
  |Revising the Requirements: Achievements and Badges|[#333](https://github.com/bounswe/bounswe2022group2/issues/333)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Onur-Kömürcü)|
  |Revising Mockups|[#326](https://github.com/bounswe/bounswe2022group2/issues/326)|[in personal wiki page](https://github.com/bounswe/bounswe2022group2/wiki/Onur-Kömürcü)|

  Note: I didn't include time tracking in PR's because issues covers all PR's.
  |Pull Request Title|Link|
  |-----|:--------:|
  |**Final Milestone 3**|-|
  |Mobile: My Profile Screen Update|[#783](https://github.com/bounswe/bounswe2022group2/issues/783)|
  |Mobile: User search backend connection|[#890](https://github.com/bounswe/bounswe2022group2/issues/890)|
  |Mobile: My profile backend connection|[#915](https://github.com/bounswe/bounswe2022group2/issues/915)|
  |Mobile: Other users profile page and backend connection|[#921](https://github.com/bounswe/bounswe2022group2/issues/921)|
  |Mobile: Profile Update Major BugFix|[#923](https://github.com/bounswe/bounswe2022group2/issues/923)|
  |Final Milestone: Project Plan|[#983](https://github.com/bounswe/bounswe2022group2/issues/983)|30 minutes|
  |Final Milestone: Mobile App Scenario|[#957](https://github.com/bounswe/bounswe2022group2/issues/957)|
  |Final Milestone: Summary of Work Table for Onur Kömürcü|[#966](https://github.com/bounswe/bounswe2022group2/issues/966)|
  |Final Milestone: Individual Contributions Report for Onur Kömürcü|[#982](https://github.com/bounswe/bounswe2022group2/issues/982)|
  |--------------|--------------|
  |**Milestone 2**|-|
  |Mobile: Implementing View All Screen|[#557](https://github.com/bounswe/bounswe2022group2/issues/557)|
  |Mobile: Implementing Spaces Page|[#569](https://github.com/bounswe/bounswe2022group2/issues/569)|
  |Mobile: Implemented Search Screen with Backend Connection|[#632](https://github.com/bounswe/bounswe2022group2/issues/632)|
  |Mobile: User Preview Widget|[#638](https://github.com/bounswe/bounswe2022group2/issues/638)|
  |Mobile: Static User Search and Recommended LS in Search Implemented|[#644](https://github.com/bounswe/bounswe2022group2/issues/644)|
  |Mobile: Tests for Pages Which Use View All List|[#647](https://github.com/bounswe/bounswe2022group2/issues/647)|
  |Milestone-2: Contribution report - Onur|[#725](https://github.com/bounswe/bounswe2022group2/issues/725)|
  |Milestone-2: Summary of work - Onur|[#731](https://github.com/bounswe/bounswe2022group2/issues/731)|
  |Milestone-2: Mobile User Interface - Onur|[#737](https://github.com/bounswe/bounswe2022group2/issues/737)|
  |--------------|--------------|
  |**Milestone 1**|-|
  |Mobile: Implementation of Login Screen Including Backend Connection|[#398](https://github.com/bounswe/bounswe2022group2/pull/398)|
  |Evaluation of the Status of Deliverables|[#509](https://github.com/bounswe/bounswe2022group2/pull/509)|
  |Milestone 1: Adding Personal Efforts of Onur Kömürcü|[#494](https://github.com/bounswe/bounswe2022group2/pull/494)|
  
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
  |**Final Milestone 3**|-|-|
  |Final Milestone: Individual Contributions Report for Enes Sürmeli|[#948](https://github.com/bounswe/bounswe2022group2/issues/948)|3 hours|-|
  |Final Milestone: Summary of Work Table for Enes Sürmeli|[#949](https://github.com/bounswe/bounswe2022group2/issues/949)|1 hour and 45 minutes|-|
  |Final Milestone Report: List and Status of Deliverables|[#950](https://github.com/bounswe/bounswe2022group2/issues/950)|2 hours and 30 minutes|-|
  |Preparing Milestone 3 - CMPE 451 Final Deliverables|[#934](https://github.com/bounswe/bounswe2022group2/issues/934)|3 hours and 30 minutes|-|
  |Frontend: Unit Tests for Event Component of Learning Space|[#912](https://github.com/bounswe/bounswe2022group2/issues/912)|1 hour and 45 minutes|-|
  |Frontend: Backend Connection for Joining Events on Learning Space Page|[#907](https://github.com/bounswe/bounswe2022group2/issues/907)|2 hours and 15 minutes|-|
  |Frontend: Unit Tests for Comment Component of Learning Space Posts|[#894](https://github.com/bounswe/bounswe2022group2/issues/894)|2 hours|-|
  |Frontend: Unit Tests for About Page|[#886](https://github.com/bounswe/bounswe2022group2/issues/886)|2 hours|-|
  |Frontend: Backend Connection for Editing Comments of Learning Space Posts|[#882](https://github.com/bounswe/bounswe2022group2/issues/882)|2 hours and 30 minutes|-|
  |Frontend: Backend Connection for Upvote and Downvote Functionality for Posts and Comments|[#874](https://github.com/bounswe/bounswe2022group2/issues/874)|3 hours|-|
  |Frontend: Backend Connection for Getting Events on Learning Space Page|[#858](https://github.com/bounswe/bounswe2022group2/issues/858)|3 hours|-|
  |Frontend: Backend Connection For Create and Get Comment|[#852](https://github.com/bounswe/bounswe2022group2/issues/852)|2 hours and 30 minutes|-|
  |Frontend: Creating Event Component for Learning Space Page|[#847](https://github.com/bounswe/bounswe2022group2/issues/847)|5 hours|-|
  |Frontend: Implementation of About Page|[#814](https://github.com/bounswe/bounswe2022group2/issues/814)|4 hours|-|
  |Frontend: Create Comment Component for Learning Space Posts|[#798](https://github.com/bounswe/bounswe2022group2/issues/798)|4 hours and 30 minutes|-|
  |--------------|-|--------------|
  |**Milestone 2**|-|-|
  |Milestone 2: Individual Report - Muhammed Enes Sürmeli|[#727](https://github.com/bounswe/bounswe2022group2/issues/727)|3 hours|-|
  |Milestone-2 Report: List and Status of Deliverables|[#724](https://github.com/bounswe/bounswe2022group2/issues/724)|2 hours|-|
  |Preparing Milestone 2 - CMPE 451 Deliverables|[#668](https://github.com/bounswe/bounswe2022group2/issues/668)|3 hours and 30 minutes|-|
  |Frontend: Implementation of Not Found Page|[#520](https://github.com/bounswe/bounswe2022group2/issues/520)|6 hours|-|
  |Frontend: Implementation of Private Routes|[#521](https://github.com/bounswe/bounswe2022group2/issues/521)|5 hours|-|
  |Frontend: Implementation of Components on Learning Space Page|[#549](https://github.com/bounswe/bounswe2022group2/issues/549)|2 hours and 15 minutes|-|
  |Frontend: Implementation of onClick Button Rendering|[#630](https://github.com/bounswe/bounswe2022group2/issues/630)|2 hours|-|
  |Frontend: Backend Connection for the Create Post Part of Learning Space Page|[#641](https://github.com/bounswe/bounswe2022group2/issues/641)|5 hours and 45 minutes|-|
  |Frontend: Implementation of the Text Annotation|[#650](https://github.com/bounswe/bounswe2022group2/issues/650)|5 hours|-|
  |Frontend: Implementation of the Image Annotation|[#651](https://github.com/bounswe/bounswe2022group2/issues/651)|6 hours and 30 minutes|-|
  |Frontend: Implementation of Edit Post Feature|[#659](https://github.com/bounswe/bounswe2022group2/issues/659)|4 hours and 15 minutes|-|
  |Frontend: Backend Connection For Edit Post|[#660](https://github.com/bounswe/bounswe2022group2/issues/660)|1 hour|-|
  |Frontend: Unit Tests for Not Found Page|[#681](https://github.com/bounswe/bounswe2022group2/issues/681)|1 hour|-|
  |Frontend: Unit Tests for Email Verification Page|[#453](https://github.com/bounswe/bounswe2022group2/issues/453)|1 hour and 15 minutes|-|
  |Milestone 1: Reviewing the Milestone - What Went Well and What Did Not Go Well Parts|[#492](https://github.com/bounswe/bounswe2022group2/issues/492)|4 hours|-|
  |Documenting the Meeting Notes for the Frontend Meeting 4|[#548](https://github.com/bounswe/bounswe2022group2/issues/548)|3 hours and 30 minutes|-|
  |Documenting Meeting Notes for the Meeting 6 of CMPE 451|[#535](https://github.com/bounswe/bounswe2022group2/issues/535)|2 hours and 30 minutes|-|
  |Milestone-2: User Interfaces for Web Application|[#723](https://github.com/bounswe/bounswe2022group2/issues/723)|30 minutes|-|
  |--------------|-|--------------|
  |**Milestone 1**|-|-|
  |Frontend: Implementation of Email Verification Page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/385)|5 hours|
  |Frontend: Adding Form Validation for Email Verification Page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/429)|1 hour|
  |Frontend: Backend Connection for the Email Verification Page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/449)|1 hour|
  |Frontend: Unit Tests for Email Verification Page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/453)|1 hour and 15 minutes|
  |Revising the Requirements Specification|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/323)|30 minutes|
  |Conducting Research on React Router|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/386)|2 hours and 15 minutes|
  |Revising the Requirements Specification: Notifications|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/329)|2 hours and 30 minutes|
  |Revisions About All the Diagrams|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/422)|45 minutes|
  |Updating Communication Plan|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/315)|30 minutes|
  |Research & Report for Frontend Technologies (Frontend Team)|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/327)|1 hour|
  |Revising Mockups|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/326)|30 minutes|
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |Final Milestone: Individual Contributions Report for Enes Sürmeli|[#989](https://github.com/bounswe/bounswe2022group2/issues/989)|3 hours|-|
  |Final Milestone: Summary of Work Table for Enes Sürmeli|[#990](https://github.com/bounswe/bounswe2022group2/issues/990)|1 hour and 45 minutes|-|
  |Final Milestone Report: List and Status of Deliverables|[#950](https://github.com/bounswe/bounswe2022group2/issues/976)|2 hours and 30 minutes|-|
  |Milestone 3: Preparing Final Deliverables|[#935](https://github.com/bounswe/bounswe2022group2/issues/935)|3 hours and 30 minutes|-|
  |Dev to Master|[#932](https://github.com/bounswe/bounswe2022group2/issues/932)|30 minutes|-|
  |Frontend: Unit Tests for Event Component of Learning Space|[#913](https://github.com/bounswe/bounswe2022group2/issues/913)|1 hour and 45 minutes|-|
  |Frontend: Backend Connection for Joining Events on Learning Space Page|[#908](https://github.com/bounswe/bounswe2022group2/issues/908)|2 hours and 15 minutes|-|
  |Frontend: Unit Tests for Comment Component of Learning Space Posts|[#895](https://github.com/bounswe/bounswe2022group2/issues/895)|2 hours|-|
  |Frontend: Unit Tests for About Page|[#891](https://github.com/bounswe/bounswe2022group2/issues/891)|2 hours|-|
  |Frontend: Backend Connection for Editing Comments of Learning Space Posts|[#883](https://github.com/bounswe/bounswe2022group2/issues/883)|2 hours and 30 minutes|-|
  |Frontend: Fixing the Footer Navigation|[#876](https://github.com/bounswe/bounswe2022group2/issues/876)|1 hour and 30 minutes|-|
  |Frontend: Backend Connection for Upvote and Downvote Functionality for Posts and Comments|[#875](https://github.com/bounswe/bounswe2022group2/issues/875)|3 hours|-|
  |Frontend: Backend Connection for Getting Events on Learning Space Page|[#859](https://github.com/bounswe/bounswe2022group2/issues/859)|3 hours|-|
  |Frontend: Backend Connection For Create and Get Comment|[#853](https://github.com/bounswe/bounswe2022group2/issues/853)|2 hours and 30 minutes|-|
  |Frontend: Creating Event Component for Learning Space Page|[#848](https://github.com/bounswe/bounswe2022group2/issues/848)|5 hours|-|
  |Frontend: Implementation of About Page|[#815](https://github.com/bounswe/bounswe2022group2/issues/815)|4 hours|-|
  |Frontend: Create Comment Component for Learning Space Posts|[#799](https://github.com/bounswe/bounswe2022group2/issues/799)|4 hours and 30 minutes|-|
  |--------------|-|--------------|
  |**Milestone 2**|-|-|
  |Milestone 2: Individual Report - Muhammed Enes Sürmeli|[#719](https://github.com/bounswe/bounswe2022group2/issues/719)|3 hours and 15 minutes|-|
  |Milestone-2 Report: List and Status of Deliverables|[#718](https://github.com/bounswe/bounswe2022group2/issues/718)|2 hours|-|
  |Milestone 2: Preparing Deliverables and Group Review|[#672](https://github.com/bounswe/bounswe2022group2/issues/672)|3 hours and 30 minutes|-|
  |Frontend: Implementation For Edit Post Feature|[#661](https://github.com/bounswe/bounswe2022group2/issues/661)|4 hours and 15 minutes|-|
  |Frontend: Backend Connection for the Edit Post Part|[#661](https://github.com/bounswe/bounswe2022group2/issues/661)|1 hour|-|
  |Frontend: Implementation of Private Routes|[#523](https://github.com/bounswe/bounswe2022group2/issues/523)|5 hours|-|
  |Frontend: Implementation of Not Found Page|[#525](https://github.com/bounswe/bounswe2022group2/issues/525)|6 hours|-|
  |Frontend: Implementation of Components on Learning Space Page|[#629](https://github.com/bounswe/bounswe2022group2/issues/629)|2 hours and 15 minutes|-|
  |Frontend: Implementation of onClick Button Rendering|[#631](https://github.com/bounswe/bounswe2022group2/issues/631)|2 hours|-|
  |Frontend: Create Post Feature of Learning Space Page|[#643](https://github.com/bounswe/bounswe2022group2/issues/643)|3 hours|-|
  |Frontend: Backend Connection for the Create Post Part of Learning Space Page|[#643](https://github.com/bounswe/bounswe2022group2/issues/643)|2 hours and 45 minutes|-|
  |Frontend: Implementation of the Text Annotation|[#658](https://github.com/bounswe/bounswe2022group2/issues/658)|5 hours|-|
  |Frontend: Implementation of the Image Annotation|[#658](https://github.com/bounswe/bounswe2022group2/issues/658)|6 hours and 30 minutes|-|
  |Milestone 1: What Went Well, What Did Not Go Well, and Individual Contribution Parts|[#508](https://github.com/bounswe/bounswe2022group2/issues/508)|4 hours|-|
  |Frontend: Unit Tests for Email Verification Page|[#458](https://github.com/bounswe/bounswe2022group2/issues/458)|1 hour and 15 minutes|-|
  |Frontend: Unit Tests for Not Found Page|[#683](https://github.com/bounswe/bounswe2022group2/issues/683)|1 hour|-|
  |Milestone-2: Web Application's UI Designs - Enes|[#744](https://github.com/bounswe/bounswe2022group2/issues/744)|30 minutes|-|
  |Updating the Dev Branch|[#684](https://github.com/bounswe/bounswe2022group2/issues/684)|15 minutes|-|
  |--------------|-|--------------|
  |**Milestone 1**|-|-|
  |Frontend: Email Verification Page Implementation |[#392](https://github.com/bounswe/bounswe2022group2/pull/392)|5 hours|
  |Frontend: Email Verification Form Validation |[#431](https://github.com/bounswe/bounswe2022group2/pull/431)|1 hour|
  |Frontend: Backend Connection for Email Verification Page |[#450](https://github.com/bounswe/bounswe2022group2/pull/450)|1 hour|
  |Frontend: Unit Tests for Email Verification Page |[#453](https://github.com/bounswe/bounswe2022group2/pull/453)|1 hour and 15 minutes|
  
* **Koray Tekin**
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |Frontend: Implementation of Profile Page General Issue| [#771](https://github.com/bounswe/bounswe2022group2/issues/771)|12 hours|
  |Frontend: Implementation of Profile Page Initial Layout|[#778](https://github.com/bounswe/bounswe2022group2/issues/778)|2.5 hours|
  |Frontend: Implementation of Contact Page|[#822](https://github.com/bounswe/bounswe2022group2/issues/822)|5 hours|
  |Frontend: Implementation of Profile Page User Name Component|[#836](https://github.com/bounswe/bounswe2022group2/issues/836)|2 hours|
  |Frontend: Implementation of Participated LS Component and Backend Connection|[#851](https://github.com/bounswe/bounswe2022group2/issues/851)|4 hours|
  |Frontend: Profile Page Design, Renamings and Component Refinements |[#856](https://github.com/bounswe/bounswe2022group2/issues/856)|1.5 hours|
  |Frontend: Profile Page Edit Functionality|[#877](https://github.com/bounswe/bounswe2022group2/issues/877)|2 hours|
  |Frontend: Contact Page Unit Tests|[#893](https://github.com/bounswe/bounswe2022group2/issues/893)|1 hour|
  |Frontend: Participated LS's Component Unit Tests|[#898](https://github.com/bounswe/bounswe2022group2/issues/898)|1 hour|
  |Frontend: UI/UX section for final milestone|[#975](https://github.com/bounswe/bounswe2022group2/issues/975)|1 hour|
  |Final Milestone: Individual Contributions Report of Koray Tekin|[#981](https://github.com/bounswe/bounswe2022group2/issues/981)|3 hours|
  |--------------|-------------|--------------|
  |**Milestone 2**|-|-|
  |Frontend: Implementation of Static Navigation Bar| [#533](https://github.com/bounswe/bounswe2022group2/issues/533)|10 hours|
  |Frontend: Implementation of Learning Space page layout and initial components|[#541](https://github.com/bounswe/bounswe2022group2/issues/541)|10 hours|
  |Frontend: Implementation of back-end connection and dynamic modularization of the Learning Space|[#624](https://github.com/bounswe/bounswe2022group2/issues/624)|2 hours|
  |Frontend: Implementation of participants component of LS and providing the back-end connection|[#648](https://github.com/bounswe/bounswe2022group2/issues/648)|2 hours|
  |Frontend: Unit Tests for Footer Component|[#686](https://github.com/bounswe/bounswe2022group2/issues/686)|1 hour|
  |Frontend: Reserach on initializing the Annotation Implementation|[#526](https://github.com/bounswe/bounswe2022group2/issues/526)|2 hours|
  |Requirements Revision|[#678](https://github.com/bounswe/bounswe2022group2/issues/678)|2 hours|
  |--------------|-------------|--------------|
  |**Milestone 1**|-|-|
  |Frontend: Implementation of LoginForm #390|[Issue](https://github.com/bounswe/bounswe2022group2/issues/390)| - |
  |Frontend: Adding Form Validation and Back-end connection for LoginForm #441|[Issue](https://github.com/bounswe/bounswe2022group2/issues/441)| - |
  |Frontend: Unit Tests Implementation for LoginForm #460|[Issue](https://github.com/bounswe/bounswe2022group2/issues/466)| - |
  |Adding my personal wiki page #312|[Issue](https://github.com/bounswe/bounswe2022group2/issues/312)| - |
  |Discovery and on-boarding for new members #320|[Issue](https://github.com/bounswe/bounswe2022group2/issues/320)| - |
  |Revising the Requirements and the Diagrams related to conversion of chat/forum #344|[Issue](https://github.com/bounswe/bounswe2022group2/issues/344)| - |
  |Documentation of meeting notes of first meeting(front-end team) #388|[Issue](https://github.com/bounswe/bounswe2022group2/issues/388)| - |
  |Research & Report for Frontend Technologies (Frontend Team) #327|[Issue](https://github.com/bounswe/bounswe2022group2/issues/327)| - |
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |Frontend: Dev frontend profile page initial layout| [#789](https://github.com/bounswe/bounswe2022group2/pull/789)|2.5 hours|
  |Frontend: Dev frontend contact page| [#832](https://github.com/bounswe/bounswe2022group2/pull/832)|5 hours|
  |Frontend: Dev frontend user name component| [#838](https://github.com/bounswe/bounswe2022group2/pull/838)|2 hours|
  |Frontend: Dev frontend profile page ls component| [#854](https://github.com/bounswe/bounswe2022group2/pull/854)|4 hours|
  |Frontend: Dev frontend update profile| [#857](https://github.com/bounswe/bounswe2022group2/pull/857)|1.5 hours|
  |Frontend: Dev frontend profile page general development| [#861](https://github.com/bounswe/bounswe2022group2/pull/861)|12 hours|
  |Frontend: Dev frontend profile page edit| [#879](https://github.com/bounswe/bounswe2022group2/pull/879)|2 hours|
  |Frontend: Dev frontend contact page unit test| [#896](https://github.com/bounswe/bounswe2022group2/pull/896)|1 hour|
  |Frontend: Dev frontend participated ls profile component unit tests| [#899](https://github.com/bounswe/bounswe2022group2/pull/899)|1 hour|
  |Frontend: Merge of Frontend Development to general Development| [#927](https://github.com/bounswe/bounswe2022group2/pull/927)|1 hour|
  |Frontend: UI/UX additions final milestone| [#979](https://github.com/bounswe/bounswe2022group2/pull/979)|1 hour|
  |--------------|--------------|--------------|
  |**Milestone 2**|-|-|
  |Frontend: Implementation of Static Navigation Bar| [#534](https://github.com/bounswe/bounswe2022group2/pull/534)|10 hours|
  |Frontend: Implementation of Learning Space initial Components/Layout|[#591](https://github.com/bounswe/bounswe2022group2/pull/591)|10 hours|
  |Frontend: Learning Spaces providing back-end connection|[#626](https://github.com/bounswe/bounswe2022group2/pull/626)|2 hours|
  |Frontend: HOTFIX Router Modularization|[#628](https://github.com/bounswe/bounswe2022group2/pull/628)|half an hour|
  |Frontend: Participants component implementation for LS pages|[#654](https://github.com/bounswe/bounswe2022group2/pull/654)|2 hours|
  |Frontend: Unit Tests for Static Footer Component|[#689](https://github.com/bounswe/bounswe2022group2/pull/689)|1 hour|
  |--------------|--------------|--------------|
  |**Milestone 1**|-|-|
  |Frontend: LoginForm Implementation|[#399](https://github.com/bounswe/bounswe2022group2/pull/399)| - |
  |Frontend: LoginForm Validation and Back-end Connection|[#446](https://github.com/bounswe/bounswe2022group2/pull/446)| - |
  |Frontend: Implementation of Unit tests for LoginForm|[#467](https://github.com/bounswe/bounswe2022group2/pull/467)| - |
  
  
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
  |**Final Milestone 3**|-|-|
  |Frontend: Implementation Of Profile Page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/771)| 30 hrs |
  |Frontend: Creating Profile Picture Component|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/795)| 8 hrs |
  |Frontend: About-Bio Component in Profile Page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/824)| 5 hrs |
  |Frontend: Backend connection for Bio and PP component|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/837)| 5 hrs |
  |Frontend: Make profile links unique and accessible through ls's|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/844)| 4 hrs |
  |Frontend: Show all ls's that are related to the user|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/884)| 1 hrs |
  |Frontend: Add links to the usernames in the Posts|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/901)| 30 min |
  |Frontend: Add links to the usernames in the Comments|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/903)| 30 min |
  |Frontend: Text and Image Annotation backend connection|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/918)| 7 hrs |
  |Frontent: Unit tests for AboutUser and ProfilePhoto components|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/929)| 1 hrs |
  |Final Milestone: Status of the Requirements|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/944)| 2 hrs |
  |Documenting Meeting Notes #9|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/986)|  30 min |
  |Final Milestone: Summary of Work Table for Gökay Yıldız|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/941)| 2 hrs |
  |Final Milestone: Individual Contributions Report for Gökay Yıldız |[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/942)| 2 hrs |
  |**Milestone 2**|-|-|
  |Frontend: .env file and using environment variables in the code|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/529)| 3hrs |
  |Frontend: Change Password Screen|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/530)| 8 hrs |
  |Frontend: Create Learning Space Page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/543)| 30 hrs |
  |Frontend: Backend connection of Create Learning Space Page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/576)| 3 hrs |
  |Frontend: Connection of create ls page with created ls page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/625)| 2 hrs |
  |Frontend: Join Learning Space|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/656)| 3 hrs |
  |Frontend: Unit Testing Initialization for Dropdown, SelectionGrid, JoinLSButton Components|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/695)| 2 hrs |
  |Documenting the Meeting Notes for the Frontend Meeting 3|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/542)| 1 hrs |
  |Milestone 2 Report: Individual Report |[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/700)| 2 hrs |
  |Milestone-2 Report: Progress According To Requirements|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/705)| 1 hrs |
  |**Milestone 1**|-|-|
    |Personal Wiki Page: Gokay Yildiz|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/311)| 1 hrs |
    |Discovery and Questions about Project for New Members|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/320)| 3 hrs |
    |Revising the Requirements Specification|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/323)| 3 hrs |
    |Research & Report for Frontend Technologies (Frontend Team)|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/327)| 3 hrs |
    |Revising the Requirements: Profile Page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/345)| 5 hrs |
    |Conducting Research on React Router|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/386)| 2 hrs |
    |Initialization of the frontend project|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/371)| 3 hrs |
    |Frontend: Implementing Forgot Password Screen|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/379)| 8 hrs |
    |Frontend: Backend connection for the Forget Password page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/444)| 3 hrs |
    |Frontend: Unit Tests for Forget Password page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/464)| 3 hrs |
    |Frontend: Creating mock home page and adding to the repository|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/465)| 30 min |
    |Milestone 1: Evaluation of the Status of Deliverables|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/493)| 3 hrs |
  
  |Pull Request Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |Frontend: profile photo component|[#800](https://github.com/bounswe/bounswe2022group2/pull/800)| - | 
  |Frontend: Dev frontend profile page bio|[#835](https://github.com/bounswe/bounswe2022group2/pull/835)| - | 
  |Frontend: connection of bio component|[#841](https://github.com/bounswe/bounswe2022group2/pull/841)| - | 
  |Dev frontend profile page profile photo|[#843](https://github.com/bounswe/bounswe2022group2/pull/843)| - | 
  |Frontend: profile page connections|[#850](https://github.com/bounswe/bounswe2022group2/pull/850)| - | 
  |Dev frontend profile page general development|[#861](https://github.com/bounswe/bounswe2022group2/pull/861)| - | 
  |Frontend: comment and post link added to user|[#904](https://github.com/bounswe/bounswe2022group2/pull/904)| - | 
  |Frontend: Dev frontend annotation be connection|[#922](https://github.com/bounswe/bounswe2022group2/pull/922)| - | 
  |Frontend: unit test initialized for bio and profile picture|[#928](https://github.com/bounswe/bounswe2022group2/pull/928)| - | 
  |Final milestone progress in requirements |[#945](https://github.com/bounswe/bounswe2022group2/pull/945)| - | 
  |**Milestone 2**|-|-|
  |Frontend: the urls connected to .env|[#531](https://github.com/bounswe/bounswe2022group2/pull/531)| - | 
  |Dev frontend change password|[#537](https://github.com/bounswe/bounswe2022group2/pull/537)| - | 
  |Dev frontend create ls|[#572](https://github.com/bounswe/bounswe2022group2/pull/572)| - | 
  |Frontend: interconnection between the create ls and ls page is done|[#627](https://github.com/bounswe/bounswe2022group2/pull/627)| - | 
  |Frontend: Join Learning Space|[#657](https://github.com/bounswe/bounswe2022group2/pull/657)| - | 
  |HOTFIX HOMEPAGE|[#671](https://github.com/bounswe/bounswe2022group2/pull/671)| - | 
  |Frontend: unit tests for three components initialized|[#694](https://github.com/bounswe/bounswe2022group2/pull/694)| - | 
  |Milestone2 gokay personal report|[#702](https://github.com/bounswe/bounswe2022group2/pull/702)| - | 
  |Milestone-2: Web Application's UI Designs - Gökay|[#732](https://github.com/bounswe/bounswe2022group2/pull/732)| - | 
  |Milestone-2 : Progress according to to requirements|[#733](https://github.com/bounswe/bounswe2022group2/pull/733)| - | 
  |**Milestone 1**|-|-|
  |Frontend: Initial pages created to present as an example|[#378](https://github.com/bounswe/bounswe2022group2/pull/378)| - |  
  |Frontend/forget password|[#419](https://github.com/bounswe/bounswe2022group2/pull/419)| - | 
  |Frontend: Backend connection to forget password|[#445](https://github.com/bounswe/bounswe2022group2/pull/445)| - | 
  |Frontend: Home page mock|[#461](https://github.com/bounswe/bounswe2022group2/pull/461)| - | 
  |Frontend/dev forget password unit tests|[#463](https://github.com/bounswe/bounswe2022group2/pull/463)| - | 
  |responsibility and summary of work for Gokay |[#504](https://github.com/bounswe/bounswe2022group2/pull/504)| - | 
  |update indv part and evaluate deliverables  |[#506](https://github.com/bounswe/bounswe2022group2/pull/506)| - | 

  
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
#### Web

Note: Almost all of the pages include sub-components and each sub-component has their own ui design. Since each sub-component can be tracked from the page file itself, we did not include sub-component's files below.

#### Sign Up Page

Responsible: Altay Acar \
Link: [Sign Up Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/SignUpForm.js)

<img width="1525" alt="signup-page" src="https://user-images.githubusercontent.com/68481602/206698399-4fee4340-0b19-4942-9ee5-ec57332809e6.png">

#### Login Page

Responsible: Koray Tekin \
Link: [Login Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/LoginForm.js)

<img width="1501" alt="Screen Shot 2022-12-09 at 15 48 30" src="https://user-images.githubusercontent.com/74411541/206706012-fb7af1ca-ce30-472a-b88b-d759324f63ef.png">
  
#### Email Verification Page

Responsible: Muhammed Enes Sürmeli \
Link: [Email Verification Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/EmailVerificationPage.js)

<img width="1728" alt="Screenshot 2022-12-09 at 16 15 26" src="https://user-images.githubusercontent.com/74325266/206710871-d4251fd2-2b8d-43b2-8413-40efb89b2245.png">
  
#### Not Found Page

Responsible: Muhammed Enes Sürmeli \
Link: [Not Found Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/NotFoundPage.js)

<img width="1728" alt="Screenshot 2022-12-09 at 16 15 07" src="https://user-images.githubusercontent.com/74325266/206711106-cae9db4e-afd1-4b56-83f1-935824ff84a8.png">

#### Home Page

Responsible: Altay Acar \
Link: [Home Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/HomePage.js)

<img width="1527" alt="home-page" src="https://user-images.githubusercontent.com/68481602/206697988-72dce30f-f5e5-4874-b808-3e454a638c8c.png">

#### Categories Page

Responsible: Altay Acar \
Link: [Categories Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/CategoriesPage.js)

<img width="1111" alt="categries-page" src="https://user-images.githubusercontent.com/68481602/206698747-da901a07-7a53-40f2-99c1-07a807a01842.png">

#### Learning Spaces by Category Page

Responsible: Altay Acar \
Link: [Learning Spaces by Category Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/LSbyCategoryPage.js)

<img width="1528" alt="ls-by-category-page" src="https://user-images.githubusercontent.com/68481602/206698781-54bc12fb-efe5-40b9-84bf-3a2c6f2ea4d6.png">

#### Forget Password Page

Responsible: Mehmet Gökay Yıldız \
Link: [Forget Password Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/ForgetPassword.js)

<img width="1527" alt="forget-password-page" src="https://user-images.githubusercontent.com/42673110/206701007-f43b67cc-ff14-4b30-883d-43ff00b45853.png">

#### Change Password Page

Responsible: Mehmet Gökay Yıldız \
Link: [Change Password Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/ChangePassword.js)

<img width="1111" alt="change-password-page" src="https://user-images.githubusercontent.com/42673110/206701019-f76a57e1-31e6-41c1-8015-254bc205f91d.png">

#### Create Learning Space Page

Responsible: Mehmet Gökay Yıldız \
Link: [Create Learning Space Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/CreateLS.js)

<img width="1528" alt="create-ls-page" src="https://user-images.githubusercontent.com/42673110/206700987-81ed6668-6267-483c-b766-f93849c763f8.png">

#### Learning Space Specific Page

Responsible: Koray Tekin \
Link: [Learning Space Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/LearningSpace.js)

<img width="1501" alt="Screen Shot 2022-12-09 at 15 51 56" src="https://user-images.githubusercontent.com/74411541/206706633-19b029c7-032d-4088-9215-8e6bc9e2e484.png">

#### About Page

Responsible: Muhammed Enes Sürmeli \
Link: [About Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/AboutPage.js)

<img width="1491" alt="Screen Shot 2023-01-02 at 18 59 41" src="https://user-images.githubusercontent.com/74411541/210254849-3eaf7ce0-4f00-4392-856c-98356c086171.png">

#### Contact Page

Responsible: Koray Tekin\
Link: [Contact Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/ContactPage.js)

<img width="1491" alt="Screen Shot 2023-01-02 at 19 01 46" src="https://user-images.githubusercontent.com/74411541/210255080-887faa19-b537-424f-a8ee-d59fa892c030.png">

#### My Learning Spaces Page

Responsible: Altay Acar\
Link: [My Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/MyLearningSpacesPage.js)

<img width="1504" alt="Screen Shot 2023-01-02 at 19 25 57" src="https://user-images.githubusercontent.com/74411541/210257450-8abdafcb-df90-4d78-bf5f-e8d567139d26.png">

#### Popular Learning Spaces Page

Responsible: Altay Acar\
Link: [Popular Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/PopularLearningSpacesPage.js)

<img width="1499" alt="Screen Shot 2023-01-02 at 19 27 55" src="https://user-images.githubusercontent.com/74411541/210257647-4086260e-ca3c-4bd6-b654-971234f1e850.png">

#### Recommended Learning Spaces Page

Responsible: Altay Acar\
Link: [Recommended Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/RecommendedLearningSpacesPage.js)

<img width="1506" alt="Screen Shot 2023-01-02 at 19 29 35" src="https://user-images.githubusercontent.com/74411541/210257809-f4984815-7231-497a-a9b8-c8a3e45b3ba6.png">



#### Profile Page

Responsible: Koray Tekin, Mehmet Gökay Yıldız\
Link: [Profile Page](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/web/src/pages/ProfilePage.js)

<img width="1495" alt="Screen Shot 2023-01-02 at 19 32 11" src="https://user-images.githubusercontent.com/74411541/210258026-29710641-a51c-44d1-a0dd-b8381f86605f.png">

#### Web

#### Mobile

Note: We structured our folders in a way that they can be managed easily. Therefore, we're giving the link of the folder related to the code part you requested. Please analyze and review them carefully. You can also see the import statements at the beginning of each file and so that you can find the implementations of sub-components in a screen. Please traverse all files included in the directory and also the imported ones and the sub-folders (such as view, model, view-model, constants, and so on) to see our implementations on the code side.

##### Signup Screen

Responsible: Bahrican Yeşil \
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/tree/master/learnify/mobile/lib/features/auth/signup)

<img width="300" alt="signup" src="https://user-images.githubusercontent.com/60237280/206682554-5439005e-8336-43b3-9b99-cec9c870b6e3.png">

##### Login Screen

Responsible: Onur Kömürcü \
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/tree/master/learnify/mobile/lib/features/auth/login)

<img width="300" alt="login" src="https://user-images.githubusercontent.com/92719802/206705437-1bb131c0-693f-42aa-b6ad-5b4523d416aa.png">

##### Forget Password Screen

Responsible: Ezgi Aysel Batı  
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/tree/master/learnify/mobile/lib/features/auth/forget-password)

<img width="300" alt="forget-password" src="https://user-images.githubusercontent.com/56553280/206687548-af6db5ec-b28f-497a-a0b1-0e2af19175ed.jpg">

##### Verification Screen

Responsible: Egemen Atik \
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/tree/master/learnify/mobile/lib/features/auth/verification)

<img width="300" alt="verification" src="https://user-images.githubusercontent.com/100771925/206706051-b31c6c98-41ea-453a-b393-7e28ec308cd7.png">

##### App Bar and Bottom Navigation Bar

Responsible: Bahrican Yeşil \
Link - App Bar: [Code File in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/core/widgets/app-bar/default_app_bar.dart) \
Link - Bottom Navigation Bar: [Code File in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/home-wrapper/view/components/bottom_navigation_bar.dart)

<img width="300" alt="app_and_bottom_nav_bar" src="https://user-images.githubusercontent.com/60237280/206682705-eeae485d-aa33-4e54-8598-408f4da6787a.png">

##### Home Screen

Responsibles: Ezgi Aysel Batı -> Course Preview Widget / Egemen Atik -> Horizontal Scrollable Course Preview Widget List \
Updated By: Egemen Atik
Link - Course Preview Widget : [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/home/components/course_preview.dart) \
Link - Horizontal Scrollable Course Preview Widget List : [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/home/view/home_screen.dart)

<img width="300" alt="home_screen" src="https://user-images.githubusercontent.com/56553280/210247084-543da78f-4498-4782-8249-471ac922a8b7.jpeg">


##### View All Screen

Responsible: Onur Kömürcü \
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/tree/master/learnify/mobile/lib/features/view-learning-spaces/view)

<img width="300" alt="view_all_screen" src="https://user-images.githubusercontent.com/92719802/206706143-853b3e5d-4395-4163-8a6d-498b50a1e107.png">

##### Search Screen

Responsible: Onur Kömürcü \
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/tree/master/learnify/mobile/lib/features/search)

<img width="300" alt="ls_search_screen" src="https://user-images.githubusercontent.com/92719802/206706771-81ec2ef5-bac4-4d09-bf9f-5e71fcec35c7.png">&nbsp;&nbsp;&nbsp;<img width="300" alt="user_search_screen" src="https://user-images.githubusercontent.com/92719802/206707067-7a6dba90-84ad-4d5f-8b2e-15cc1a33e31c.png">

##### Spaces Screen

Responsible: Onur Kömürcü \
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/tree/master/learnify/mobile/lib/features/view-learning-spaces/view)

<img width="300" alt="spaces_screen" src="https://user-images.githubusercontent.com/92719802/206706395-58b9a6b6-3b54-4bd5-a302-62fa169ca566.png">

##### Profile Screen

Responsible: Onur Kömürcü \
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/tree/master/learnify/mobile/lib/features/profile)

<img width="300" alt="profile_up" src="https://user-images.githubusercontent.com/56553280/210247610-029e23e7-615f-4c87-b8ee-864128ca4b02.jpeg">&nbsp;&nbsp;&nbsp;<img width="300" alt="profile_down" src="https://user-images.githubusercontent.com/56553280/210247615-c711455f-8daf-4896-abf0-dd1a472b1930.jpeg">

##### Create Learning Space Screen

Responsible: Ezgi Aysel Batı \
Link:  [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/learning-space/view/create_learning_space_screen.dart)

<img width="300" alt="profile" src="https://user-images.githubusercontent.com/56553280/206690749-8983b19b-1c8a-4ec3-9166-c8ec6af0acbf.jpg">

Note: Link only contains static "screen" implementation. For model and backend connections refer to pr's regarding this screen.  

##### Posts Section

Responsible: Bahrican Yeşil \
Updated By: Ezgi Aysel Batı
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/tree/master/learnify/mobile/lib/features/learning-space/view/components/post)

<img width="300" alt="post_section" src="https://user-images.githubusercontent.com/56553280/210249260-c2e5676c-e209-4d43-91c1-3f535e85f5ca.jpeg">

##### Events Section

Responsible: Egemen Atik
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/tree/master/learnify/mobile/lib/features/learning-space/view/components/events)

<img width="300" alt="post_section" src="https://user-images.githubusercontent.com/56553280/210250206-da8582aa-54c9-4ec3-af12-62679a4a5f41.jpeg">


##### Forum Section

Responsible: Ezgi Aysel Batı
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/learning-space/view/components/forum_list.dart)

<img width="300" alt="forum_section" src="https://user-images.githubusercontent.com/56553280/206689133-fea41c35-81bf-4151-ba51-12e7720b1843.jpg">

##### Comments 
Responsible: Ezgi Aysel Batı
Link: [Code in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/learning-space/view/comments_screen.dart)


<img width="300" alt="comments_up" src="https://user-images.githubusercontent.com/56553280/210250064-a647ed97-56df-46ac-a2ca-02418289cff8.jpeg">&nbsp;&nbsp;&nbsp;<img width="300" alt="comments_down" src="https://user-images.githubusercontent.com/56553280/210250067-3a6dc57c-933f-4de3-a1f9-3e52ef7cba72.jpeg">

##### Learning Space Detail Screen: Information Part

Responsible: Egemen Atik \
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/learning-space/view/learning_space_detail_screen.dart)

<img width="300" alt="ls_detail_information" src="https://user-images.githubusercontent.com/100771925/206707954-ca555c86-9bcd-499e-bde4-6af705946292.png">

##### Add Post Screen

Responsible: Egemen Atik \
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/learning-space/view/add_post_screen.dart)

<img width="300" alt="add_post" src="https://user-images.githubusercontent.com/100771925/206708112-87a73f59-b0a5-459e-baeb-d88cec46d32b.png">

##### Edit Post Screen

Responsible: Egemen Atik \
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/learning-space/view/add_post_screen.dart)

<img width="300" alt="edit_post" src="https://user-images.githubusercontent.com/100771925/206708184-30ac0460-e9cd-4e8f-865b-6672fe485132.png">

##### Create Event Screen

Responsible: Egemen Atik
Link: [Code in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/learning-space/view/create_event_screen.dart)

<img width="300" alt="events_section_1" src="https://user-images.githubusercontent.com/56553280/210250733-90440a54-8e5f-4400-bf62-287d9ccf2054.jpeg">&nbsp;&nbsp;&nbsp;<img width="300" alt="events_section_2" src="https://user-images.githubusercontent.com/56553280/210250741-d3ec6c45-62fb-41ef-8c75-5231848c6fd5.jpeg">&nbsp;&nbsp;&nbsp;<img width="300" alt="events_section_3" src="https://user-images.githubusercontent.com/56553280/210250743-dc802378-9f64-41d2-81fc-b2d030ca6c53.jpeg">


##### Annotating an Image

Note: We implemented annotating image functionality ourselves without using any package or ready-to-use code. We have full control on our code since we didn't use any package. We just got help from a repository which includes manipulation and edit feature on images. However, it doesn't have any annotation-related feature. We just benefit from it for image edit feature (drawing rectangles on an image). We also gave a link to that repository at the beginning of related files. \

Responsible: Bahrican Yeşil \
Annotated Post Image: [Code File in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/learning-space/view/components/chapter_image.dart) \
Annotatable Image: [Code File in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/core/widgets/image/annotatable_image.dart) \
All Image Manipulation Components: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/tree/master/learnify/mobile/lib/core/widgets/image) \
Cropped Image Preview on Annotations Screen: [Code File in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/learning-space/view/annotations_screen.dart)

<img width="372" alt="image_annotation_1" src="https://user-images.githubusercontent.com/60237280/206683909-6ee47924-e307-4cb2-9735-6383aa673d84.png">&nbsp;&nbsp;&nbsp;<img width="372" alt="image_annotation_2" src="https://user-images.githubusercontent.com/60237280/206683918-1b6b21b7-81ef-401f-a499-4bd11fa8c753.png">

<img width="372" alt="image_annotation_3" src="https://user-images.githubusercontent.com/60237280/206683923-3e85c6c2-160c-44ca-8f1f-0e76b7a52cc4.png">&nbsp;&nbsp;&nbsp;<img width="370" alt="multiple_image_and_text_annotations 2" src="https://user-images.githubusercontent.com/60237280/206683926-9bbd585d-5192-4e30-a52f-e329c9aabbe2.png">

##### Annotating a Text

Note: We implemented annotating text functionality ourselves without using any package or ready-to-use code. We have full control on our code since we didn't use any package. \

Responsible: Bahrican Yeşil \
Annotatable Text: [Code File in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/core/widgets/text/annotatable/annotatable_text.dart) \
All Text Manipulation Components for Annotation: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/tree/master/learnify/mobile/lib/core/widgets/text/annotatable)

<img width="374" alt="text_annotation_1" src="https://user-images.githubusercontent.com/60237280/206684119-95232a18-8132-4cc9-8903-13dddd51f38e.png">&nbsp;&nbsp;&nbsp;<img width="370" alt="text_annotation_2" src="https://user-images.githubusercontent.com/60237280/206684123-9c659a42-9479-48f9-ab8b-fdbe32d2fc79.png">

<img width="372" alt="text_annotation_3" src="https://user-images.githubusercontent.com/60237280/206684131-b7f182f1-aab3-4bb2-87b5-b67b79683edb.png">&nbsp;&nbsp;&nbsp;<img width="370" alt="multiple_image_and_text_annotations" src="https://user-images.githubusercontent.com/60237280/206684133-41dd4e29-9789-4dae-a0b9-c36bdf34d1bb.png">

##### Annotation Selection Dialog

Responsible: Bahrican Yeşil \
Annotation Selection Dialog: [Code File in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/core/widgets/dialog/single_choose_dialog.dart)

<img width="374" alt="annotation_selection_dialog" src="https://user-images.githubusercontent.com/60237280/206684280-6440588f-c7d6-4d97-9ee1-10e8efecd307.png">

#### Annotation Details Screen

Responsible: Ezgi Aysel Batı  

* Only for the image annotation, the preview of annotated image part was implemented by Bahrican.
Link: [Code Folder in the Repository](https://github.com/bounswe/bounswe2022group2/blob/master/learnify/mobile/lib/features/learning-space/view/annotations_screen.dart)

<img width="300" alt="events_section_1" src="https://user-images.githubusercontent.com/56553280/206688618-b5d1c078-8d1b-4433-bf92-d5171ad53e28.jpg">&nbsp;&nbsp;&nbsp;<img width="300" alt="image_annotation_3" src="https://user-images.githubusercontent.com/60237280/206683923-3e85c6c2-160c-44ca-8f1f-0e76b7a52cc4.png">

#### Settings Screen
Responsible: Bahrican Yesil

Link: [Code in the Repository](https://github.com/bounswe/bounswe2022group2/tree/milestone3-ui-mobile/learnify/mobile/lib/features/settings)


<img width="374" alt="settings" src="https://user-images.githubusercontent.com/56553280/210254402-ab3bba1c-135b-4ce1-847a-1c53533c1a27.jpeg">


***


***

### Annotations

The app has text and image annotations for both the web and mobile versions. The text annotations allow users to add notes and comments to the posts of the learning spaces in the app, while the image annotations allow users to highlight and annotate specific areas of images within the posts. These annotations can be used to provide additional context, clarification, or feedback on the content. Users can see their own and other users' annotaions. On mobile version, annotations of the current user are shown on top of the screen, when "see annotations" section is activated. Text annotations are shown by highlights on related text, while image annotations have square shape identifiers on the image. Both the text and image annotations are available on both the web and mobile versions of the app, allowing users to access and utilize these features regardless of the platform they are using. Since there is full backend connection, annotations made by each platform can be accessed by each platform.

  As mentioned in milestone 2 as a future improvement, the external annotation service is implemented and serves the Learnify application. The annotations created by Learnify users **do not kept in Learnify database**. Additionaly, annotations service is deployed in a different machine than Learnify server. In that context, annotation service and Learnify are two different applications. When application side of the Learnify sends a request for creating annotations, it uses it's own API to send the annotation model. In this API, another request to the annotation-service with its own parameters is sent. Then, the newly created annotation in saved in annotations service database. Similar scenario is present for accessing the annotations as well. When Learnify application sends a request to it's own server to get related annotations, another request is sent by axios library to the annotations service to return the related annotations which have the specified id. Overall, **Learnify application side does not have direct contact with annotations service.**
  
 Please check the documentation on [API Documentation](https://github.com/bounswe/bounswe2022group2/edit/master/deliverables/CMPE451_Customer_Presentation_Milestone_3/final_deliverables.md#api-endpoints) section to see example requests for both annotations service and Learnify.
 
***

### Standards

 To follow the W3C Annotation model standards, Learnify annotation related APIs both accept and send the given W3C annotation model. Similarly, annotation service APIs also accept and send same model. Please do see the annotations kept in annotation service DB below. 
 
![image](https://user-images.githubusercontent.com/64018144/210228784-7992a698-72c3-473f-be99-2f7cff8f4d56.png)

Although all APIs are documented in [API Documentation](https://github.com/bounswe/bounswe2022group2/edit/master/deliverables/CMPE451_Customer_Presentation_Milestone_3/final_deliverables.md#api-endpoints), you can see in example below the **request sent to the annotation service.** It fully follows the W3C annotation model for both text and image annotations.
![image](https://user-images.githubusercontent.com/64018144/210229112-847652f0-29a0-44bd-8e1e-d890aaddcc3f.png)

Please do check the annotation related APIs in API Documentation as a proof to W3C Model Annotations are kept, saved and sent overall the application.

***

### Scenarios

#### Web Application Scenario

Our scenario follows a senior student Gökay, who has a very relaxed weekly schedule in his final semester in the university. Thus, he is very eager to learn new things and develop himself in different areas of the life. As a student, he has heard about an online learning platform called Learnify from one of his friends in the university, and he decides to check it out.

He navigates to the website and sees that he can sign up for an account by entering his email address, choosing a username, and setting a password with confirmation. He also needs to read and agree on terms of use on KVKK by clicking the checkbox in the form. He completes the sign-up process and receives an email to verify your account.

Once he’s verified his account, he is able to log in to Learnify. But, because he is a bit distracted about everything going on, he immediately forgets his password. Thus, instead of logging in he clicks the forgot password button and gets another verification mail regarding the password. Once verified, he logs in to his newly created account.

He sees that there is a search bar at the top of the page, and he decides to try it out by searching for “painting.” Because he wants to learn how to paint an oil painting in the atelier he has made for himself in his new home. He sees a list of learning spaces that matches your search query. The listed learning spaces vary from sculpting to art history, or basic charcoal sketching. He notices that the search feature also supports semantic search, so he can find learning spaces by searching for related keywords instead of the exact name of the learning space. Although he planned to learn how to create oil paintings, the charcoal sketching learning space immediately catches his attention and he wants to discover more about the topic.

He clicks on the learning space about charcoal sketching that caught his eye, and sees that it has a page with lots of content in it: information about the learning space, including a description and a title, space part where lots of content is posted, a list of contributors, and a list of upcoming events. He also sees that there is a create event button. He sees that the events component shows a list of all the events that have been created for the learning space, and he can view more details about each event such as event title, description, date and time, participation limit, duration, and its location on the map by clicking on it. He can also see the participants of that event. He also sees that the contributors section shows a list of all the users who have joined the learning space or the one who created it, and he can view their profiles by clicking on their username.

After surfing on the content posted he really likes the knowledge he can gain from here. So, he decides to join the learning space, and he sees his username on the contributors section immediately after joining the learning space as a contributor. He also sees that the creator of the learning space can be spotted by its different icon in the contributors part. He sees that he has the ability to post content, comment on other people's posts, and annotate text or image content. He decides to create a new post by clicking on the “Add Post" button. A new section pops up and he adds a post by adding a post title, an optional link to an image and using a flexible rich editor any content he wants to add. He has a book about beginner’s guide on charcoal sketching in his library, he remembers that there was a very useful information for starters. So he adds the things he remembers from the book as a post. He also adds an ember video from YouTube using the rich editor and also adds an informative image for his post. When he’s finished, he clicks submit to post his content to the learning space.

Amazed by the idea about how people exchange their knowledge and expertise on the things they are interested in collaboratively, he immediately wants to create a learning space about playing drums. He is a very skilled drummer since his primary school days. He even plays as the lead drummer of the rock band with his friends and they just released a new single called “Embed Me to Your Heart Like a Microcontroller.” So, he goes back to home page by clicking the “Home” button in the navigation bar. He sees the create a learning space button and clicks it. He is redirected to a form page where he needs to fill the necessary form fields to create a learning space. He gives the title of “Play Drums Like a Boss” and provides a short description. He sees the available categories for his learning space and spots the “Music” category among the all 18 categories available. He also selects a vibrant icon for his cool learning space. When he submits the form he is redirected to this new learning space’s page, sees himself as the creator of the learning space in the contributors part and already joined. He adds the first post by giving some basic instructions on each drum and cymbal type on a drum kit. Since his new single is just released and he has a very long and amazing drum solo in that single, he thinks that adding its video as a comment to the post would be informative and also boost up his popularity on YouTube. Thus, he clicks comments section and adds a comment with his new single’s video is embedded using the rich editor again.

Before getting done with this new learning space he gets a really good idea to invite people to his band’s gig on Saturday. So, he creates an event about his gig by providing event title, description, date and time, and also duration. Since, the place is not that big he sets a participation limit of 50 people and selects the location using the map picker element in the event form. After he submits the event, he sees that his event is listed in the events section of the learning space with all the data he has given just before. He also sees himself as a participant in the event’s participants list. Just before returning to home page, he sees two other people joined his learning space and even one of them has upvoted his first post. He also sees that the comment count is not what he has left off. So, he immediately clicks the comment section and sees that one of the new contributors to the learning space just replied that she loved his new single and the drum solo was amazing. He is so happy about the praise he got. So, he upvotes her comment.

When he comes back to home page, he sees that there are some learning spaces listed on the recommended learning spaces part, since he is engaged with the application for the time being. He sees that “Electro Guitar” learning space is also recommended for him. He clicks it and goes to the learning space. He sees that there are tons of content in the learning space, almost 40 posts and 30 contributors. He thinks it would be valuable to join this learning space, since he can also share information on electro guitar about what he has learned from his friends from the band. In one of the posts he sees a mistake about playing electro guitar to a drum roll. So, using the text annotation he selects that sentence and corrects the mistake by adding what he knows about the situation. He also sees some words and sentences in the same post is already marked, showing that this part of the content is also annotated by other users. He checks on what other users have said upon the content and immediately sees that they have also corrected lots of mistakes according to their expertise. Thus, he believes that this content is not appropriate for people who wants to learn playing electro guitar and so downvotes the post. On another post he sees that someone shared a photo of one the most famous rock groups of all time “The Beatles” when they were playing in a live concert. He also spots that the head of one of the members of the group is also marked with a rectangular shape. When he clicks it, he sees that it is an image annotation asking about who he is. Since he knows every member well, Gökay decides to select each member and provide their names as image annotation. 

He remembers the friend of his who suggested him Learnify. Thus, he wants to search for her username to see her profile. He clicks the toggle button next to the search bar to switch between learning space search and the user search. He types her username, and goes to her profile by clicking the search result. He sees her profile picture, bio, and all the learning spaces she participated in. He sees a variety of learning spaces regarding the programming category. He notes himself that he will check the category catalogue of the application. But first, he wants to edit his profile. Because he was a bit jealous of his friend’s rich profile. So, he clicks on the profile button on the navigation bar to reach out his profile page. He adds an avatar and gives a nice bio for himself. He also sees the learning spaces “Play Drums Like a Boss” and “Charcoal Sketching” listed on the my learning spaces part of his profile too.

Finally, he clicks the categories button in the navigation bar to browse through categories. He sees that there are 18 categories and each of the has their own page containing learning spaces about that category and can view all of the learning spaces in a particular category by clicking on the category name. He reminds himself to check on gastronomy and culinary category later when the new furniture he has ordered for the kitchen for his new home arrives.

#### Mobile Application Scenario

Former student Jennifer, who used to learn so much things in her academic career wants to learn new things with people who enthusiast with learning. Because of that, she downloaded the Learnify mobile app. She preferred mobile app because she used to spend most of her time with phone.

After she downloaded the app, she open the app. Splash screen welcomes herself. She signs up to use the application. Application sends a verification code to given email adress. She types the 4 digit code in 180 seconds. Also when she navigates through the login screens, she sees that forget password screen is active. She feels comfortable because she won't be worried if she forgets her password.

When she logins to the app, she welcomed with home page. She sees enrolled, top and recommended learning spaces. Since she is a newcomer, enrolled learning spaces list is empty. She looks at the top learning spaces. Since there is more than 8 learning spaces for this category, view all button is active. She taps to view all button and look over the top learning spaces. She interests in Playing the Piano learning space that she sees from the list. She taps to that learning space to view details.

Learning space detail is visible now. She welcomed with the learning space details upper part of the page. Learning space name, description, creator and number of participants can be seen here. She wants to look at to the creator who is Honor. She taps to the creator and another page comes. In this page, she sees profile photo, username, biography, taken learning spaces and created learning spaces of the Honor. She is impressed with the biography of the Honor. She is now more engaged with the learning space. She also taps to the participants and list of participants is visible. She knows someone in that list: Trump. She also looks his profile page. She also taps to the created learning spaces of Trump and she sees that Trump created social media management learning space. She doesn't interested in that learning space. So, she backs to the learning space: Playing the Piano and enrolled to this learning space.

She see three sections in the learning space: Posts, Forum and Events. She looks at to the posts. She sees annotations in both text and image content. She loved that functionality. She thinks that even intersection of the annotations is working great. She tries the annotation functionality. She adds text and image annotation to some posts that she loved. She views all comments in that post. She adds a comment for that post also.

She creates a post for the learning space itself. She give a title and content for the post. She sees some wrong in the content. She edits the post that she created.

After these, she wants to look at to the events. She can attend the not passed events. She can see the participants and also see the location, event date, creator and duration. She doesn't satisfied with the events. She creates an event with giving the following informations: title, description, participation limit, duration, time and location of the event. At the end, she creates an event for that learning space.

She explores the search page. She search "Blockchain" word. Since search is working in a semantic way, she can see every blockchain related learning spaces. She searches an user that she knows from college: Gökay. She types "gokayyıldız" and there are several gokay's using this app. She looks these users and find the Gökay she knows. She looks at his profile just like she did several times.

After spending some time in the application, she tired of white color of the app because atmosphere getting darker. She goes to the profile page from navigation bar and sees the setting button up right corner. She taps to that button and she opens the dark mode. She also realizes some other languages are provided. She is impressed with that great functionality.

She now feels comfortable. Lastly, she updates her profile photo and biography to be known by other users. She spent so much time compared with any other applications that she uses. Because of that, she logout from the application for security reasons and closes the application.

---------

# Project Artifacts

***

## Manuals

***

### User Manual

#### Signup Screen

Before using our application, Learnify, our users should complete the signup process. This screen asks for a valid username(no other user use that username), an email address and a strong password(please check our glossary for our definition of "strong password"). Lastly, it asks for users to tick the box for accepting our General Terms and Privacy Policy. In this screen, we also have a button that navigates users to login screen.

##### Mobile

After all those steps are completed, signup button becomes active in our mobile application. Other than that, it is in deactivated mode.

![signup_1](https://user-images.githubusercontent.com/100771925/210227773-c7cf2378-f1b3-4ff4-8979-f4d455b907f6.jpg)
![signup_2](https://user-images.githubusercontent.com/100771925/210227779-5d9cbcb5-23e0-4565-98dd-47379f36e8dc.jpg)

##### Web

![signup_web](https://user-images.githubusercontent.com/68481602/206698399-4fee4340-0b19-4942-9ee5-ec57332809e6.png)

***

#### Verification Screen

After pressing signup button, our users receive an email that contains a verification code and our application navigates them to verification screen. If a user tries to log in before completing the verification step, they are navigated to this screen after logging in. After verification step is completed succesfully, our mobile application navigates user to home page, and our web application navigates user to login page.

##### Mobile

In our mobile application, verify button is in deactivated mode by default. After filling all 4 code fields, it is activated. This screen also has a countdown timer, resend verification code button and back to previous page button in our mobile application.

![verification_1](https://user-images.githubusercontent.com/100771925/210228634-ec44d2da-6b38-4cc3-86e1-e8e31075ca79.jpg)
![verification_2](https://user-images.githubusercontent.com/100771925/210228639-6cff4864-f863-4359-bf72-c8950afaac4e.jpg)

##### Web

![verification_web_1](https://user-images.githubusercontent.com/74325266/206710871-d4251fd2-2b8d-43b2-8413-40efb89b2245.png)

***

#### Login Screen

Users who completed signup and verification processes can enter our application by logging in. This screen asks users to enter their emails and passwords. This screen also have a button which navigates users to signup screen and a button which navigates users to forget password screen. If entered email address and password match after pressing log in button, our application navigates user to home page of our app.

##### Mobile

In our mobile application, log in button is in deactivated mode by default. After filling both email and password fields, it is activated. 

![login](https://user-images.githubusercontent.com/100771925/210229240-f788dae1-3c10-4ffa-b6c9-5dead4378f22.jpg)

##### Web

![login_web](https://user-images.githubusercontent.com/74411541/206706012-fb7af1ca-ce30-472a-b88b-d759324f63ef.png)

***

#### Forget Password Screen

Users who can't remember their password can press "forget password" button in login screen to reach forget password screen. In this screen, users are asked to enter their emails. Then, a verification code is sent to the entered email address and users are navigated to verification screen, again. 

##### Mobile

This screen also has a button which navigates users to login page in our mobile application.

![forget_password](https://user-images.githubusercontent.com/100771925/210230015-3a8fd401-94f3-498e-9fc9-93f99963fce5.jpg)

##### Web

![forget_password_web](https://user-images.githubusercontent.com/42673110/206701007-f43b67cc-ff14-4b30-883d-43ff00b45853.png)

***

#### Home Screen

In home screen, enrolled learning spaces of user, top rated learning spaces and recommended learning spaces for user are shown. 

##### Mobile

In our mobile application, there is a "view all" button for all three types of learning spaces(enrolled, top rated and recommended). That button is activated whenever there are at least 8 learning spaces in that type. By pressing that button, users are navigated to a screen where they can see all learning spaces in the selected type.

![home](https://user-images.githubusercontent.com/100771925/210237221-02eb0f1a-388d-4954-b1d4-c6503b285528.jpg)
![home_1](https://user-images.githubusercontent.com/100771925/210233088-a0f025a7-24fb-404c-85c9-e12ee0cafce1.jpg)

##### Web

![home_web](https://user-images.githubusercontent.com/68481602/206697988-72dce30f-f5e5-4874-b808-3e454a638c8c.png)

***

#### Search Screen

This is the screen where you can find learning spaces you wish by entering the correct, related keywords to search bar. We use semantic search to find the learning spaces users aim to find.

##### Mobile

In our mobile application, when a user enters the search screen for the first time, they see recommended learning spaces by default. After typing some keywords to search bar and pressing the search button, learning spaces found with related to entered keywords are shown to users. We also have user search in the mobile application. Clicking the found users navigates current user to that user's profile page.

![ls_search_1](https://user-images.githubusercontent.com/100771925/210233153-abf6bc23-3704-45a9-a7bc-d3a442ba05c2.jpg)
![ls_search_2](https://user-images.githubusercontent.com/100771925/210233176-c297b422-9675-4b6e-9f36-e5639c6adc79.jpg)
![user_search_1](https://user-images.githubusercontent.com/100771925/210233189-ae20bbb2-1ef2-4276-89de-be800354c2a2.jpg)

##### Web

***

#### Profile Screen

In profile screen, profile picture, username, email and biography of the user are present. Users can change their biography from this screen if they wish.

##### Mobile

In our mobile application, we also have two buttons named "Enrolled Learning Spaces" and "Created Learning Spaces". Clicking those buttons navigates user to a page where enrolled or created learning spaces are shown. We also have an indicator showing how many learning spaces the user created, enrolled in. There is also a setting button at the top, which will be detailed below. Finally, there is a log out button next to settings button, pressing that button logs the user out of our program.

![profile_1](https://user-images.githubusercontent.com/100771925/210233243-6c3034b1-3af3-4911-bd27-42b923f39ca3.jpg)

##### Web
![profile_web](https://user-images.githubusercontent.com/74411541/210258026-29710641-a51c-44d1-a0dd-b8381f86605f.png)

***

#### My Learning Spaces Screen

In this screen, only enrolled learning spaces are shown. Additionally, there is a button for creating a learning space. Pressing that button navigates user to learning space creation screen.

##### Mobile
![spaces](https://user-images.githubusercontent.com/100771925/210261584-e8ac451d-c215-4576-8a16-a4067d5750a5.jpg)

##### Web
![my_ls_web](https://user-images.githubusercontent.com/74411541/210257450-8abdafcb-df90-4d78-bf5f-e8d567139d26.png)

***

#### Create Learning Space Screen

In this screen, users are asked to choose an image among predefined images, enter a title, a description, a participant limit and choose category related to the learning space. Pressing done button creates the learning space and navigates user to the previous page.

##### Mobile

In our mobile application, more than one category can be chosen and done button is activated after necessary fields are filled.

![create_ls](https://user-images.githubusercontent.com/100771925/210261615-ec585c90-b4ca-49b0-aa67-13c9a6fb15fe.jpg)

##### Web

![create_ls_web](https://user-images.githubusercontent.com/42673110/206700987-81ed6668-6267-483c-b766-f93849c763f8.png)

***

#### Learning Space Detail Screen

This screen includes detailed information about a learning space. In both mobile and web applications, description of the learning space, name of it, posts, events, discussion forum take place.

##### Mobile

In our mobile application, enroll button takes place. Once user presses this button, they enroll the learning space and button text turns to "enrolled". Category takes place under description of learning space. Posts, create post button, forum, events and create event button takes place in this screen. When participants icon is clicked, participants of the learning space are shown. Pressing creator of the learning space navigates user to profile page of course creator.

![ls_detail_1](https://user-images.githubusercontent.com/100771925/210233382-e24aacbe-09ae-4a39-a0dc-e79abd7fde3c.jpg)
![ls_detail_participants](https://user-images.githubusercontent.com/100771925/210235336-a2a51a12-2854-4725-8fd4-d61d9f41d629.jpg)
![ls_detail_posts](https://user-images.githubusercontent.com/100771925/210235353-b71b6984-d883-43b0-b316-c5ce2380034a.jpg)
![ls_detail_forum](https://user-images.githubusercontent.com/100771925/210235408-68fe044c-4872-4abb-962c-754ae570f2b6.jpg)
![ls_detail_events](https://user-images.githubusercontent.com/100771925/210235426-715addea-8e00-440f-b379-db208fb91d5e.jpg)

##### Web

In our web application, contributors and events take place in the right side of the screen. Posts are shown one after another in the middle and add post button takes place above the posts.

![ls_detail_web](https://user-images.githubusercontent.com/74411541/206706633-19b029c7-032d-4088-9215-8e6bc9e2e484.png)

***

#### Enroll Learning Space

This is not a screen but a functionality. Users can enroll learning spaces in our application by triggering enroll functionality.

##### Mobile

In our mobile application, there is a button with text "enroll" in learning space detail screen. Once this button is pressed, its text turns to "enrolled" and user who just enrolled is added to participants list. Also, the newly enrolled learning space is added to enrolled learning spaces list in both home screen and spaces screen.

![enroll_ls_1](https://user-images.githubusercontent.com/100771925/210233427-9a8128f9-d969-44a9-9e7f-debeefa8e026.jpg)
![enroll_ls_2](https://user-images.githubusercontent.com/100771925/210233423-0ceaf5b1-e3a8-4a1b-a4c0-e39cfb5c5e55.jpg)

##### Web

***

#### Add Post / Edit Post

This components/screens are used to add or edit post/material to a learning space.

##### Mobile

In our mobile application, add post screen asks users to add a title and a content for the post to add. Done button is activated only when both input fields are filled. On the other hand, in edit post screen, title and content fields are filled with the texts to be edited by default. Making a change in those fields activates the done button.

![add_post](https://user-images.githubusercontent.com/100771925/210233535-18eaa8e6-2305-4613-aeab-af0c1e868c14.jpg)
![edit_post](https://user-images.githubusercontent.com/100771925/210233539-28e535a3-7dfb-452c-a8b2-200fee2ce558.jpg)

##### Web

***

#### Add Comment

This component is used to add comment to a learning space post/material.

##### Mobile

In our mobile application, comment button takes place right to edit post button and under the post content. A dialog pops up by clicking the comment button. After inserting the comment in that dialog, done button is activated and comment is made.

![add_comment](https://user-images.githubusercontent.com/100771925/210255796-c4b0acc2-d579-4aed-b7ea-d780bfd6f729.jpeg)

##### Web

*** 

#### Text Annotation

Text annotation is one of the most important features in our application in both mobile and web. We have a fully functioning text annotation in both our mobile application and web application.

##### Mobile

In our mobile application, posts/materials of a learning space can be annotated. After a long press on a text, text selection functionality becomes active. Then, users can choose the part of the text they want to annotate. After desired part is selected, annotate button can be selected. Then, a dialog for entering the annotation is opened. After entering a text to that dialog, done button is activated and annotation is made. Then, users can view the annotations they have made. Overlapping annotations are available in our application. By clicking on annotated text, users are navigated to annotation view screen. If an overlapping are is clicked, firstly a annotation selection dialog is opened.

![text_annotation1](https://user-images.githubusercontent.com/100771925/210260005-78695537-36c1-4d16-bd0d-75dacc301994.jpg)
![text_annotation2](https://user-images.githubusercontent.com/100771925/210260007-244a8970-34ee-4efc-91c1-a6e070473714.jpg)
![text_annotation3](https://user-images.githubusercontent.com/100771925/210260009-ef423158-4948-427e-a5f1-549afe684863.jpg)
![text_annotation4](https://user-images.githubusercontent.com/100771925/210260013-1d408039-3bce-4920-9a0a-4dca986faac9.jpg)
![text_annotation5](https://user-images.githubusercontent.com/100771925/210260016-905346a9-4ef3-4824-8a41-f59cab1a34b8.jpg)
![text_annotation6](https://user-images.githubusercontent.com/100771925/210260019-9e50c26d-53af-4a6f-aec3-34c8c66f158a.jpg)

##### Web

***

#### Image Annotation

Image annotation is one of the most important features in our application in both mobile and web, as well. We have a fully functioning image annotation in both our mobile application and web application.

##### Mobile

In our mobile application, images in posts/materials of a learning space can be annotated. By clicking on an image, image view screen is opened. Then, by pressing on a region on the image, a selection rectangle is shown. Users can choose the part of the image they want to annotate with this selection rectangle. After that, a dialog opens again for users to enter the annotation text. After the text is entered, users can view the annotations they have made. Again, overlapping annotations are available in our mobile application. By clicking the annotated parts, users are navigated to annotation view screen. If an overlapping part is clicked both annotation text are shown in the annotation view screen.

![image_annotation_1](https://user-images.githubusercontent.com/100771925/210260051-99be5c7e-6210-4ec6-b63d-5cfd5be18564.jpg)
![image_annotation_2](https://user-images.githubusercontent.com/100771925/210260055-ef079cd6-8510-4b8b-b1cf-7bb0041743dd.jpg)
![image_annotation_3](https://user-images.githubusercontent.com/100771925/210260058-8464e94a-4c6f-4d14-a36a-349b08b1cc9f.jpg)
![image_annotation_4](https://user-images.githubusercontent.com/100771925/210260043-9226a3c8-726b-4c18-b875-b2a615364481.jpg)


##### Web

***

#### Create Event

Creating event by specifying geolocation is another important feature of our application. We have a fully functioning event creation feature both in our mobile app and web app.

##### Mobile

In our mobile application, create event screen can be reached by clicking "Create Event" button in events section of the learning space detail screen. In this screen, users are asked to enter title, description, participation limit and duration of event. Then, they are asked to enter a date for the event. By default, date selection starts from the current time, selecting a previous date is not allowed by the application(it is programmed that way). Next, there is a map, users can select the geolocation of the event from that map, below that latitude, longitude and accuracy of the selected geolocation is shown. By default, first geolocation is the current geolocation of the user. For using this feature location services of the phone must be open. After entering all fields, done button is activated. Pressing the done button creates the event. Attend event button takes place under information of event, pressing that button adds users to participants list. Creator of event is automatically added to that list.

![create_event](https://user-images.githubusercontent.com/100771925/210235492-299f9d34-54c4-4487-a9d0-26a0f7bcdbbc.jpg)
![create_event_2](https://user-images.githubusercontent.com/100771925/210235495-3c01351d-60ab-4724-90bd-8fe3156912f5.jpg)
![create_event_3](https://user-images.githubusercontent.com/100771925/210235502-de0d5a38-971f-412c-9d3f-1b137644dc63.jpg)


##### Web

***

#### Other Users' Profile

Other users' profile screen is just like user's own profile screen. Only difference is that biography cannot be changed in this screen.

##### Mobile
![other_profile_1](https://user-images.githubusercontent.com/100771925/210235555-7cd578cc-f35c-422e-9114-51ac08fe39b7.jpg)
![other_profile_2](https://user-images.githubusercontent.com/100771925/210235563-8e85fd0b-7fc5-405b-8d87-3ba7c9c9388e.jpg)
![other_profile_3](https://user-images.githubusercontent.com/100771925/210235566-d4ea2281-913b-40a8-83ec-9dcfb40a46c2.jpg)

##### Web

***

#### Settings

This screen is only available on our mobile application. Users can reach this screen by pressing the setting button at the right top in profile screen. From this screen, theme and language can be changed. Users can also reach our app info and social account info from this screen.

![settings_1](https://user-images.githubusercontent.com/100771925/210235612-43e8146c-25ad-487d-99d0-67542c1e39c1.jpg)
![settings_2](https://user-images.githubusercontent.com/100771925/210235622-eb3eabc1-6b61-47e4-8a05-e9a22ade7ff2.jpg)
![settings_3](https://user-images.githubusercontent.com/100771925/210235630-29e53216-178a-45e4-a442-f87d6d59c776.jpg)
![settings_4](https://user-images.githubusercontent.com/100771925/210235640-c78a6c9b-60ca-4a0c-930d-5d2e4794c49a.jpg)

***

### System Manual

The system manual is also available on our wiki [here](https://github.com/bounswe/bounswe2022group2/wiki/System-Manual).

#### Running Docker Compose Instructions

##### Backend

##### 1. Clone the project  
```    
git clone https://github.com/bounswe/bounswe2022group2.git 
```

##### 2. Navigate to the project  
```
    cd bounswe2022group2/learnify/
```

##### 3. Create a .env file
Your .env file shall include:

JWT_KEY: key to be used for jwt tokens generation.
MAIL: mailaddress the API uses, currently only gmail is supported.
MAIL_PASS: application password of MAIL, please refer to : https://support.google.com/mail/answer/185833?hl=en

You can contact us for getting MAIL and MAIL_PASS used for our Milestone 1 presentation.

#### Semantic server

You should add API key used for semantic analysis API, please contact us for the required .env file.

##### Frontend

No environment files are required.

### 1. Clone the project  
```    
git clone https://github.com/bounswe/bounswe2022group2.git 
```

##### 2. Navigate to the project  
```
    cd bounswe2022group2/learnify/
```

##### Getting the server up

`docker compose up` command will get our frontend and backend clients up and running on your local.


### Mobile

#### Installing with a Pre-made APK
1. Click the shared APK link on the device of your choice.
2. Download the file to your device.
3. Once the download is complete, click open file. The device will navigate you to installation.
4. If you get a "potentially harmful" warning, kindly ignore. We promise we are not hackers :)
5. Complete installation and the app will be installed just like all other apps.

#### Requirements for Creating APK

- Latest Stable version of Flutter
- Android Studio
- Android Device OR Android Emulator

#### Creating APK
##### 0. Check Requirements
Run 
```    flutter doctor ``` to ensure requirements are installed without a problem.

##### 1. Clone the project  
```    
git clone https://github.com/bounswe/bounswe2022group2.git
 ```

##### 2. Navigate to the project  
```
    cd bounswe2022group2/learnify/mobile 
```

##### 3. Create APK
```
   flutter build apk –-split-per-abi
```
This command creates 3 APK files in the repository:
> /build/app/outputs/apk/release/app-armeabi-v7a-release.apk  
> /build/app/outputs/apk/release/app-arm64-v8a-release.apk  
> /build/app/outputs/apk/release/app-x86_64-release.apk    

Running the command without `–-split-per-abi` command results in one large APK, which is not recommended as it includes binaries not native to the device.

##### 4. Prepare Device
Plug in your android device or start an emulator from Android Studio. Run `flutter devices` and observe flutter sees your device of choice.

##### 4. Install on Device
```
    flutter install
```
This may take a while. 



-------
Sources:
1. https://www.geeksforgeeks.org/how-to-build-and-release-flutter-application-in-android-device/
2. https://docs.flutter.dev/deployment/android

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
![CmpE451_ProjectPlan_Milestone3_page-0001](https://user-images.githubusercontent.com/92719802/210265560-e3f79908-0bd1-4725-a64f-6cab4d189a61.jpg)
![CmpE451_ProjectPlan_Milestone3_page-0002](https://user-images.githubusercontent.com/92719802/210265573-ae0e53a7-147a-431c-bf84-da36eacef2c6.jpg)
![CmpE451_ProjectPlan_Milestone3_page-0003](https://user-images.githubusercontent.com/92719802/210265575-1a999302-26e3-42bd-b986-32334221d028.jpg)
![CmpE451_ProjectPlan_Milestone3_page-0004](https://user-images.githubusercontent.com/92719802/210265576-04bd654a-be16-4624-9395-15269909f676.jpg)
![CmpE451_ProjectPlan_Milestone3_page-0005](https://user-images.githubusercontent.com/92719802/210265581-751df42f-cef0-43f8-81a2-d72004ec41a5.jpg)
![CmpE451_ProjectPlan_Milestone3_page-0006](https://user-images.githubusercontent.com/92719802/210265583-9e405884-c994-4e0f-aca9-a7cf1d239828.jpg)

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
 
 **Final Milestone-3**
 
 1. Implementing the backend connection for learning space preview box component and making it compatible for various types of learning spaces components/pages.
 2. Implementing my learning spaces part of the home page and making it user-specific, dynamic, and API connected component.
 3. Implementing popular spaces part of the home page and making it user-specific, dynamic, and API connected component.
 4. Implementing a standalone page for each user's own learning spaces.
 5. Implementing a standalone page for popular learning spaces across the application.
 6. Researching on and finding date/time input components for event form.
 7. Researching on and finding map picker components for event form that will be competible with geolocation standards.
 8. Implementing a standalone React component of a map picker that is connected to Google Maps API and compatible for geolocation standards.
 9. Implementing a user search component.
 10. Adding toggling search functionality to navigation bar.
 11. Implementing recommended learning spaces part of the home page and making it user-specific, dynamic, and API connected component.
 12. Implementing a standalone page for recommended learning spaces adaptive for each user.
 13. Researching on annotation packages that is used in our web application.
 14. Revising annotation component to make it compatible with W3C standards and establish a backend connection regarding to it.
 15. Writing unit tests for each component I have developed.
 16. Reviewing the works done by the frontend team on a regular basis.
 17. Solving bugs, errors, problems encountered during the implementation of the our web application regularly.
 18. Helping to teammates, answering their questions, solving critical bugs&errors, and providing hotfixes before the demo.
 19. Attending and participating general meetings regularly.
 20. Attending and participating frontend team meetings regularly.
 
--------------------

**Milestone-2**
 
  1. Providing and designing page and component layouts for better user interface and user experience.
  2. Building the main structure and layout of home page.
  3. Implementing the home page.
  4. Providing component logic for our web application.
  5. Implementing the footer component.
  6. Implementing the categories page.
  7. Implementing the backend connection between the categories page and our REST API.
  8. Implementing learning spaces by category page.
  9. Implementing the backend connection between the learning spaces by category page and our REST API.
  10. Providing a method for dynamic page routing.
  11. Implementing semantic search bar.
  12. Implementing the backend connection between the semantic search bar and our REST API.
  13. Implementing unit tests for categories page.
  14. Implementing unit tests for learning spaces by category page.
  15. Implementing unit tests for navigation bar and semantic search component.
  16. Conducting research on React libraries, frameworks, and methodologies that will be used during our development process.
  17. Reviewing the works done by the frontend team.
  18. Solving bugs, errors, problems encountered during the implementation of the frontend of our application regularly.
  19. Attending and participating general meetings regularly.
  20. Attending and participating frontend team meetings regularly.
 
--------------------

**Milestone-1**
 
  1. Designing the logo of our app and determining the typeface and color scheme that is used throughout the app.
  2. Building the main structure and layout of authentication pages.
  3. Implementing the sign up page.
  4. Implementing the validation check for the sign up form.
  5. Implementing the backend connection between the sign up page and our REST API.
  6. Implementing unit tests for the sign up page.
  7. Conducting research on React libraries, frameworks, and methodologies that will be used during our development process.
  8. Providing methods for validation.
  9. Providing methods for backend connection.
  10. Reviewing the works done by the frontend team.

## *Main Contributions:*
 
 
**Final Milestone-3**
 
I am a member of our frontend team for the development of our application, namely Learnify. As I did in the first and the second milestone, I continued to provide visual components of our web application according to the design guidelines we have determined together and in harmony with other components and pages of our web application. Before our weekly frontend team meetings I have regularly inspected our application's development's current state and provided necessary agenda for that week. I have also provided page layouts and visual components like icons, logos, or illustrations for our web application. I have provided flexible, dynamic, and compatible React components that can be used across our web application. I have finalized the home page with backend connection between the user-specific adaptive components and our REST API. I have implemented standalone pages for various learning space related categorical pages such as popular, recommended, user's own learning spaces. I have also added user search functionality to our web application and prvided a togglng search bar component, updating the navigation bar accordingly. I have implemented a form component for creating events that follows our design and theming guidelines as well as fitting the allocated space in the related part of our web application’s learning space page. I have also researched on tons of form input components especially for date/time pickers, map pickers, so that the event creation form would provide the best user experience while being compatible with geolocation standards. For that I have also developed a standalone map picker component that utilizes Google Maps API, with which users can select a location using a marker. I have also established backend connection for event form. Additionally, I have revised the annotation component and made it functioning according to W3C standards, while establishing its backend connection, especially for text annotations. I have also regularly provided css classes that satisfy our design guidelines for the components implemented by the whole frontend team. I have regularly helped my teammates to fix any erroneous part of their code, provided hotfixes, and tried to share them good practices that I have learned. Additionally, I have implemented unit tests for the components that I have created during the development of our web application’s frontend.

--------------------

**Milestone-2**
 
I am a member of our frontend team for the development of our application, namely Learnify. As I did in the first milestone, I continued to provide visual components of our web application according to the design guidelines we have determined together and in harmony with other components and pages of our web application. Before our weekly frontend team meetings I have regularly inspected our application's development's current state and provided necessary agenda for that week. I have also provided page layouts and visual components like icons, logos, or illustrations for our web application. I have also researched on icon library that we can use (Fontawesome) and implemented it so that the performance and loading times for our screens increase significantly by not trying to render each png file when loading. I have also researched n dynamic routing in React and provided an easy-to-use and effective solution to one of our biggest issues: overcoming hardcoding each url path in App.js. I have also provided a component based page layouting logic so that we can eaily import components and use them without repeating lines of code and be able to pass specific parameters to display components. Besides, I have implemented categories page, learning spaces by category page and semantic search component in the navigation bar. For each, I have implemented separate components, established backend connection, established dynamic routing and passed parameters to display components according to the response acquired from the REST API. I have also regularly provided css classes that satisfy our design guidelines for the components implemented by the whole frontend team. I have regularly helped my teammates to fix any erroneous part of their code, provided hotfixes, and tried to share them good practices that I have learned. Additionally, I have implemented unit tests for the components that I have created during the development of our web application’s frontend.

--------------------

**Milestone-1**
 
I am a member of our fronend team for the development of our application, namely Learnify. Generally, I took the responsibility of visual side of our web application. For that extent I have designed our logo, provided and appropriate typeface and color scheme using Adobe applications. Then, I have provided the general layout and structure of our authentication pages with appropriate theme. I was also responsible for the implementation of the sign up page from the scratch. Since any of us in the frontend team is not used to work with React,I have conducted very detailed research on how to connect pages, how to uses states, how to validate form inputs, how to handle API requests, and how to do unit testing. In the light of my findings I have implemented our sign up page: First the initial structure and layout, then the validation, then the backend connection, and last the unit testing. Additionaly I took care of the dockerization and the AWS deployment of our web application's frontend.
 

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

**Final Milestone-3**
 
 1. [Frontend: Learning Space Preview Box Backend Connection](https://github.com/bounswe/bounswe2022group2/issues/766)
 2. [Frontend: Create Event Component](https://github.com/bounswe/bounswe2022group2/issues/772)
 3. [Frontend: Unit Tests for Learning Space Preview Box](https://github.com/bounswe/bounswe2022group2/issues/788)
 4. [Frontend: Home Page My Learning Spaces Backend Connection](https://github.com/bounswe/bounswe2022group2/issues/791)
 5. [Frontend: Home Page Popular Learning Spaces Backend Connection](https://github.com/bounswe/bounswe2022group2/issues/792)
 6. [Frontend: My Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/issues/802)
 7. [Frontend: Unit Tests for My Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/issues/806)
 8. [Frontend: Popular Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/issues/808)
 9. [Frontend: Unit Tests for Popular Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/issues/819)
 10. [Frontend: User Search Component](https://github.com/bounswe/bounswe2022group2/issues/870)
 11. [Frontend: Custom Map Picker Component](https://github.com/bounswe/bounswe2022group2/issues/892)
 12. [Frontend: Recommended Learning Spaces Part in Home Page](https://github.com/bounswe/bounswe2022group2/issues/900)
 13. [Frontend: Recommended Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/issues/906)
 14. [Frontend: Text and Image Annotation Backend Connection](https://github.com/bounswe/bounswe2022group2/issues/918)
 
--------------------

**Milestone-2**
 
  1. [Frontend: Implementation of Home Page](https://github.com/bounswe/bounswe2022group2/issues/518)
  2. [Frontend: Implementation of Categories Page](https://github.com/bounswe/bounswe2022group2/issues/544)
  3. [Frontend: Implementation of Learning Spaces by Category Page](https://github.com/bounswe/bounswe2022group2/issues/605)
  4. [Frontend: HOTFIX Learning Space Page Structural Overflow](https://github.com/bounswe/bounswe2022group2/issues/636)
  5. [Frontend: Implementation of Semantic Search Bar](https://github.com/bounswe/bounswe2022group2/issues/652)
  6. [Frontend: Unit Tests for Categories Page](https://github.com/bounswe/bounswe2022group2/issues/673)
  7. [Frontend: Unit Tests for Learning Spaces by Categories Page](https://github.com/bounswe/bounswe2022group2/issues/679)
  8. [Frontend: Unit Tests for Navigation Bar and Semantic Search Component](https://github.com/bounswe/bounswe2022group2/issues/682)

--------------------

**Milestone-1**
 
  1. [Designing the Logo and Determining Color Scheme, Typeface of the Project](https://github.com/bounswe/bounswe2022group2/issues/353)
  2. [Frontend: Implementation of Sign Up Page](https://github.com/bounswe/bounswe2022group2/issues/376)
  3. [Frontend: Backend Connection for the Sign Up Page](https://github.com/bounswe/bounswe2022group2/issues/405)
  4. [Frontend: Adding Form Validations for Sign Up Form](https://github.com/bounswe/bounswe2022group2/issues/424)
  5. [Frontend: Unit Tests for Sign Up Page](https://github.com/bounswe/bounswe2022group2/issues/451)
  6. [Frontend: Dockerization of the Frontend](https://github.com/bounswe/bounswe2022group2/issues/412)
  7. [AWS Deployment of the Web Application](https://github.com/bounswe/bounswe2022group2/issues/459)

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

**Final Milestone-3**
 
 1. [Final Milestone: Web Application Scenario](https://github.com/bounswe/bounswe2022group2/issues/955)
 2. [Final Milestone: Summary of Work Table for Altay Acar](https://github.com/bounswe/bounswe2022group2/issues/973)
 3. [Final Milestone: Individual Contributions Report of Altay Acar](https://github.com/bounswe/bounswe2022group2/issues/977)
 
--------------------

**Milestone-2**
 
 1. [Documenting the Meeting Notes for the Frontend Meeting 2](https://github.com/bounswe/bounswe2022group2/issues/518)
 2. [Milestone-2: Status of Deliverables of Milestone 2](https://github.com/bounswe/bounswe2022group2/issues/718)
 3. [Milestone-2: User Interfaces for Web Application](https://github.com/bounswe/bounswe2022group2/issues/723)

--------------------

**Milestone-1**
 
  1. [Revising the Requirements Specification](https://github.com/bounswe/bounswe2022group2/issues/323)
  2. [Research & Report for Frontend Technologies (Frontend Team)](https://github.com/bounswe/bounswe2022group2/issues/327)
  3. [Documenting Meeting Notes for the Meeting 2 of CMPE 451](https://github.com/bounswe/bounswe2022group2/issues/328)
  4. [Revising the Requirements Specification: Notifications](https://github.com/bounswe/bounswe2022group2/issues/329)
  5. [Milestone 1: Review the Milestone](https://github.com/bounswe/bounswe2022group2/issues/482)
  6. [Milestone 1: Reviewing the Milestone - Progress](https://github.com/bounswe/bounswe2022group2/issues/489)

## *Pull Requests:*

**Final Milestone-3**
 
 1. [Frontend: Learning Space Preview Box BE Connection](https://github.com/bounswe/bounswe2022group2/pull/767)
 2. [Frontend: Unit Tests for the Learning Space Preview Box Component](https://github.com/bounswe/bounswe2022group2/pull/790)
 3. [Frontend: Home Page My Learning Spaces Backend Connection](https://github.com/bounswe/bounswe2022group2/pull/796)
 4. [Frontend: Home Page Popular Learning Spaces Backend Connection](https://github.com/bounswe/bounswe2022group2/pull/801)
 5. [Frontend: My Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/pull/805)
 6. [Frontend: Unit Tests for My Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/pull/807)
 7. [Frontend: Popular Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/pull/817)
 8. [Frontend: Unit Tests for Popular Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/pull/839)
 9. [Frontend: Create Event Component](https://github.com/bounswe/bounswe2022group2/pull/767)
 10. [Frontend: User Search Component](https://github.com/bounswe/bounswe2022group2/pull/881)
 11. [Frontend: Recommended Learning Spaces in Home Page](https://github.com/bounswe/bounswe2022group2/pull/902)
 12. [Frontend: Recommended Learning Spaces Page](https://github.com/bounswe/bounswe2022group2/pull/909)
 13. [Frontend: Annotation BE Connection](https://github.com/bounswe/bounswe2022group2/pull/922)
 
--------------------

**Milestone-2**
 
1. Frontend: Implementation of Home Page [#536](https://github.com/bounswe/bounswe2022group2/pull/536)
2. Frontend: Implementation of Categories Page [#571](https://github.com/bounswe/bounswe2022group2/pull/571)
3. Frontend: Learning Spaces by Category Pages Implementation [#633](https://github.com/bounswe/bounswe2022group2/pull/633)
4. Frontend: HOTFIX Learning Space Page Structural Overflow [#637](https://github.com/bounswe/bounswe2022group2/pull/637)
5. Frontend: Semantic Search Bar Implementation [#655](https://github.com/bounswe/bounswe2022group2/pull/655)
6. Frontend: Unit Tests for Categories Page [#676](https://github.com/bounswe/bounswe2022group2/pull/676)
7. Frontend: Unit Tests for Learning Spaces by Category Page [#680](https://github.com/bounswe/bounswe2022group2/pull/680)
8. Frontend: Unit Tests for Navigation Bar and Semantic Search Component [#684](https://github.com/bounswe/bounswe2022group2/pull/684)

--------------------

**Milestone-1**
 
1. Frontend: Sign up page implementation [#387](https://github.com/bounswe/bounswe2022group2/pull/387)
2. Dockerization of Frontend [#413](https://github.com/bounswe/bounswe2022group2/pull/413)
3. Frontend: Sign Up Form Validation [#426](https://github.com/bounswe/bounswe2022group2/pull/426)
4. Frontend: Backend connection for sign up page [#438](https://github.com/bounswe/bounswe2022group2/pull/438)
5. Frontend: Unit tests for sign up page [#456](https://github.com/bounswe/bounswe2022group2/pull/456)

## *Unit Tests:*

**Final Milestone-3**
 
 1. Unit Tests for the Learning Space Preview Box Component [#790](https://github.com/bounswe/bounswe2022group2/pull/790)
 2. Unit Tests for My Learning Spaces Page [#807](https://github.com/bounswe/bounswe2022group2/pull/807)
 3. Unit Tests for Popular Learning Spaces Page [#839](https://github.com/bounswe/bounswe2022group2/pull/839)
 
--------------------

**Milestone-2**

1. Unit Tests for Categories Page [#676](https://github.com/bounswe/bounswe2022group2/pull/676)
2. Unit Tests for Learning Spaces by Category Page [#680](https://github.com/bounswe/bounswe2022group2/pull/680)
3. Unit Tests for Navigation Bar and Semantic Search Component [#684](https://github.com/bounswe/bounswe2022group2/pull/684)

--------------------

**Milestone-1**

1. Unit Tests for Sign Up Page [#456](https://github.com/bounswe/bounswe2022group2/pull/456)

## *Additional Information:*  
 
**Final Milestone-3**
 
 None
 
--------------------

**Milestone-2**
 
 None

--------------------

**Milestone-1**
 
 None

---------------

## *Member:*  

Name: Egemen Atik

Group: Group2 - Android/Mobile Team

## *Responsibilities:*
 
 **Final Milestone-3**
 
 1. Implementing create event screen
 2. Implementing date picker and time picker components of create event screen
 3. Implementing geolocation selector map component of create event screen
 4. Implementing backend conection for create event functionality
 5. Implementing backend connection for attend event functionality
 6. Implementing revision in home screen
 7. Implementing backend connection for getting top rated learning spaces
 8. Implementing backend connection for getting recommended learning spaces
 9. Translating texts in the application to a number of languages
 10. Preparing user manual for our mobile and web applications
 11. Adding software requirements specification to final milestone report
 12. Adding UML diagrams(use-case, class and sequence diagrams) to final milestone report
 13. Adding user scenarios and mockups to final milestone report
 14. Adding individual report to final milestone report
 15. Reviewing work done by mobile team members
 16. Solving bugs, errors, problems encountered during the implementation of the our mobile application regularly.
 17. Helping to teammates, answering their questions, solving critical bugs&errors, and providing hotfixes before the demo.
 18. Attending and participating general meetings regularly.
 19. Attending and participating mobile team meetings regularly.
 20. Creating realistic and logical learning spaces and posts for our demo presentation
 21. Controlling mobile application during mobile application presentation
 
--------------------

**Milestone-2**
 
  1. Implementing information part of learning space detail screen.
  2. Implementing add post screen.
  3. Implementing edit post screen.
  4. Implementing enroll button and back-end connection for enroll functionality.
  5. Implementing back-end connection for add post functionality.
  6. Implementing back-end connection for edit post functionality.
  7. Implementing back-end connection for getting taken learning spaces.
  8. Implementing back-end connection for getting all learning spaces.
  9. Implementing dynamic sizing for learning space detail screen.
  10. Implementing routing between create learning space and learning space detail screens.
  11. Implementing post model and necessary request&response models for corresponding back-end connections.
  12. Implementing argument passing to edit post screen so that title and content of the post to be edited is present in the edit post screen.
  13. Implementing argument passing to learning space detail screen.
  14. Conducting research on Flutter libraries and methodologies that will be used during our development process.
  15. Reviewing the works done by the mobile team.
  16. Solving bugs, errors, problems encountered during the implementation of the mobile part of our application regularly.
  17. Attending and participating general meetings regularly.
  18. Attending and participating mobile team meetings regularly.
  19. Attending to customer meetings and lectures regularly.
 
--------------------

**Milestone-1**
 
  1. Implementing verification screen for mobile application.
  2. Implementing "resend code" functionality and countdown timer in verification screen.
  3. Providing backend connection for verification screen.
  4. Implementing verification screen tests and verification network tests.
  5. Implementing horizontal scrollable course preview list widget for home screen.
  6. Reviewing and testing work done by other mobile team members.
  7. Revising Requirements & UML design related to Lecture Structure
  8. Learning flutter, flutter testing. 

## *Main Contributions:*
 
 
**Final Milestone-3**
 
I am a part of our mobile development team for our application, namely Learnify. We did not have much time between second milestone and final milestone, but in this short period of time we managed to develop necessary features for our mobile application. We have already developed and presented very important features for our project like annotations, post creating/editing, annotation viewing, semantic search, searcinh users/learning spaces. For this milestone, we focused on correcting our annotation model and developing event creation feature. I mostly dealed with implementing create event screen. I implemented a form for title, description, participation limit and duration of event. Then, I implemented a date picker and a time picker. I made it start from the current date by default, I also made programmed it in a way that it does not accept already passed dates and/or times. Lastly, I implemented a geolocation selector map for users to specify a geolocation. I also implemented backend connection for create event and attend event functionalities. I implemented all necessary routings, dynamic data changing. Then, I prepared the user manual. Lastly, I tried to help my teammates all the time and tried to review the work done by them, tried toa attend sessions to fix bugs.

--------------------

**Milestone-2**
 
I am a part of our mobile development team for our application, Learnify. Since the beginning of this semester, we are developing our application step by step. In our first milestone demo, we focused on authentication screens of our application and provided them. Since we had time left after implementing those screens, we started to work on our second milestone screens back then. For our second milestone, we decided to focus on annotations in our mobile application, mostly. So, we divided necessary tasks to our mobile team members and our most experienced member was assigned with annotations, I, on the other hand, was assigned with implementing learning space detail, add post and edit post screens. In summary, for our second milestone demo, I implemented informations part of learning space detail screen, add post screen, edit post screen(with title and content of the post to be edited is already present in corresponding input fields), enroll button and back-end connection for enroll functionality, back-end connection for add post functionality, back-end connection for edit post functionality, back-end connection for getting taken learning spaces, back-end connection for getting all learning spaces, dynamic sizing in learning space detail screen, routing between create learning space and learning space detail screens, post model and necessary request&response models for corresponding back-end connections. During this time, I also tried to solve bugs and review codes written by my teammates, regularly.

--------------------

**Milestone-1**
 
I am one of the four members in our application's, Learnify, mobile development team. We chose using Flutter as our main technology in mobile development. Since I did not use Flutter prior to this, my first task was getting familiar with Flutter and Dart. I set up my environment and tried to understand the basics of Flutter, learn how to program effectively with Flutter. Later, as a team we all voted for our application's name, main theme(colors, fonts) and logo just before we started our implementations.

Then, I have been assigned with implementing the verification screen of our mobile application. In verification screen; I implemented four input boxes for users to enter the verification code they received, a "verify" button to confirm the verification code(it gets activated when remaining time is bigger than 0 and all four input fields are filled), a countdown timer informing user about validity period of the code they received, a description for verification screen and a "request another code" button which resets the timer and sends another verification code to user. I also implemented correct navigation routes. Finally, I provided back-end connection, widget tests and network tests to our verification screen. While providing the back-end connection, I implemented necessary response and request models and functions like "VerifyEmailRequest" model, "VerifyEmailResponse" model. I also researched about testing in Flutter and implemented my tests.

Then, I implemented a horizontal scrollable course preview list widget for our home page. It is not crucial for this demo session, since it only contains mock data for now; but in the next demo sessions, it will have a more important role.
 

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

**Final Milestone-3**
 
 1. [Mobile: Implementing Create Event Screen](https://github.com/bounswe/bounswe2022group2/issues/842)
 2. [Mobile: Backend Connection For Create Event Screen](https://github.com/bounswe/bounswe2022group2/issues/873)
 3. [Mobile: Implement geolocation selection screen](https://github.com/bounswe/bounswe2022group2/issues/887)
 4. [Mobile: Backend Connection for Attend Event](https://github.com/bounswe/bounswe2022group2/issues/911)
 5. [Mobile: Revision in the Home Screen](https://github.com/bounswe/bounswe2022group2/issues/916)
 6. [Mobile: Translate texts in the application to other languages](https://github.com/bounswe/bounswe2022group2/issues/919)
 
--------------------

**Milestone-2**
 
  1. [Mobile: Implementing Information Section of Learning Space Detail Screen](https://github.com/bounswe/bounswe2022group2/issues/524)
  2. [Mobile: Enhancement on Learning Space Detail Screen](https://github.com/bounswe/bounswe2022group2/issues/616)
  3. [Mobile: Implementing Add/Edit Post Screen](https://github.com/bounswe/bounswe2022group2/issues/618)
  4. [Mobile: Backend Connection For Taken Learning Spaces and Recommended Learning Spaces](https://github.com/bounswe/bounswe2022group2/issues/634)
  5. [Mobile: Backend Connection For Add/Edit Post](https://github.com/bounswe/bounswe2022group2/issues/645)

--------------------

**Milestone-1**
 
  1. [Mobile: Implementing Verification Screen #395](https://github.com/bounswe/bounswe2022group2/issues/395)
  2. [Mobile: Writing Tests for Verification Screen #417](https://github.com/bounswe/bounswe2022group2/issues/417)
  3. [Mobile: Back-end Connection of Verification Endpoint #434](https://github.com/bounswe/bounswe2022group2/issues/434)
  4. [Mobile: Writing Network Connection Tests for Verification Screen #454](https://github.com/bounswe/bounswe2022group2/issues/454)
  5. [Mobile: Scrollable Horizontal Course List Widget For Home Screen #457](https://github.com/bounswe/bounswe2022group2/issues/457)

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

**Final Milestone-3**
 
 1. [Final Milestone: UML Diagrams, SRS, User Scenarios and Mockups](https://github.com/bounswe/bounswe2022group2/issues/946)
 2. [Final Milestone: User Manual](https://github.com/bounswe/bounswe2022group2/issues/951)
 3. [Final Milestone: Individual Contributions Report of Egemen Atik](https://github.com/bounswe/bounswe2022group2/issues/988)
 
--------------------

**Milestone-2**
 
 1. [Milestone-2 Report: Progress According To Requirements](https://github.com/bounswe/bounswe2022group2/issues/705)
 2. [Milestone-2 Report: Individual Report](https://github.com/bounswe/bounswe2022group2/issues/706)

--------------------

**Milestone-1**
 
 1. [Update Personal Wiki Pages #324](https://github.com/bounswe/bounswe2022group2/issues/324)
 2. [Update Requirements Page #325](https://github.com/bounswe/bounswe2022group2/issues/325)
 3. [Revising the Requirements: Lecture Structure #341](https://github.com/bounswe/bounswe2022group2/issues/341)
 4. [Revising the Diagrams based on Lecture Structure #347](https://github.com/bounswe/bounswe2022group2/issues/347)
 5. [Documenting Meeting Notes for the Meeting 4 of CMPE 451 #425](https://github.com/bounswe/bounswe2022group2/issues/425)
 6. [Documenting Meeting Notes for the Meeting 2 of Mobile Team #427](https://github.com/bounswe/bounswe2022group2/issues/427)

## *Pull Requests:*

**Final Milestone-3**
 
 1. [Mobile: Create event screen](https://github.com/bounswe/bounswe2022group2/pull/869)
 2. [Mobile: Create event backend connection](https://github.com/bounswe/bounswe2022group2/pull/880)
 3. [Mobile: Geolocation selection widget](https://github.com/bounswe/bounswe2022group2/pull/897)
 4. [Mobile: Attend event backend connection](https://github.com/bounswe/bounswe2022group2/pull/914)
 5. [Mobile: Home screen revision](https://github.com/bounswe/bounswe2022group2/pull/917)
 6. [Mobile: Translate texts](https://github.com/bounswe/bounswe2022group2/pull/920)
 7. [Translate newly added words](https://github.com/bounswe/bounswe2022group2/pull/926)
 8. [Final milestone: Add software requirements specification, UML diagrams, user scenarios and mockups to report](https://github.com/bounswe/bounswe2022group2/pull/947)
 9. [Add user manual](https://github.com/bounswe/bounswe2022group2/pull/984)
 
--------------------

**Milestone-2**
 
 1. Mobile: Implementation of learning space information section [#528](https://github.com/bounswe/bounswe2022group2/pull/528)
 2. Mobile: Learning space detail enhancement [#587](https://github.com/bounswe/bounswe2022group2/pull/587)
 3. Mobile: Post add and edit screens [#623](https://github.com/bounswe/bounswe2022group2/pull/623)
 4. Mobile: Getting taken and recommended learning spaces backend connection [#642](https://github.com/bounswe/bounswe2022group2/pull/642)
 5. Mobile: Backend connection for add and edit post functionalities [#649](https://github.com/bounswe/bounswe2022group2/pull/649)
 6. Mobile: Fix overflow error in enroll button and form fields in ls create/edit and post add/edit [#667](https://github.com/bounswe/bounswe2022group2/pull/667)

--------------------

**Milestone-1**
 
 1. Mobile/verification screen [#416](https://github.com/bounswe/bounswe2022group2/pull/416)
 2. Mobile/verification screen tests [#432](https://github.com/bounswe/bounswe2022group2/pull/432)
 3. Mobile: Back-End Connection of Verification Screen [#435](https://github.com/bounswe/bounswe2022group2/pull/435)
 4. Mobile: Verification screen network tests [#455](https://github.com/bounswe/bounswe2022group2/pull/455)
 5. Mobile: Scrollable horizontal course list widget for home screen [#462](https://github.com/bounswe/bounswe2022group2/pull/462)

## *Unit Tests:*

**Final Milestone-3**
 
None

--------------------

**Milestone-2**

None

--------------------

**Milestone-1**

 1. Mobile: Verification screen tests [#432](https://github.com/bounswe/bounswe2022group2/pull/432)
 2. Mobile: Verification screen network tests [#455](https://github.com/bounswe/bounswe2022group2/pull/455)

## *Additional Information:*  
 
**Final Milestone-3**
 
 I attended all lecture hours, customer meetings(PS hours), general group meetings and mobile team meetings since the beginning of the semester. I also participated in our final milestone presentation, I controlled our application from my mobile phone during our mobile application presentation.
 
--------------------

**Milestone-2**
 
 I attended all lecture hours, customer meetings(PS hours), general group meetings and mobile team meetings since the beginning of this semester.

--------------------

**Milestone-1**
 
 I participated in all lecture hours, PS hours, general team meetings and mobile team meetings and shared my opinions in those gatherings to help building our application.

---------------

## *Member:*  

Name: Ezgi Aysel Batı

Group: Group2 - Android/Mobile Team

## *Responsibilities:*
### Final Milestone
 1. Implementing View All Comments Screen
 2. Implementing add comment to post feature
 3. Implementing comment model and all related backend connections
 4. Providing realistic content for the application
 5. Reviewing and testing the works done by the mobile team.
 6. Helping mobile members with bugs they encounter and parts they struggle to implement via additional discord meetings.
 7. Helping demo preparations and scenario outline 
 8. Attending and participating general meetings regularly.
 9. Attending and participating in mobile team meetings regularly.
### Milestone 2  
1. Implementing Create Learning Space screen
2. Implementing Discussions Screen
3. Implementing Annotations Screen (the screen that displays all annotations when you click on the highlighted part)
4. Implementing Learning Space model
5. Implementing text item widget.
6. Implementing service for Learning Space related requests.
7. Implementing the backend connection between the create learning space screen and our REST API.
8. Implementing Learning Space Forum screen
9. Providing mock data for discussion forum and randomizing it for realistic usage view
10. Integrating LS Icons of Frontend to mobile as assets
11. Reviewing the works done by the mobile team.
12. Helping mobile members with bugs they encounter and parts they struggle to implement via discord meetings.
13. Presenting mobile section of the demo
14. Attending and participating general meetings regularly.
15. Attending and participating in mobile team meetings regularly.
16. Implementing the backend connection to get category options from our REST API.
17. Additional to meetings communicated with some backend and frontend members to make sure our development process is aligned.
 ### Milestone 1
1. Implementing forget password screen and backend connection for mobile.
2. Implementing Course Preview widget which is the main component of mobile home page.
3. Implementing unit & widget tests.
4. Reviewing and testing work done by other mobile team members.
5. Revising Requirements & UML design related to User-Lecture interactions
6. Writing System Manual for Mobile.
7. Learning flutter, flutter testing.

## *Main Contributions:*
 As a member of mobile team, I have developed several screens, models, a service and tests. I worked on implementing the forgot password screen, its connection to the backend endpoint send verification code and also unit/widget tests. I also worked on creating a custom part that displays a preview of courses, which is the main part of home page as well as the main component of search results. Similarly I have implemented Create Learning Space screen, comments screen, comment creation feature, annotations screen, (static due to time restrictions) discussions part and all backend connections related to these. I have created the initial models for Learning Space and Comment on mobile, and the LS service.  I had no prior knowledge of flutter or mobile development, so all my implementation comes with additional research and learning efforts. I attended most lectures, ps'es, mobile & general team meetings. I participated actively especially regarding future planning. I have also reviewed and tested my teammates' works both in terms of code correctness and functionality. Held bug fix sessions with other new learning mobile members to solve parts we struggle to develop or test for bugs. I also did lots of research about unit testing in flutter as I came across a special case problem. I presented the mobile parts in the first two customer demos, and helped with scenario preparations and content creation for the final presentation.

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:
 
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |Mobile: Add Comments to a Post | [#821](https://github.com/bounswe/bounswe2022group2/issues/821) | 6 hr |
  |Mobile: View All Comments| [#885](https://github.com/bounswe/bounswe2022group2/issues/885)| 2 hr|
  |Mobile: Implementing Create/Edit Learning Space Screen|[#510](https://github.com/bounswe/bounswe2022group2/issues/510)| 6 hr | 
  |Mobile: Implementing Annotation Screen|[#560](https://github.com/bounswe/bounswe2022group2/issues/560)| 2.5 hr |  
  |Mobile: Backend Connection of Create Learning Space|[#570](https://github.com/bounswe/bounswe2022group2/issues/570)| 2 hr |  
  |Mobile: Get Categories from Backend|[#586](https://github.com/bounswe/bounswe2022group2/issues/586)| 1 hr |  
  |Mobile: Implementing Forget Password Screen #375|[Issue](https://github.com/bounswe/bounswe2022group2/issues/375)| 4 hr |
  |Mobile: Custom Widget For Course Preview #408|[Issue](https://github.com/bounswe/bounswe2022group2/issues/408)| 5 hr|


* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:
  |Issue Title|Link|Time Consumption|
  |-----|:--------:|:--------:|
  |**Final Milestone 3**|-|-|
  |Documenting Meeting Notes for the Meeting 7 of CMPE 451| [#698](https://github.com/bounswe/bounswe2022group2/issues/698) | 30 min |
  |Final Milestone: User Interface / User Experience|[#962](https://github.com/bounswe/bounswe2022group2/issues/962)|1.5 hr|
  |Final Milestone: System Manual|[#961](https://github.com/bounswe/bounswe2022group2/issues/961)| 15 min |
  |Requirements Revision|[#678](https://github.com/bounswe/bounswe2022group2/issues/678)| 2 hr |
  |Updating ReadMe #317|[Issue](https://github.com/bounswe/bounswe2022group2/issues/317)| 20 min |
  |Revising the Diagrams based on User - Lecture Interaction #343|[Issue](https://github.com/bounswe/bounswe2022group2/issues/343)| 20 min |
  |Writing System Manual For Mobile #407|[Issue](https://github.com/bounswe/bounswe2022group2/issues/407)| 20 min |

## *Pull Requests:*  
  |Pull Request Title|Link|
  |-----|:--------:|
  |**Final Milestone 3**|-|
  |Mobile: post comments |https://github.com/bounswe/bounswe2022group2/pull/826|
  |hotfix - fix profile username |https://github.com/bounswe/bounswe2022group2/pull/930|
  |**Milestone 2**|-|
  |Mobile: create edit Learning Space screen|[#565](https://github.com/bounswe/bounswe2022group2/pull/565)|  
  |Mobile/create ls backend | [#585](https://github.com/bounswe/bounswe2022group2/pull/585)|  
  |Mobile: Annotation Screen - 560 | [#613](https://github.com/bounswe/bounswe2022group2/pull/613)|
  |Mobile: LS Forum | [#622](https://github.com/bounswe/bounswe2022group2/pull/622)|  
  |Mobile: create ls image selection | [#640](https://github.com/bounswe/bounswe2022group2/pull/640) |
  |**Milestone 1**|-|
  |Mobile/forget password screen|[#382](https://github.com/bounswe/bounswe2022group2/pull/382)|
  |Mobile: course preview widget |[#430](https://github.com/bounswe/bounswe2022group2/pull/430)|
  |Mobile: forget password backend|[#433](https://github.com/bounswe/bounswe2022group2/pull/433)|
  |Mobile: implement tests for forget password|[#442](https://github.com/bounswe/bounswe2022group2/pull/442)|

## *Unit Tests:*
 Widget and Network tests for forget password screen: #442
 Widget tests for Create LS Screen: https://github.com/bounswe/bounswe2022group2/blob/mobile/create-ls-tests/learnify/mobile/test/create_ls_test.dart
 Create LS Screen tests have not been merged to the master branch as the futureInit() function used in this screen causes automated tests to fail. After 7-8 hours and 300+ lines of bug fixing attempts I gave up on it. The screen works and the tests are written properly. They just fail automated testing.

---------------

## *Member:*  

Name: Mehmet Batuhan Çelik

Group: Group2 - Backend Team

## *Responsibilities:*
 
**Milestone-3**
 1. Perform research about W3 gelolocation model, design an API endpoint using this model and verify its satisfying customer requirements during meetings w/ customer Alper Ahmetoglu.
2. Implement the designed API endpoint.
3. Implement semantic recommendations using our semantic engine, serve the results from our back-end using a proxy endpoint.
4. Annotations dockerization and deployment, working with Ecenur.
5. Design of API interface regarding profile pages.
6. Implementation of the designed profile page endpoints.
7. Testing the implemented endpoints.
8. Maintaining and updating the previously implemented tests.
9. Server maintanence for frontend and backend servers.
10. Solving bugs, errors, problems encountered during the implementation of backend and create hotfixes when needed.
11. Attending and participating general meetings regularly.
12. Organising, attending and participating backend team meetings regularly.

**Milestone-2**
 
1. Perform research about semantic search methods, find a computationally feasible method to add sementic search functionality to our project, implement the semantic search microservice, dockerize the microservice and finally create an endpoint on main app to serve the results.
2. Understand the W3 annotation model and contribute to the system design of the annotations.
3. Find a cost efficient way to deploy our application, since frontend container is huge, free tier EC2 instances were not sufficient to deploy them, so I had to create a multi instance architecture and set up docker-hub for our team.
4. Communicate with the front and backend teams to design the API according to their needs.
5. Implement the API specification determined with the other team members.
6. Database management, add, delete elements and run migrations when requested by other members.
7. Reviewing the works done by the backend team.
8. Solving bugs, errors, problems encountered during the implementation of backend and create hotfixes when needed.
9. Attending and participating general meetings regularly.
10. Organising, attending and participating backend team meetings regularly.
 
 
**Milestone-1**
 
  1. Building the main structure of the Node Js project.
  2. Implementing core components: Mongoose loader, Express loader, in-memory database for testing.
  3. Preparing detailed action plan for project 1.
  4. Implementing sign up endpoint.
  5. Writing tests of the sign up endpoint.
  6. Creating the api definition for auth endpoints.
  7. Dockerizing the Backend.
  8. Connecting a docker-compose file to serve the backend container with a MongoDB container alongside.
  9. Overvising the frontend dockerization and integration to project docker-compose structure.
  10. Deploying the project to the AWS using EC2 and maintaining it.
  11. Reviewing work of backend team members. 
 
 
## *Main Contributions:*
 
 **Milestone-3**
 
 During milestone 2, I was focused on researching and high complexity implementation of semantic search engine, during this milestone, as a team we shifted our focus to complete simpler functioanlities. I supported that effort by implementing back-end side of 2 functionalities: envets and profile pages. I researched a cost effective method for profile pages instead of the general S3 buckets implementations and introduced base64 encoded images to the team. At the events side, I understood the W3 geolocation format and designed the endpoint accordingly. 
 
On top of those, some hotfixes rendered some of our tests deprecated, I gone over them and made the necessary updates.
 
Finally, I created a recommendation logic in the semantic search engine using the BERT encodings of the learning spaces and created a proxy endpoint to serve the reccomendation functionality in our API.
 
 During this process, I keep the strong communication with the front and mobile teams and tried to answer their needs to my full capabilities. 
 
 At some point, I was not sufficient the only server maintainer of the team so I teached Ece the dev-ops operations of our API. We deployed the annotation service together, starting from creating an instance and all the way up to managing the database from mongosh. Then, we seperated the server maintanence responsibilities. 
 
 **Milestone-2**
 
 As a member of backend team, I established a strong communication with the frontend and backend teams to design an API specification statisfying their needs and complying with the backend development conventions. Of course I took part in implementation of that API.

Most of this milestone went by researching. I had to put in lots of hours to understand different semantic search algorithms and find methods to implement them in our application. I learned about semantic search databases and found some open source implementations (Open semantic search was the most remarkable one), then, deployed them in docker containers just to see the smallest one required at least 4 GBs of memory. Accepting defeat, I looked for an API that would provide BERT encodings to me. Those types of APIs are not frequent since most companies provided whole data processing APIs instead of giving just encodings. This business model is fine for companies but getting this service free is out of question since it is a costly operation. In the end I tried 8 different services to find a solution we can integrate to our application easily.

Besides semantic search, even though I did not contributed code to the annotations part of our application, I gone through the annotation model doccumentation with Ecenur and made sure our interface complied with the model. While ecenur was sick, I was taking care of the annotations part, during this duration, I found some open source implementations to get inspiration from. In the end I contributed to the annotations part with my understanding of the model.

When everything was implemented, we found out that our frontend was too resource hungry to be deployed on a free tier EC2. In addition to that we now had a semantic search microservice. In the end, our system architecture had to be revised. I made those revisions and deployed the new architecture without problems.
 
  **Milestone-1**
 
 I took an active part in team management: came up with the project plan, talked with the customer personally to create a feasible plan, designed API definition and project architecture with Bahrican while keeping needs of front and backend in mind. I created the server implementation structure editing the practice-app's structure. I set up the connecting to database process such that it recognizes when it should use docker network, connect to and actual server and create a in-memory volatile database for testing purposes. After creating the development environment for backend, I implemented the signup endpoint with its tests. After it is implemented I used it as a base case to implement the docker file for the backend and optimized it for fast building. Then created a docker compose file to connect my container to a MongoDB container using docker network. After the dockerization of backend is complete, working with Altay, I took part in dockerization of the frontend. Then, set up the EC2 instance with Ellastic IP and required security settings. Since we do not have github actions, I became the github actions myself via being online and taking action whenever a hardfix is needed. After those ended, I implemented a migration and mock courses endpoint to add mockup data to the database and from provide dataflow  from database to mocking pages.
 
 On top of that, I was active in all of the meetings and PSes.

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:
 
 **Milestone-3**
 
 |Issue Title|Link| Time consumption|
 |-----|:--------:|:--------:|
 |Learning space recomendation endpoint|[888](https://github.com/bounswe/bounswe2022group2/issues/888)|2 hours|
 |Event Participation functionality for backend|[828](https://github.com/bounswe/bounswe2022group2/issues/828)|1 hours|
 |Implementation of profile page for backend|[797](https://github.com/bounswe/bounswe2022group2/issues/797)|3 hours|
  |Event Enpoints implementation|[780](https://github.com/bounswe/bounswe2022group2/issues/780)|4 hours|

 
 **Milestone-2**
 
  |Issue Title|Link| Time consumption|
  |-----|:--------:|:--------:|
  |POST /learningspace endpint implementation|[532](https://github.com/bounswe/bounswe2022group2/issues/532)|4 hours|
  |GET /categories endpoint implementation|[551](https://github.com/bounswe/bounswe2022group2/issues/551)|2 hours|
  |Semantic search implementation for backend|[566](https://github.com/bounswe/bounswe2022group2/issues/566)|30 hours|
  |Getters for the learningspace|[574](https://github.com/bounswe/bounswe2022group2/issues/574)|2 hours|
  |Getters for learningspaces : random ls getter for main page.|[615](https://github.com/bounswe/bounswe2022group2/issues/615)|1 hour|
  |GET learning spaces using user information|[619](https://github.com/bounswe/bounswe2022group2/issues/619)|2 hours|
 
  **Milestone-1**
 
  |Issue Title|Link| Time consumption|
  |-----|:--------:|:--------:|
  |Documentation of meeting notes 1 of CMPE451 #309|[Issue](https://github.com/bounswe/bounswe2022group2/issues/309)|1 hours|
  |Update Project plan for upcoming semester #316|[Issue](https://github.com/bounswe/bounswe2022group2/issues/316)|4 hours|
  |Revising non functional requirements #339|[Issue](https://github.com/bounswe/bounswe2022group2/issues/339)|1 hour|
  |Backend: Initialization of backend project #351|[Issue](https://github.com/bounswe/bounswe2022group2/issues/351)|1 hour|
  |Backend: Dockerization of the API #355|[Issue](https://github.com/bounswe/bounswe2022group2/issues/355)|1 hour|
  |Backend: Sign up endpoint #365|[Issue](https://github.com/bounswe/bounswe2022group2/issues/365)|3 hours|
  |Backend: AWS deployment of backend #423|[Issue](https://github.com/bounswe/bounswe2022group2/issues/423)|1 hour|
  |Backend: GET /courses(mock endpoint) #437|[Issue](https://github.com/bounswe/bounswe2022group2/issues/437)|1 hour|
 

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:
 
  **Milestone-2**
 
   1. [Milestone 2 release documentation](https://github.com/bounswe/bounswe2022group2/issues/713)
 
 **Milestone-1**
 
  1. [Update the project plan for the semester](https://github.com/bounswe/bounswe2022group2/issues/316)
  2. [Documentation of the meeting notes for Meeting 1](https://github.com/bounswe/bounswe2022group2/issues/309)
  3. [Revising non functional requirements](https://github.com/bounswe/bounswe2022group2/issues/339)
  4. [Research and Report Backend Technologies](https://github.com/bounswe/bounswe2022group2/issues/321)
  5. [Update the project plan for milestone 1](https://github.com/bounswe/bounswe2022group2/issues/448)
  6. [Dockerization of the frontend](https://github.com/bounswe/bounswe2022group2/issues/412)
 
  Even though I am not the assignee of this one, I helped Altay greatly with docker issues at 6.

## *Pull Requests:*
 
 **Milestone-3**
 
 |Pull Request Title|Link|Time consumption|
 |-----|:--------:|:-----:|
 |learning space recommendation endpoint|[889](https://github.com/bounswe/bounswe2022group2/issues/889)|2 hours|
  |Revision of tests : POST /auth/signup , POST /learningspace, POST /events, POST /events/participate/:eventId|[878](https://github.com/bounswe/bounswe2022group2/issues/878)|5 hours|
  |Event participation functionality for backend|[829](https://github.com/bounswe/bounswe2022group2/issues/829)|1 hours|
 |implementation of profile page for the backend|[820](https://github.com/bounswe/bounswe2022group2/issues/820)|3 hours|
 |Event endpoints implementation: Create event and getters|[794](https://github.com/bounswe/bounswe2022group2/issues/794)|3 hours|
 
 
  **Milestone-2**
 
  |Pull Request Title|Link|Time consumption|
  |-----|:--------:|:-----:|
  |POST /learningspace implementation|[540](https://github.com/bounswe/bounswe2022group2/issues/540)|4 hours|
  |get categories endpoint implementation and categories logic in learning spaces|[556](https://github.com/bounswe/bounswe2022group2/issues/556)|4 hours|
  |Semantic search implementation for backend|[573](https://github.com/bounswe/bounswe2022group2/issues/573)|30 hours|
  |Getters for the learning spaces|[575](https://github.com/bounswe/bounswe2022group2/issues/575)|2 hours|
  |615 getters for learningspaces: get most participated learning spaces if a query is not given|[617](https://github.com/bounswe/bounswe2022group2/issues/617)|1 hours|
  |GET endpoints regarding user and learningspace relation|[621](https://github.com/bounswe/bounswe2022group2/issues/621)|2 hours|
  |Milestone 2: Merge dev to master(Getting release)|[670](https://github.com/bounswe/bounswe2022group2/issues/670)|1 hour|
 
 **Milestone-1**
 
  |Pull Request Title|Link|Time consumption|
  |-----|:--------:|:-----:|
  |351 initialization of the backend project |[#352](https://github.com/bounswe/bounswe2022group2/pull/352)|1 hour|
  |365 sign up endpoint |[#366](https://github.com/bounswe/bounswe2022group2/pull/366) [#391](https://github.com/bounswe/bounswe2022group2/pull/391)|[#428](https://github.com/bounswe/bounswe2022group2/pull/428)|3 hours|
  |355 dockerization of the api |[#367](https://github.com/bounswe/bounswe2022group2/pull/367)|1 hour|
  |hotfix: usermodel update|[#436](https://github.com/bounswe/bounswe2022group2/pull/436)|30 minutes|
  |return mock course data|[#443](https://github.com/bounswe/bounswe2022group2/pull/443)|1 hour|
  |create readme.md for learnify folder with setup instructions|[#472](https://github.com/bounswe/bounswe2022group2/pull/472)|1 hour|
  |adding AWS, Docker, Gmail and NodeJS to tools evaluation|[#488](https://github.com/bounswe/bounswe2022group2/pull/488)|1.5 hours|
  |GET /courses|[#437](https://github.com/bounswe/bounswe2022group2/pull/437)|1 hour|

## *Unit Tests:*
 
 Pushed alongside the endpoints.

## *Additional Information:*  

---------------

## *Member:*  

Name: Hasan Can Erol

Group: Group2 - Backend Team

## *Responsibilities:*
 
 **Final Milestone 3**
 
 1. Attending and participating general meetings regularly
 2. Writing create comment enpoint for the posts
 3. Writing unit tests for the create comment endpoint
 4. Writing editing comment endpoint
 5. Providing postman examples for the mobile and frontend connection
 6. Reviewing the works done by the backend team and make sure all the endpoint working fine
 7. Taking and documenting General Meeting 8 notes to wiki page
 
 **Milestone 2**
 
 1. Writing executive summary for Milestone-2 report
 2. Attending and participating general meetings regularly
 
 **Milestone 1**
 
 1. Attending and participating general meetings regularly
 2. Implementing the resend verification email endpoint
 3. Reviewing and making sure all works done by each beackend team member are working properly
 4. Providing postman documentations for the frontend and mobile teams
 5. Doing research on technologies needed to use on backend development

## *Main Contributions:*
 
 **Final Milestone 3**
 
 I'm one of the 3 contributors of backend team for the Learnify app, so most parts of my contribution is on backend side. In this milestone, future plans are changed and we decided to go with the forum for the learning spaces. Therefore, I wrote the commenting on existing posts on learning spaces and editing these comments part of our application. Also, I provided the postman documentation and the unit tests for the mobile and frontend team to backend connections. In addition, I noted down the meeting notes for our 8th meeting this semester and documented it into wiki page. 

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:
 
 - [Backend: Comment on Posts Endpoint and Unit Tests](https://github.com/bounswe/bounswe2022group2/issues/779)
 - [Backend: Put edit comment endpoint](https://github.com/bounswe/bounswe2022group2/issues/862)

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:
 
 - [Documenting meting notes of Meeting 8 for CMPE451](https://github.com/bounswe/bounswe2022group2/issues/759)
 - [Final Milestone: Individual Contributions Report for Hasan Can Erol](https://github.com/bounswe/bounswe2022group2/issues/963)
 - [Final Milestone: Summary of Work Table for Hasan Can Erol](https://github.com/bounswe/bounswe2022group2/issues/964)
 
 **Milestone 1**
 
  I'm one of the 3 contributors of backend team for the Learnify app. Firstly, we discuss about popular technologies on software development and decided on Node.js as a team. After that, we splitted the implementation of 4 endpoints which are decided to be developed for the milestone-1 demo. I implemented resend the verificaiton email for signup and forgot password pages. I was always on touch with my backend teammates via discord, whatsapp or on person. I tried the project on my local and made sure the whole backend demo works properly. I also added the moving forward part to our Milestone-1 report.

 * *Code related significant issues:* My issues that contribute to the code base
demonstrated during the demo:
 
  - [Backend: Implementation of Resend Email Verification](https://github.com/bounswe/bounswe2022group2/issues/406)
 
* *Management related significant issues:* My issues that contribute to the
management of our software project:
 
  - [Revising the Requirements: Profile Page](https://github.com/bounswe/bounswe2022group2/issues/345)
  - [Revisions About All the Diagrams](https://github.com/bounswe/bounswe2022group2/issues/322)
  - [Reviewing the Updating Communication Plan](https://github.com/bounswe/bounswe2022group2/issues/315)
  - [Reviewing the Revising the Requirements: Chat to forum Transformation](https://github.com/bounswe/bounswe2022group2/issues/344)
 
## *Pull Requests:*

 - [Backend: Implementing Resend The Verification Code](https://github.com/bounswe/bounswe2022group2/pull/411)
 - [Executive Summary](https://github.com/bounswe/bounswe2022group2/pull/703)
 - [Backend: Create Comment endpoint and Unit Tests](https://github.com/bounswe/bounswe2022group2/pull/784)
 - [Create comment endpoint minor bugfix](https://github.com/bounswe/bounswe2022group2/pull/849)
 - [Backend: Edit comment endpoint](https://github.com/bounswe/bounswe2022group2/pull/863)
 - [Summary of Individual Work for Hasan Can Erol](https://github.com/bounswe/bounswe2022group2/pull/511)
 - [Adding Moving Forward](https://github.com/bounswe/bounswe2022group2/pull/512)
 
 
## *Unit Tests:*
 
 - [Backend: Create Comment endpoint and Unit Tests](https://github.com/bounswe/bounswe2022group2/pull/784)

---------------

## *Member:*  

Name: Onur Kömürcü

Group: Group2 - Android/Mobile Team

## *Responsibilities:*

**Final Milestone-3**

 1. Attending and participating all general meetings
 2. Attending and participating all mobile team meetings
 3. Attending to all customer meetings and lectures
 4. Implementing backend connection of user search
 5. Updating my profile page
 6. Implementing backend connection of my profile screen
 7. Implementing others profile page
 8. Implementing backend connection of others profile page
 9. Implementing update profile page button and it's backend connection
 10. Updating profile page tests
 11. Documenting mobile meeting notes #6
 12. Reviewing the works done by the mobile team
 13. Reporting any bugs that is occurred in the progress of development
 14. Clarifying the objectives of the project with asking detailed questions about our project features to our TA
 15. Contributing to planning flow of the demo presentation and creating sample learning spaces and posts for demo
 16. Updating project plan for the final milestone report
 17. Writing mobile app scenario for the final milestone report
 18. Filling individual contribution of myself in milestone report.

--------------------

**Milestone-2**

 1. Implementing view all screen
 2. Implementing data passing from home screen
 3. Implementing spaces screen
 4. Implementing search screen which contains learning spaces and users
 5. Implementing backend connection of the search screen
 6. Implementing user preview widget
 7. Implementing static user search
 8. Implementing tests for view all screen
 9. Implementing tests for spaces screen
 10. Research about how to implement search screen
 11. Research about how to pass data between pages
 12. Analyze the structure of the "SelectorHelper" which is implemented by Bahrican and used instead of stateful widget
 13. Changing the location of "create a learning space" button from home page to spaces page
 14. Reviewing the works done by the mobile team
 15. Reporting any bugs that is occurred in the progress of development
 16. Documenting one of the mobile team meeting
 17. Contributing to project management, focused on increasing the democracy among team members
 18. Clarifying the objectives of the project with asking detailed questions about our project features to our TA
 19. Contributing to planning flow of the demo presentation and creating sample learning spaces and posts for demo
 20. Attending and participating general meetings regularly.
 21. Attending and participating mobile team meetings regularly.
 22. Attending to customer meetings and lectures regularly.

--------------------

**Milestone-1**

  1. Doing research on Flutter and Android Studio
  2. Implementing login page
  3. Setting up back end connection of login page
  4. Writing tests for login page
  5. Reviewing whole work that is done by mobile team
  6. Contributing to project plan development
  7. Transferring project plan from notion to ProjectLibre

## *Main Contributions:*

**Final Milestone-3**

I am a member of the mobile team also in the final period of the semester. As you can see below and above I contributed to lots of pages. When I was doing them, I researched about similar pages in other mobile applications. Requirements of the pages were also determined via discussing with our team members. Backend, frontend and mobile teams discussed about the features of the pages. I designed these pages according to these discussions. When the pages are initialized, I analyzed the backend side of the pages. I read the postman documentations. I implemented backend connection accordingly. I changed the profile page tests to prevent fail tests. Before the demo day, I try to fix the update profile bug. I mainly fixed that feature. Besides these, I attended all lectures, lab sessions, demo days and team/mobile meetings. It was a great journey to experience working with a relatively large group working.

--------------------

**Milestone-2**

I am member of the mobile team. I mainly contributed to the tasks that are related to the mobile side of our project. I have implemented several pages that can be seen both above and below. Before implementing the pages, I did detailed research about these pages. I analyzed the example screens. When the widgets have done and endpoints were implemented by our backend team, I analyzed the related endpoints. After that, backend connections of the pages are done if needed. Some pages have to receive data from another pages. So, I do research about data passing in Flutter. I reviewed and tried to understand deeply the works that are done by other mobile team members. I stick with our project plan. Other than these, I have contributed to project management. I opened polls for clarifying our decisions with our team in various things. Also, contributed to some works for our demo like creating learning spaces and posts. Specification of the requirements has great importance of the project development. I asked my detailed questions about our features to our TA. The answers changed our way of thinking of that features in various aspects. Collaborative learning is an example of this. Additionally, I attended to mobile/general team meetings and lessons regularly to keep synchronized with our team and project.

--------------------

**Milestone-1**

I am member of the mobile team. I mainly contribute to the tasks that are related to the mobile side of our project. At first, I contribute to planning the project for the whole term. After that, I contribute to the tasks that are related to updating and reviewing at the beginning of the term. When we started to implementation, I have responsibility to implement login page. I implement the login page and make the backend connection. Tested whole edge cases using emulator. Additionally, I write widget tests also. During this process, I analyze the backend responses and other structural objects in mobile. These ease my learning process of the Flutter. Reviewed almost whole features. Also, contributed to the clarification of some points for the whole project (contributor issue and annotation). 

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

**Final Milestone-3**

  1. Mobile: Updating My Profile Page [#775](https://github.com/bounswe/bounswe2022group2/issues/775)
  2. Mobile: Implementing Other User's Profile Page [#776](https://github.com/bounswe/bounswe2022group2/issues/776)
  3. Mobile: User Search Backend Connection [#866](https://github.com/bounswe/bounswe2022group2/issues/866)
  4. Mobile: Get and Update My Profile Backend Connection [#867](https://github.com/bounswe/bounswe2022group2/issues/867)
  5. Mobile: Get Other Users Profile Backend Connection[#868](https://github.com/bounswe/bounswe2022group2/issues/868)

--------------------

**Milestone-2**

 1. Mobile: Implementing Search Page [#567](https://github.com/bounswe/bounswe2022group2/issues/567)
 2. Mobile: Implementing Learnifies Page [#568](https://github.com/bounswe/bounswe2022group2/issues/568)
 3. Mobile: Backend Connection for Search Page [#584](https://github.com/bounswe/bounswe2022group2/issues/584)
 4. Mobile: Implementing User Preview Widget [#593](https://github.com/bounswe/bounswe2022group2/issues/593)
 5. Mobile: Static User Search Implementation and Additional Improvements [#635](https://github.com/bounswe/bounswe2022group2/issues/635)
 6. Mobile: Tests for ViewAllScreen and TakenLsScreen [#646](https://github.com/bounswe/bounswe2022group2/issues/646)

--------------------

**Milestone-1**

  1. [Mobile Team: Setting up development Environment](https://github.com/bounswe/bounswe2022group2/issues/372)
  2. [Mobile - Implementing Login Page Including Backend Connection](https://github.com/bounswe/bounswe2022group2/issues/396)
  3. [Mobile: Writing Tests for Login Page](https://github.com/bounswe/bounswe2022group2/issues/447) (Ongoing)

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

**Final Milestone-3**

  1. Final Milestone: Project Plan [#956](https://github.com/bounswe/bounswe2022group2/issues/956)
  2. Final Milestone: Mobile App Scenario [#957](https://github.com/bounswe/bounswe2022group2/issues/957)
  3. Final Milestone: Summary of Work Table for Onur Kömürcü [#958](https://github.com/bounswe/bounswe2022group2/issues/958)
  4. Final Milestone: Individual Contributions Report for Onur Kömürcü [#959](https://github.com/bounswe/bounswe2022group2/issues/958)
  5. Mobile: Documenting Meeting Notes #6 [#774](https://github.com/bounswe/bounswe2022group2/issues/774)

--------------------

**Milestone-2**

 1. Documenting Meeting Notes of Meeting #5 of the Mobile Team [#527](https://github.com/bounswe/bounswe2022group2/issues/527)
 2. Milestone-2 Report: Updating Project Plan [#690](https://github.com/bounswe/bounswe2022group2/issues/690)

--------------------

**Milestone-1**

  1. [Revising the Requirements Specification](https://github.com/bounswe/bounswe2022group2/issues/323)
  2. [Update the Project plan for upcoming semester](https://github.com/bounswe/bounswe2022group2/issues/316)
  3. [Milestone 1: Project Plan](https://github.com/bounswe/bounswe2022group2/issues/448)
  4. [Updating Communication Plan](https://github.com/bounswe/bounswe2022group2/issues/377)
  5. [Revising the Diagrams based on Achievements](https://github.com/bounswe/bounswe2022group2/issues/346)
  6. [Revising the Requirements: Achievements and Badges](https://github.com/bounswe/bounswe2022group2/issues/333)
  7. [Revising Mockups](https://github.com/bounswe/bounswe2022group2/issues/326)


## *Pull Requests:*

**Final Milestone-3**

  1. Mobile: My Profile Screen Update [#783](https://github.com/bounswe/bounswe2022group2/issues/783)
  2. Mobile: User search backend connection [#890](https://github.com/bounswe/bounswe2022group2/issues/890)
  3. Mobile: My profile backend connection [#915](https://github.com/bounswe/bounswe2022group2/issues/915)
  4. Mobile: Other users profile page and backend connection [#921](https://github.com/bounswe/bounswe2022group2/issues/921)
  5. Mobile: Profile Update Major BugFix [#923](https://github.com/bounswe/bounswe2022group2/issues/923)
  6. Final Milestone: Project Plan [#983](https://github.com/bounswe/bounswe2022group2/issues/983)|30 minutes
  7. Final Milestone: Mobile App Scenario [#957](https://github.com/bounswe/bounswe2022group2/issues/957)
  8. Final Milestone: Summary of Work Table for Onur Kömürcü [#966](https://github.com/bounswe/bounswe2022group2/issues/966)
  9. Final Milestone: Individual Contributions Report for Onur Kömürcü [#959](https://github.com/bounswe/bounswe2022group2/issues/958)

--------------------

**Milestone-2**

 1. Mobile: Implementing View All Screen [#557](https://github.com/bounswe/bounswe2022group2/issues/557)
 2. Mobile: Implementing Spaces Page [#569](https://github.com/bounswe/bounswe2022group2/issues/569)
 3. Mobile: Implemented Search Screen with Backend Connection [#632](https://github.com/bounswe/bounswe2022group2/issues/632)
 4. Mobile: User Preview Widget [#638](https://github.com/bounswe/bounswe2022group2/issues/638)
 5. Mobile: Static User Search and Recommended LS in Search Implemented [#644](https://github.com/bounswe/bounswe2022group2/issues/644)
 6. Mobile: Tests for Pages Which Use View All List [#647](https://github.com/bounswe/bounswe2022group2/issues/647)

--------------------

**Milestone-1**

1. Mobile: Implementation of Login Screen Including Backend Connection [#398](https://github.com/bounswe/bounswe2022group2/pull/398)
2. Mobile: Tests for Login Page [#485](https://github.com/bounswe/bounswe2022group2/pull/485)

## *Unit Tests:*

**Final Milestone-3**

  1. Mobile: My Profile Screen Update (Test update included) [#783](https://github.com/bounswe/bounswe2022group2/issues/783)

--------------------

**Milestone-2**

 1. Unit Tests for which use view all list widget [#646](https://github.com/bounswe/bounswe2022group2/issues/646)

--------------------

**Milestone-1**

  1. Mobile: Tests for Login Page [#485](https://github.com/bounswe/bounswe2022group2/pull/485)

## *Additional Information:*  

I want to thank my every group members for their great contributions.

--------------------

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

**Final Milestone-3**

  1. I have been instrumental in the construction of the primary structure and layout for the about page of our Learnify application.
  2. I have successfully implemented the about page within the framework of our web application.
  3. In collaboration with the other members of the frontend team, I have contributed to the design and layout of the learning space page and its components with the aim of enhancing the user interface and user experience for our users.
  4. I have developed and implemented the necessary component logic for the learning space page of our web application.
  5. I have designed and developed a functional event component for the learning space page.
  6. I have created a comment component for the learning space page, which allows users to engage with and discuss the content posted on the platform.
  7. I have implemented upvote and downvote features for posts on the learning space page, allowing users to express their approval or disapproval of content.
  8. I have integrated various elements and icons into the learning space page to improve its aesthetics and functionality.
  9. I have developed and implemented a feature for the creation of comments on the learning space page.
  10. I have also implemented a feature for the editing of comments on the learning space page.
  11. I have established a backend connection between our REST API and the learning space page post retrieval feature, enabling the retrieval of all relevant data from the database.
  12. I have also created a backend connection between the REST API and the event retrieval feature of the learning space page.
  13. Additionally, I have implemented a backend connection between the REST API and the comment retrieval feature of the learning space page.
  14. I have established a backend connection between the REST API and the comment creation feature of the learning space page.
  15. I have also implemented a backend connection between the REST API and the comment editing feature of the learning space page.
  16. I have created a backend connection between the REST API and the upvoting and downvoting features of the learning space page, allowing for the accurate tracking and updating of user feedback.
  17. In order to ensure the success of our project, I have conducted extensive research on the various React frameworks, libraries, and development approaches available to us.
  18. I have also researched the W3C annotation standards and annotation implementation methods to ensure compliance with industry standards.
  19. In addition, I have researched the W3C event standards and event implementation methods to ensure the smooth functioning of the event component on the learning space page.
  20. Throughout the web application development process, I have been proactive in seeking out and utilizing new techniques and approaches to improve the efficiency and effectiveness of my work.
  21. I have implemented unit tests for the about page to ensure its stability and reliability.
  22. I have also implemented unit tests for the event component of the learning space page.
  23. I have implemented unit tests for the comment component of the learning space page to ensure its proper functioning.
  24. I have contributed to the creation of the general structure for the final milestone 3 report, which outlines the progress and achievements of our team.
  25. I have also helped to create a list and status of the deliverables for the final milestone 3 report, providing a comprehensive overview of the tasks and objectives completed during this phase of the project.
  26. I have participated in the review of the works completed by the frontend team to ensure that all deliverables meet the required standards and specifications.
  27. I have addressed any bugs, mistakes, or problems that have arisen during the development process in a timely and effective manner.
  28. I have consistently attended and participated in general team meetings, sharing my insights and ideas with my colleagues.
  29. I have also consistently attended and participated in frontend team meetings, collaborating with my peers to ensure the smooth progression of our project.
  30. Participating in regular code reviews to ensure the quality and compliance of the frontend development.
  31. Collaborating with team members to identify and troubleshoot technical issues.
  32. Developing and maintaining documentation for the frontend codebase and processes.
  33. Participating in planning and estimation sessions for new features and enhancements.
  34. Providing support and guidance to team members as needed.
  35. Controlling the version control of the frontend codebase using Git.
  36. Implementing responsive design principles to ensure that the application is functional and visually appealing on various devices and screen sizes.
  37. Reviewing and editing the final version of the milestone 3 report before submission.

--------------------

**Milestone-2**

  1. Constructing the not found page's primary structure and layout.
  2. Putting the not found page in place.
  3. Layout for learning space page and components are offered and designed to improve user interface and user experience.
  4. Giving our web application some component logic on learning space page.
  5. Developing the post component.
  6. Putting into practice some of the learning space page's elements and icons.
  7. Implementing post creation feature for learning space page.
  8. Implementing post editing feature for learning space page.
  9. Creating the backend connection between our REST API and the learning space page post creation feature.
  10. Creating the backend connection between our REST API and the learning space page post editing feature.
  11. Providing a method for private and protected routing.
  12. Conducting research on the React frameworks, libraries, and development approaches we'll be using on our project.
  13. Conducting research on the W3C annotation standards and annotation implementation methods we'll be using on our project.
  14. Throughout the web application development process, looking for and utilizing new techniques.
  15. Implementing text annotation feature for created learning space posts.
  16. Implementing image annotation feature for created learning space posts.
  17. Implementing unit tests for not found page.
  18. Implementing unit tests for email verification page.
  19. Documenting frontend team meeting notes #4.
  20. Documenting general team meeting notes #6.
  21. Creating the general structure for the milestone 2 report.
  22. Creating the list and status of the deliverables table for milestone 2 report.
  23. Reviewing the works done by the frontend team.
  24. Fixing any bugs, mistakes, or problems that arose throughout the routine development of our application's front end.
  25. Consistently participating in and attending general meetings.
  26. Consistently participating in and attending frontend team meetings.

--------------------

**Milestone-1**

  1. Implementing Email Verification page
  2. Adding Form Validation for Email Verification Page
  3. Providing validation methods
  4. Implementing navigation from and to the Email Verification page
  5. Testing the Email Verification page by writing unit tests
  6. Setting up the Email Verification page's back-end connection
  7. Providing methods for establishing back-end connection
  8. Reviewing all frontend team members' work
  9. Doing research on technologies needed to use on frontend development

## *Main Contributions:*

**Final Milestone-3**

As a highly dedicated and diligent member of the project team responsible for the frontend development of our Learnify application, I have made a sustained effort to actively contribute to the creation of various features that adhere to industry standards and best practices as outlined by our instructor in lectures. Specifically, I implemented the event component and established the backend connection for retrieving events, ensuring compliance with the W3C guidelines. In addition to this, I provided hotfixes and suggested improvements to parts of my team members' code, sharing any relevant information and insights I had acquired through my ongoing learning and research endeavors. Furthermore, I conducted comprehensive unit tests for the components I developed, including the about page and various parts of the learning space page, to ensure their reliable and robust performance and to catch any potential issues before they could impact the user experience. In accordance with the design principles determined by the frontend team and in alignment with the overall aesthetic of the application, I also contributed a range of visual components such as designs, icons, and buttons for this final milestone, working to create a cohesive and visually appealing user interface. To remain informed on the progress of the application's development and to effectively contribute to our weekly general and frontend team meetings, I consistently checked in and offered thoughtfully considered suggestions for the agenda based on my observations and recommendations, striving to provide valuable insights and ideas for improving the project. In an effort to optimize the efficiency of the learning space page and to enhance the user experience, I made a number of modifications to the visual elements, including the conversion of png images to svg icons for faster loading times and improved performance. I also provided page layouts and graphic elements such as icons, logos, and drawings with attractive designs that aligned with the established design principles and contributed to the overall cohesive look and feel of the application. Additionally, I implemented the upvote and downvote functionality, complete with the corresponding backend connections for creating and retrieving these features, which significantly enhanced user satisfaction by allowing them to express their preferences for posts and providing valuable feedback to the content creators. To facilitate the efficient importation and utilization of components, I created a component-based page layout logic for the comment and event features of the learning space page, enabling the passing of parameters through React props and reducing the risk of duplicated code, thereby streamlining the development process and improving maintainability. I also developed an about page with a visually appealing design and constructed the majority of the components and functionalities of the learning space page, ensuring that they were in line with the frontend team's development efforts and met the necessary specifications and requirements. In accordance with our design guidelines, I created a set of css classes that were implemented for the components developed by the entire frontend team, establishing the necessary backend connections and passing parameters to display components based on responses from the REST API. Overall, my contributions to the frontend development of the Learnify application have been made with a strong commitment to excellence and a dedication to creating a high-quality user experience.

--------------------

**Milestone-2**

I work on the front end of our Learnify application, which is being developed collaboratively by all the members of group 2. I have implemented the text and image annotation features for the frontend part complying with the W3C standards as constantly requested by our teacher in the lectures. I have offered hotfixes, sugggested a few improvements for the parts in my coworkers' code, and attempted to pass along the related information I have discovered. In addition, for the components I developed while working on the front end of our online application like not found page and email verification page, I also performed unit tests to ensure that every component worked as expected. In keeping with the design principles we jointly decided with other frontend members upon and in consistency with other components and pages of our online application, I continued to offer some of the visual components like designs, icons, and buttons of our web application for this milestone 2. I frequently checked the progress of our application's development before our weekly general and frontend team meetings, and suggested some appropriate ideas for our agenda every week. For our frontend application, I have also altered some visual parts of the learning space page post creation and editing parts so as to improve efficiency of our learning space page in terms of the loading duration by changing some of the the png images to svg icons. For our frontend part of the application, I have also given some parts of the page layouts and graphic elements like icons, logos, and drawings along with some alluring designs to support these. In addition, I looked into React's page routing and came up with a simple but effective fix for one of our fundamental problems by implementing private and protected routing, which in essence was to prevent unauthorized users from accessing the internal parts of the application like home page, learning space page, etc. I have also created a component-based page layouting logic for the post feature of the learning space page in order to easily import components, utilize them without duplicating code segments, and be able to give certain parameters with React props to display components. In addition, I added a not found page with an eye-pleasing desgin and built majority of the components and functionalities of the learning space page. Finally, in line with our frontend development, I have created some css classes that comply with our design guidelines for the components implemented by the entire frontend team, as well as implemented separate components for each, established backend connections, established private page routing, and passed parameters to display components according to the response obtained from the REST API.

--------------------

**Milestone-1**

I contributed mainly to the frontend side with React since I am a member of the frontend team of our application, Learnify. In general, I was given the task of building the web application's email verification page. To achieve this, I was in charge of creating the functions and components for the email verification page from scratch and putting it into operation. I did a research on testing with React and am also responsible for the tests of the Email Verification page I developed. We had to undertake thorough research on how to link pages, how to utilize states, how to validate form inputs, how to manage API calls, and how to do unit testing because none of us on the frontend team are accustomed to working with React. My conclusions have led me to implement our email verification page. Initial structure and layout were implemented initially, followed by validation, the backend connection, and finally, unit testing.

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

**Final Milestone-3**

1. [Frontend: Unit Tests for Event Component of Learning Space](https://github.com/bounswe/bounswe2022group2/issues/912)
2. [Frontend: Backend Connection for Joining Events on Learning Space Page](https://github.com/bounswe/bounswe2022group2/issues/907)
3. [Frontend: Unit Tests for Comment Component of Learning Space Posts](https://github.com/bounswe/bounswe2022group2/issues/894)
4. [Frontend: Unit Tests for About Page](https://github.com/bounswe/bounswe2022group2/issues/886)
5. [Frontend: Backend Connection for Editing Comments of Learning Space Posts](https://github.com/bounswe/bounswe2022group2/issues/882)
6. [Frontend: Backend Connection for Upvote and Downvote Functionality for Posts and Comments](https://github.com/bounswe/bounswe2022group2/issues/874)
7. [Frontend: Backend Connection for Getting Events on Learning Space Page](https://github.com/bounswe/bounswe2022group2/issues/858)
8. [Frontend: Backend Connection For Create and Get Comment](https://github.com/bounswe/bounswe2022group2/issues/852)
9. [Frontend: Creating Event Component for Learning Space Page](https://github.com/bounswe/bounswe2022group2/issues/847)
10. [Frontend: Implementation of About Page](https://github.com/bounswe/bounswe2022group2/issues/814)
11. [Frontend: Create Comment Component for Learning Space Posts](https://github.com/bounswe/bounswe2022group2/issues/798)
  
--------------------

**Milestone-2**

  1. [Frontend: Implementation of Not Found Page](https://github.com/bounswe/bounswe2022group2/issues/520)
  2. [Frontend: Implementation of Private Routes](https://github.com/bounswe/bounswe2022group2/issues/521)
  3. [Frontend: Implementation of Components on Learning Space Page](https://github.com/bounswe/bounswe2022group2/issues/549)
  4. [Frontend: Implementation of onClick Button Rendering](https://github.com/bounswe/bounswe2022group2/issues/630)
  5. [Frontend: Backend Connection for the Create Post Part of Learning Space Page](https://github.com/bounswe/bounswe2022group2/issues/641)
  6. [Frontend: Implementation of the Text Annotation](https://github.com/bounswe/bounswe2022group2/issues/650)
  7. [Frontend: Implementation of the Image Annotation](https://github.com/bounswe/bounswe2022group2/issues/651)
  8. [Frontend: Implementation of Edit Post Feature](https://github.com/bounswe/bounswe2022group2/issues/659)
  9. [Frontend: Backend Connection For Edit Post](https://github.com/bounswe/bounswe2022group2/issues/660)
  10. [Frontend: Unit Tests for Not Found Page](https://github.com/bounswe/bounswe2022group2/issues/681)
  11. [Frontend: Unit Tests for Email Verification Page](https://github.com/bounswe/bounswe2022group2/issues/453)

--------------------

**Milestone-1**

  1. [Frontend: Implementation of Email Verification Page](https://github.com/bounswe/bounswe2022group2/issues/385)
  2. [Frontend: Adding Form Validation for Email Verification Page](https://github.com/bounswe/bounswe2022group2/issues/429)
  3. [Frontend: Backend Connection for the Email Verification Page](https://github.com/bounswe/bounswe2022group2/issues/449)
  4. [Frontend: Unit Tests for Email Verification Page](https://github.com/bounswe/bounswe2022group2/issues/453)

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

**Final Milestone-3**

  1. [Final Milestone: Individual Contributions Report for Enes Sürmeli](https://github.com/bounswe/bounswe2022group2/issues/981)
  2. [Final Milestone: Summary of Work Table for Enes Sürmeli](https://github.com/bounswe/bounswe2022group2/issues/980)
  3. [Final Milestone Report: List and Status of Deliverables](https://github.com/bounswe/bounswe2022group2/issues/976)
  4. [Milestone 3: Preparing Final Deliverables](https://github.com/bounswe/bounswe2022group2/issues/935)

--------------------

**Milestone-2**

  1. [Documenting the Meeting Notes for the Frontend Meeting 4](https://github.com/bounswe/bounswe2022group2/issues/548)
  2. [Documenting Meeting Notes for the Meeting 6 of CMPE 451](https://github.com/bounswe/bounswe2022group2/issues/535)
  3. [Preparing Milestone 2 - CMPE 451 Deliverables](https://github.com/bounswe/bounswe2022group2/issues/668)
  4. [Milestone 2: Individual Report - Muhammed Enes Sürmeli](https://github.com/bounswe/bounswe2022group2/issues/711)
  5. [Milestone-2 Report: List and Status of Deliverables](https://github.com/bounswe/bounswe2022group2/issues/712)
  6. [Milestone 1: Reviewing the Milestone - What Went Well and What Did Not Go Well Parts](https://github.com/bounswe/bounswe2022group2/issues/492)

--------------------

**Milestone-1**

  1. [Revising the Requirements Specification](https://github.com/bounswe/bounswe2022group2/issues/323)
  2. [Conducting Research on React Router](https://github.com/bounswe/bounswe2022group2/issues/386)
  3. [Revising the Requirements Specification: Notifications](https://github.com/bounswe/bounswe2022group2/issues/329)
  4. [Revisions About All the Diagrams](https://github.com/bounswe/bounswe2022group2/issues/422)
  5. [Updating Communication Plan](https://github.com/bounswe/bounswe2022group2/issues/315)
  6. [Research & Report for Frontend Technologies (Frontend Team)](https://github.com/bounswe/bounswe2022group2/issues/327)
  7. [Revising Mockups](https://github.com/bounswe/bounswe2022group2/issues/326)

## *Pull Requests:*

**Final Milestone-3**

1. Final Milestone: Individual Contributions Report for Enes Sürmeli [#989](https://github.com/bounswe/bounswe2022group2/issues/989)
2. Final Milestone: Summary of Work Table for Enes Sürmeli [#990](https://github.com/bounswe/bounswe2022group2/issues/990)
3. Final Milestone Report: List and Status of Deliverables [#950](https://github.com/bounswe/bounswe2022group2/issues/976)
4. Milestone 3: Preparing Final Deliverables [#935](https://github.com/bounswe/bounswe2022group2/issues/935)
5. Dev to Master [#932](https://github.com/bounswe/bounswe2022group2/issues/932)
6. Frontend: Backend Connection for Joining Events on Learning Space Page [#908](https://github.com/bounswe/bounswe2022group2/issues/908)
7. Frontend: Backend Connection for Editing Comments of Learning Space Posts [#883](https://github.com/bounswe/bounswe2022group2/issues/883)
8. Frontend: Fixing the Footer Navigation [#876](https://github.com/bounswe/bounswe2022group2/issues/876)
9. Frontend: Backend Connection for Upvote and Downvote Functionality for Posts and Comments [#875](https://github.com/bounswe/bounswe2022group2/issues/875)
10. Frontend: Backend Connection for Getting Events on Learning Space Page [#859](https://github.com/bounswe/bounswe2022group2/issues/859)
11. Frontend: Backend Connection For Create and Get Comment [#853](https://github.com/bounswe/bounswe2022group2/issues/853)
12. Frontend: Creating Event Component for Learning Space Page [#848](https://github.com/bounswe/bounswe2022group2/issues/848)
13. Frontend: Implementation of About Page [#815](https://github.com/bounswe/bounswe2022group2/issues/815)
14. Frontend: Create Comment Component for Learning Space Posts [#799](https://github.com/bounswe/bounswe2022group2/issues/799)

--------------------

**Milestone-2**

1. Frontend: Implementation of Private Routes [#523](https://github.com/bounswe/bounswe2022group2/pull/523)
2. Frontend: Implementation of Not Found Page [#525](https://github.com/bounswe/bounswe2022group2/pull/525)
3. Frontend: Implementation of Components on Learning Space Page [#629](https://github.com/bounswe/bounswe2022group2/issues/629)
4. Frontend: Implementation of onClick Button Rendering [#631](https://github.com/bounswe/bounswe2022group2/issues/631)
5. Frontend: Create Post Feature of Learning Space Page [#643](https://github.com/bounswe/bounswe2022group2/issues/643)
6. Frontend: Backend Connection for the Create Post Part of Learning Space Page [#643](https://github.com/bounswe/bounswe2022group2/issues/643)
7. Frontend: Implementation of the Text Annotation [#658](https://github.com/bounswe/bounswe2022group2/pull/658)
8. Frontend: Implementation of the Image Annotation [#658](https://github.com/bounswe/bounswe2022group2/pull/658)
9. Frontend: Implementation For Edit Post Feature [#661](https://github.com/bounswe/bounswe2022group2/pull/661)
10. Frontend: Backend Connection for the Edit Post Part [#661](https://github.com/bounswe/bounswe2022group2/pull/661)
11. Milestone 2: Preparing Deliverables and Group Review [#672](https://github.com/bounswe/bounswe2022group2/pull/672)
12. Milestone 1: What Went Well, What Did Not Go Well, and Individual Contribution Parts [#508](https://github.com/bounswe/bounswe2022group2/pull/508)
13. Frontend: Unit Tests for Email Verification Page [#458](https://github.com/bounswe/bounswe2022group2/pull/458)
14. Frontend: Unit Tests for Not Found Page [#683](https://github.com/bounswe/bounswe2022group2/pull/683)
15. Updating the Dev Branch [#684](https://github.com/bounswe/bounswe2022group2/issues/684)

--------------------

**Milestone-1**

1. Frontend: Email Verification Page Implementation [#392](https://github.com/bounswe/bounswe2022group2/pull/392)
2. Frontend: Email Verification Form Validation [#431](https://github.com/bounswe/bounswe2022group2/pull/431)
3. Frontend: Backend Connection for Email Verification Page [#450](https://github.com/bounswe/bounswe2022group2/pull/450)
4. Frontend: Unit Tests for Email Verification Page [#453](https://github.com/bounswe/bounswe2022group2/pull/453)

## *Unit Tests:*

1. Frontend: Unit Tests for Email Verification Page [#458](https://github.com/bounswe/bounswe2022group2/pull/458)
2. Frontend: Unit Tests for Not Found Page [#683](https://github.com/bounswe/bounswe2022group2/pull/683)
3. Frontend: Unit Tests for Event Component of Learning Space [#913](https://github.com/bounswe/bounswe2022group2/issues/913)
4. Frontend: Unit Tests for Comment Component of Learning Space Posts [#895](https://github.com/bounswe/bounswe2022group2/issues/895)
5. Frontend: Unit Tests for About Page [#891](https://github.com/bounswe/bounswe2022group2/issues/891)

## *Additional Information:*

**Final Milestone-3**

As a dedicated member of the project team, I made a concerted effort to attend all academic lectures, collaborative problem-solving sessions, and team meetings, whether held in an online or in-person format. I consistently engaged with the material and my fellow team members, actively seeking to contribute my own ideas and perspectives during the planning and decision-making processes. It is worth highlighting that prior to this semester, I had no previous exposure to frontend development or the React framework. Despite this, I was determined to push beyond my comfort zone and continue learning in order to competently fulfill my responsibilities for this project milestone.

--------------------

**Milestone-2**

I have been there for all lectures, problem sessions, frontend meetings, and general team meetings some of which were held online and some of which were held in person. I readily contributed and shared my ideas when it came to project planning and decision making with other team members. Lastly, I had no prior experience with frontend development or React before this semester, so, I had to step outside of my comfort zone to continue learning and understanding more about these topics for this milestone.

--------------------

**Milestone-1**

I have been there for all lectures, problem sessions, frontend meetings, and general team meetings some of which were held online and some of which were held in person. I readily contributed and shared my ideas when it came to project planning and decision making with other team members. Lastly, I had no prior experience with frontend development or React, so, I had to step outside of my comfort zone to learn and understand more about these topics.

---------------------------

## *Member:*  

Name: Koray Tekin

Group: Group2 - Frontend Team

## *Responsibilities:*
 
 **Final Milestone-3**
 
  1. Searching for and using new methods throughout web-application development process.
  2. Organizing the general layout and initializing the frame of the Profile Page.
  3. Deciding on the components that are required in the Profile Page.
  4. Providing component logics for our web application.
  5. User Information component design and back-end connection on the Profile Page.
  6. Participating Learning Spaces component design and back-end connection on the Profile Page. 
  7. Deciding on the design and the related fields of Contact Page.
  8. Implementation of design and functionality for the Contact Page. 
  9. Deternining the general chronology for the implementation of the Profile Page and organizing parent-issue/sub-issue structure. 
  10. Reviewing the works done by the frontend team.
  11. Solving bugs, errors, problems encountered during the implementation of the frontend of our application regularly (hot-fixes).
  12. Implementing the Unit tests for the Contact Page and the Components on the Profile Page.
  13. Deciding on the logic of the first person/ third person view differenes of the profile page and editting the functionalities accordingly.
  14. Attending and participating general meetings regularly.
  15. Attending and participating frontend team meetings regularly.
  
 

--------------------

**Milestone-2**

  1. Searching for and using new methods throughout web-application development process
  2. Building the main layout for the Learning Space pages.
  3. Providing the initial back-end connection for the Learning Space pages.
  4. Providing component logic for our web application.
  5. Implementing the Static Navigation Bar component.
  6. Utilizing the components in the Learning Space page(modularization of the components via related end-points).
  7. Implementing unit tests for the Static Footer component.
  8. Conducting research on React libraries, frameworks, and methodologies that will be used during our development process.
  9. Reviewing the works done by the frontend team.
  10. Creating search issues for the easier implementation of our projects functionalities.
  11. Solving bugs, errors, problems encountered during the implementation of the frontend of our application regularly.
  12. Attending and participating general meetings regularly.
  13. Attending and participating frontend team meetings regularly.
 

--------------------

**Milestone-1**
 
  1. Requirements and Diagrams revision and replacement of chat with forum.
  2. Updating the group issue template.
  3. Creating personal wiki page as a new member.
  4. Implementing the functionality for the LoginForm for the web application.
  6. Doing research on technologies needed to use on front-end development(mainly react).
  7. Documenting front-end meeting notes.
  8. Reviewing related issues and mentioned PR's of front-end team members'.
  9. Providing methods for establishing back-end connection.
  10. Setting up the LoginForm's back-end connection.
  11. Adding Form Validation for LoginForm.
  12. Implementing navigation items from LoginForm(namely via forgot password redirector and login button).
  13. Implementing the Unit Tests related to the LoginForm.



## *Main Contributions:*
 
 **Final Milestone-3**
 
   I am one of the members of the front-end team. Since our application kept growing according to our pre-defined requirements as any side of our project, Frontend was also responsible with new designs and implementations. As a member who joins all of the group and team meetings I had possibility to share my ideas on those new requirements in terms of design, logic and integrability. After the second milestone, our web application was in need for a profile page. I was the assignee for most of this necessity, I started with creating a general issue that was used throughout the page implementation and also during the back-end connection of this page. Mainly I have created and implemented the general layout detecting the necessary components. Then I have continued with several components on this page, providing the design, back-end connection and the functionality logic. 
 
  Also there was a need of Contact Page for our web application in order to maintain the optimal co-learning process and I began with searching for the possible options for this page. Then I have generated the design and continued with implementation. Last of all to inform the users accordingly for the purpose of this page I have created information boxes that would fit the general layout and the general theme. 
 
   During all of these designs and implementations I gave priority and high attention to feed-back from the front-end team members and reshaped some of the designs over and over again. Also throughout the implementation process of both the pages that I was included in the implementation and also for the ones that I wasn't, I tried my best to contribute for the ideas of functionalities and logic underneath them.

--------------------

**Milestone-2**

   I am one of the members of the front-end team of our application Learnify, as a team of 4 we are implementing the web-application side. Throughout this development process we try not to diverge from the path that we follow for; deciding on "What is next?", sharig the tasks equally among our team members, keeping in touch with the team during the implementation, conducting research when needed, reviewing and commenting on each others work regularly and, finally making sure that our application functions as expected. I have taken responsibiity for all of these development steps time to time. Regularly participated to weekly meetings of our team and shared my point of view for the further developments that can be conducted for our web-application, at the same time those meetings are the time that we share each weeks tasks, so I have shared my mind about load balancing each week and took significant tasks that have effected the development of our application. 
 
   While keeping in touch with the other team members both for the design and functionality ideas, first of all I have implemented the "Static Navigation Bar" components layout and the functionalty, implemented the layout and several of the components for the Learning Space pages which is one of the main pages of our web-application(where learning and sharing takes place.), contributed to our codebase with several hot-fixes related to the REST API utilization and router modularization. And as I have mentioned above, testing the work we have come up with was one of the important points, as we have done always in our front-end team; we have shared the designs and functionalities that were added and implemented the unit tests for those, my responsibility was to test the Footer component and I did so. 
 
   Our team was also aware of the importance of conducting research together and share our findings with each other, I have created a research team issue for finding out the annotation technologies and libraries that our team can benefit from and shared my own findings via examples and hyperlinks with my team.

--------------------

**Milestone-1**

   As one of the new members of the team the first subject I gave priority was to catch up with the requirements specification and the diagrams that my team has prepared in the last term. In order to manage that, I have been assigned several discovery tasks, and I also took responsibility in terms of contributing to the revision of both the requirements and the diagrams. I was the assignee for the replacement of the chat feature with the forum feature specific to lectures. 
 
   After a fast on-boarding our team was divided into sub-groups and I took part in the front-end team, had responsibility in research tasks such as "discovering the features of react applications", "how to initialize a react project", "implementation of unit tests in react projects", etc. Then in order to proceed faster the initial pages have been shared among the front-end team members, and accordingly I have created the design, structure items, and functional elements such as buttons and redirectors for the LoginForm. Then I have implemented the back-end connection of the LoginForm, and finally the unit tests also for LoginForm. For both of these tasks I had to do discovery research since I had no experience at this side of the coin, I mean the front-end.
 
 --------------------



* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:
 
 
**Final Milestone-3**

  1. [Frontend: Implementation of Profile Page General Issue](https://github.com/bounswe/bounswe2022group2/issues/771)
  2. [Frontend: Implementation of Profile Page Initial Layout](https://github.com/bounswe/bounswe2022group2/issues/778)
  3. [Frontend: Implementation of Contact Page](https://github.com/bounswe/bounswe2022group2/issues/822)
  4. [Frontend: Implementation of Profile Page User Name Component](https://github.com/bounswe/bounswe2022group2/issues/836)
  5. [Frontend: Implementation of Participated LS Component and Backend Connection](https://github.com/bounswe/bounswe2022group2/issues/851)
  6. [Frontend: Profile Page Design, Renamings and Component Refinements ](https://github.com/bounswe/bounswe2022group2/issues/856)
  7. [Frontend: Profile Page Edit Functionality](https://github.com/bounswe/bounswe2022group2/issues/877)
  8. [Frontend: Contact Page Unit Tests](https://github.com/bounswe/bounswe2022group2/issues/893)
  6. [Frontend: Participated LS's Component Unit Tests](https://github.com/bounswe/bounswe2022group2/issues/898)

 
--------------------

**Milestone-2**
 
  1. [Frontend: Implementation of Static Navigation Bar](https://github.com/bounswe/bounswe2022group2/issues/533)
  2. [Frontend: Implementation of Learning Space page layout and initial components](https://github.com/bounswe/bounswe2022group2/issues/541)
  3. [Frontend: Implementation of back-end connection and dynamic modularization of the Learning Space](https://github.com/bounswe/bounswe2022group2/issues/624)
  4. [Frontend: Implementation of participants component of LS and providing the back-end connection](https://github.com/bounswe/bounswe2022group2/issues/648)
  5. [Frontend: Unit Tests for Footer Component](https://github.com/bounswe/bounswe2022group2/issues/686)

--------------------

**Milestone-1**

  1. [Frontend: Implementation of LoginForm](https://github.com/bounswe/bounswe2022group2/issues/390)
  2. [Frontend: Adding Form Validation and Back-end connection for LoginForm](https://github.com/bounswe/bounswe2022group2/issues/441)
  3. [Frontend: Unit Tests Implementation for LoginForm](https://github.com/bounswe/bounswe2022group2/issues/466)
 
 --------------------


* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:
 
 **Final Milestone-3**

  1. [Frontend: UI/UX section for final milestone](https://github.com/bounswe/bounswe2022group2/issues/975)
  2. [Final Milestone: Individual Contributions Report of Koray Tekin](https://github.com/bounswe/bounswe2022group2/issues/981)


--------------------

**Milestone-2**

  1. [Frontend: Reserach on initializing the Annotation Implementation](https://github.com/bounswe/bounswe2022group2/issues/526)
  2. [Requirements Revision](https://github.com/bounswe/bounswe2022group2/issues/678)

--------------------

**Milestone-1**
 
  1. [Adding my personal wiki page](https://github.com/bounswe/bounswe2022group2/issues/312)
  2. [Discovery and on-boarding for new members](https://github.com/bounswe/bounswe2022group2/issues/320)
  3. [Revising the Requirements and the Diagrams related to conversion of chat/forum](https://github.com/bounswe/bounswe2022group2/issues/344)
  4. [Documentation of meeting notes of first meeting(front-end team)](https://github.com/bounswe/bounswe2022group2/issues/388)
  5. [Research & Report for Frontend Technologies (Frontend Team)](https://github.com/bounswe/bounswe2022group2/issues/327)
 



## *Pull Requests:*
 
 **Final Milestone-3**
1. Frontend: Dev frontend profile page initial layout [#789](https://github.com/bounswe/bounswe2022group2/pull/789)
2. Frontend: Dev frontend contact page [#832](https://github.com/bounswe/bounswe2022group2/pull/832)
3. Frontend: Dev frontend user name component [#838](https://github.com/bounswe/bounswe2022group2/pull/838)
4. Frontend: Dev frontend profile page ls component [#854](https://github.com/bounswe/bounswe2022group2/pull/854)
5. Frontend: Dev frontend update profile [#857](https://github.com/bounswe/bounswe2022group2/pull/857)
6. Frontend: Dev frontend profile page general development [#861](https://github.com/bounswe/bounswe2022group2/pull/861)
7. Frontend: Dev frontend profile page edit [#879](https://github.com/bounswe/bounswe2022group2/pull/879)
8. Frontend: Dev frontend contact page unit test [#896](https://github.com/bounswe/bounswe2022group2/pull/896)
9. Frontend: Dev frontend participated ls profile component unit tests [#899](https://github.com/bounswe/bounswe2022group2/pull/899)
10. Frontend: Merge of Frontend Dvelopment to general Development [#927](https://github.com/bounswe/bounswe2022group2/pull/927)
11. Frontend: UI/UX additions final milestone [#979](https://github.com/bounswe/bounswe2022group2/pull/979)


--------------------

**Milestone-2**

1. Frontend: Implementation of Static Navigation Bar [#534](https://github.com/bounswe/bounswe2022group2/pull/534)
2. Frontend: Implementation of Learning Space initial Components/Layout [#591](https://github.com/bounswe/bounswe2022group2/pull/591)
3. Frontend: Learning Spaces providing back-end connection [#626](https://github.com/bounswe/bounswe2022group2/pull/626)
4. Frontend: HOTFIX Router Modularization [#628](https://github.com/bounswe/bounswe2022group2/pull/628)
5. Frontend: Participants component implementation for LS pages [#654](https://github.com/bounswe/bounswe2022group2/pull/654)
6. Frontend: Unit Tests for Static Footer Component [#689](https://github.com/bounswe/bounswe2022group2/pull/689)

--------------------

**Milestone-1**

1. Frontend: LoginForm Implementation [#399](https://github.com/bounswe/bounswe2022group2/pull/399)
2. Frontend: LoginForm Validation and Back-end Connection [#446](https://github.com/bounswe/bounswe2022group2/pull/446)
3. Frontend: Implementation of Unit tests for LoginForm [#467](https://github.com/bounswe/bounswe2022group2/pull/467)
 
 --------------------
 
## *Unit Tests:*
 1. Unit Tests for Static Footer Component [#689](https://github.com/bounswe/bounswe2022group2/pull/689)
 2. Unit Tests for Login Page [#467](https://github.com/bounswe/bounswe2022group2/pull/467)
 3. Unit Tests for Participated LS's Component [#899](https://github.com/bounswe/bounswe2022group2/pull/899)
 4. Unit Tests for Contact Page [#896](https://github.com/bounswe/bounswe2022group2/pull/896)

## *Additional Information:* 
 
  Since the beginning of this term, I didn't miss any lecture/lab hours and participated in all of the team/sub-group meetings actively.
 
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

## *Responsibilities:*
 
 **Final Milestone-3**
 
 1. Determining the design of the profile page.
 2. Determining the required components for the profile page.
 3. Implementing the profile photo component.
 4. Implementing the about user component.
 5. Implementing the connections between backend and the profile page.
 6. Implementing the connections between learning space pages and user profiles.
 7. Implementing unique url strategy for different profiles and make them accesible for other users.
 8. Researching on annotation packages that is used in our web application.
 9. Revising annotation component to make it compatible with W3C standards.
 10. Implementing the backend connection for annotations both text and image.
 11. Creating unit tests for the components that I have developed.
 12. Reviewing the works done by the frontend team on a regular basis.
 13. Regularly troubleshooting and fixing issues that arise during the development of our web application.
 14. Assisting teammates by answering their questions, addressing pressing issues such as debugging and errors, and implementing quick fixes in advance of presentations or demonstrations.
 15. Attending and participating general meetings regularly.
 16. Attending and participating frontend team meetings regularly.
 
--------------------

**Milestone-2**

  1. Provide an .env file to use in further development
  2. Implementing the change password page.
  3. Implementing the create learning space page.
  4. Implementing the component logic for already created change password page.
  5. Implementing the dropdown component to use in create learning space page.
  6. Implementing the image selection grid component.
  7. Implementing the backend connection between the create learning space page and our REST API.
  8. Providing logic for the communcation of child component with parent component.
  9. Implementing Join Learning Space button.
  10. Implementing Join Learning Space button functionality with backend connection.
  11. Implementing unit tests for Dropdown component.
  12. Implementing unit tests for SelectIconGrid component.
  13. Implementing unit tests for JoinLSButton component.
  14. Conducting research on React libraries, frameworks, and methodologies that will be used during our development process.
  15. Reviewing the works done by the frontend team.
  16. Solving bugs, errors, problems encountered during the implementation of the frontend of our application regularly.
  17. Attending and participating general meetings regularly.
  27. Attending and participating frontend team meetings regularly.
 
--------------------

**Milestone-1**
 
  1. Initializing the project.
  2. Creating the initial sign up and login forms.
  3. Implementing the forget password page.
  4. Implementing the validation check for the forget password form.
  5. Implementing the backend connection between the forget password page and our REST API.
  6. Implementing unit tests for the forget password page.
  7. Integrating mockup home screen to the project.
  8. Conducting research on React libraries, frameworks, and methodologies that will be used during our development process.
  9. Implementing methods for validation.
  10. Implementing methods for backend connection.
  11. Reviewing the works done by the frontend team.

## *Main Contributions:*
 
 
**Final Milestone-3**
 
As a member of the front-end team for Learnify, I have consistently worked closely with my teammates to meet deadlines and achieve our goals. During this milestone, I designed and implemented a part of the profile page, including determining the required components and creating connections to the backend and other learning space pages. I also researched and revised the annotation component to ensure compatibility with W3C standards, and implemented connections to the backend for text and image annotations. In addition, I wrote unit tests for the components I developed, reviewed the work of the frontend team on a regular basis, and assisted my teammates with their questions and provided hotfixes as needed. I also attended and participated in general and frontend team meetings on a regular basis. Overall, my efforts played a significant role in the successful development and maintenance of the web application.

--------------------

**Milestone-2**
 
I am a member of the front-end team of our application Learnify. As a member of the frontend team, I am proud to say that we have a strong team mentality that is focused on collaboration and communication. Over the past Milestone, I have personally contributed to this team mentality by consistently working closely with my teammates to ensure that we are catching the deadlines and the goals that we have set. During this milestone, first thing that I did is carrying static backend links to an .env file to make it more flexible for any change since the number of backend calls will increase while the application is developing so we need to save it as a variable to use at the different parts of the code. Then to complete authentication related issues, I have created the change password component so we are ready for the feature. Then, we have started the Learning spaces and I took the part where we create the learning spaces. After discussions with backend on what to send from the frontend to create a learning space, I have started from implementing a dropdown list and select component and image selection component. To use these components from the create learning space page, I have worked on the function callback from parent to child components. Then after we complete the design of the page, we have worked on both the connections between the frontend and the backend and connections between the pages that we have implemented. At the end, all of the team and I are focused more on the functionality on the learning space page and offering the contents in the learning space page. I have worked closely with the team members during this process and find ways to show the content that we have from the backend. I have watched out our frontend code base during each pull request and did continious testing during and after each merge and make sure that the system is working in a reliable manner. Also, I have implemented unit tests to the components that I have created.

--------------------

**Milestone-1**
 
I am a part of the frontend team of our project. Took part at the naming of the project and the final decision, Learnify is one of my suggestions. After deciding the essentials and seperating into teams, I initialize the frontend project and created initial pages to make colaborative work possible. We decided branch naming conventions to follow each others work easily as frontend team. After that, I was also responsible for the implementation of the forget password page by the design perspective that our team follows. Since we do not have a detailed experience on React, I have go over the basics of React for subjects like; connecting pages, routing, using states, input forms and validations, handling API requests, and unit testing. After my research, individual trials and discussions in the team, I have implemented our forget password page. After that the backend connection, input verification and unit testing. Additionaly, I took part of each of the pull requests by the front end team, review and give feedback to all.
 

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

**Final Milestone-3**
 
 1. [Frontend: Implementation Of Profile Page](https://github.com/bounswe/bounswe2022group2/issues/771)
 2. [Frontend: Creating Profile Picture Component](https://github.com/bounswe/bounswe2022group2/issues/795)
 3. [Frontend: About-Bio Component in Profile Page](https://github.com/bounswe/bounswe2022group2/issues/824)
 4. [Frontend: Backend connection for Bio and PP component](https://github.com/bounswe/bounswe2022group2/issues/837)
 5. [Frontend: Make profile links unique and accessible through ls's](https://github.com/bounswe/bounswe2022group2/issues/844)
 6. [Frontend: Show all ls's that are related to the user](https://github.com/bounswe/bounswe2022group2/issues/884)
 7. [Frontend: Add links to the usernames in the Posts](https://github.com/bounswe/bounswe2022group2/issues/901)
 8. [Frontend: Add links to the usernames in the Comments](https://github.com/bounswe/bounswe2022group2/issues/903)
 9. [Frontend: Text and Image Annotation backend connection](https://github.com/bounswe/bounswe2022group2/issues/918)
 10. [Frontent: Unit tests for AboutUser and ProfilePhoto components](https://github.com/bounswe/bounswe2022group2/issues/929)

 
--------------------

**Milestone-2**
 
  1. [Frontend: .env file and using environment variables in the code](https://github.com/bounswe/bounswe2022group2/issues/529)
  2. [Frontend: Change Password Screen](https://github.com/bounswe/bounswe2022group2/issues/530)
  3. [Frontend: Create Learning Space Page](https://github.com/bounswe/bounswe2022group2/issues/543)
  4. [Frontend: Backend connection of Create Learning Space Page](https://github.com/bounswe/bounswe2022group2/issues/576)
  5. [Frontend: Connection of create ls page with created ls page](https://github.com/bounswe/bounswe2022group2/issues/625)
  6. [Frontend: Join Learning Space](https://github.com/bounswe/bounswe2022group2/issues/656)
  7. [Frontend: Unit Testing Initialization for Dropdown, SelectionGrid, JoinLSButton Components](https://github.com/bounswe/bounswe2022group2/issues/695)

--------------------

**Milestone-1**
 
  1. [Initialization of the frontend project](https://github.com/bounswe/bounswe2022group2/issues/371)
  2. [Frontend: Implementing Forgot Password Screen](https://github.com/bounswe/bounswe2022group2/issues/379)
  3. [Frontend: Backend connection for the Forget Password page](https://github.com/bounswe/bounswe2022group2/issues/444)
  4. [Frontend: Unit Tests for Forget Password page](https://github.com/bounswe/bounswe2022group2/issues/464)
  5. [Frontend: Creating mock home page and adding to the repository](https://github.com/bounswe/bounswe2022group2/issues/465)

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

**Final Milestone-3**
 
 1. [Final Milestone: Status of the Requirements](https://github.com/bounswe/bounswe2022group2/issues/944)
 2. [Final Milestone: Summary of Work Table for Gökay Yıldız](https://github.com/bounswe/bounswe2022group2/issues/941)
 3. [Final Milestone: Individual Contributions Report of Gökay Yıldız](https://github.com/bounswe/bounswe2022group2/issues/942)
 4. [Documenting Meeting Notes #9](https://github.com/bounswe/bounswe2022group2/issues/986)
 
--------------------

**Milestone-2**
 
  1. [Documenting the Meeting Notes for the Frontend Meeting 3](https://github.com/bounswe/bounswe2022group2/issues/542)

--------------------

**Milestone-1**
 
  1. [Personal Wiki Page: Gokay Yildiz](https://github.com/bounswe/bounswe2022group2/issues/311)
  2. [Discovery and Questions about Project for New Members](https://github.com/bounswe/bounswe2022group2/issues/320)
  3. [Revising the Requirements Specification](https://github.com/bounswe/bounswe2022group2/issues/323)
  4. [Research & Report for Frontend Technologies (Frontend Team)](https://github.com/bounswe/bounswe2022group2/issues/327)
  5. [Revising the Requirements: Profile Page](https://github.com/bounswe/bounswe2022group2/issues/345)
  6. [Conducting Research on React Router](https://github.com/bounswe/bounswe2022group2/issues/386)

## *Pull Requests:*

**Final Milestone-3**
 
 1. [Frontend: profile photo component](https://github.com/bounswe/bounswe2022group2/pull/800)
 2. [Frontend: Dev frontend profile page bio](https://github.com/bounswe/bounswe2022group2/pull/835)
 3. [Frontend: connection of bio component](https://github.com/bounswe/bounswe2022group2/pull/841)
 4. [Dev frontend profile page profile photo](https://github.com/bounswe/bounswe2022group2/pull/843)
 5. [Frontend: profile page connections](https://github.com/bounswe/bounswe2022group2/pull/850)
 6. [Dev frontend profile page general development](https://github.com/bounswe/bounswe2022group2/pull/861)
 7. [Frontend: comment and post link added to user](https://github.com/bounswe/bounswe2022group2/pull/904)
 8. [Frontend: Dev frontend annotation be connection](https://github.com/bounswe/bounswe2022group2/pull/922)
 9. [Frontend: unit test initialized for bio and profile picture](https://github.com/bounswe/bounswe2022group2/pull/928)
 10. [Final milestone progress in requirements](https://github.com/bounswe/bounswe2022group2/pull/945)

 
--------------------

**Milestone-2**

1. Frontend: the urls connected to .env [#531](https://github.com/bounswe/bounswe2022group2/pull/531)
2. Dev frontend change password [#537](https://github.com/bounswe/bounswe2022group2/pull/537)
3. Dev frontend create ls  [#572](https://github.com/bounswe/bounswe2022group2/pull/572)
4. Frontend: interconnection between the create ls and ls page is done [#627](https://github.com/bounswe/bounswe2022group2/pull/627)
5. Frontend: Join Learning Space [#657](https://github.com/bounswe/bounswe2022group2/pull/657)
6. HOTFIX HOMEPAGE [#671](https://github.com/bounswe/bounswe2022group2/pull/671)
7. Frontend: unit tests for three components initialized [#694](https://github.com/bounswe/bounswe2022group2/pull/694)

--------------------

**Milestone-1**
 
1. Frontend: Initial pages created to present as an example [#378](https://github.com/bounswe/bounswe2022group2/pull/378)
2. Frontend/forget password [#419](https://github.com/bounswe/bounswe2022group2/pull/419)
3. Frontend: Backend connection to forget password [#445](https://github.com/bounswe/bounswe2022group2/pull/445)
4. Frontend: Frontend/dev to dev [#452](https://github.com/bounswe/bounswe2022group2/pull/452)
5. Frontend: Home page mock [#461](https://github.com/bounswe/bounswe2022group2/pull/461)
6. Frontend/dev forget password unit tests [#463](https://github.com/bounswe/bounswe2022group2/pull/463)

## *Unit Tests:*

**Final Milestone-3**
 
 1. Frontend: unit test initialized for bio and profile picture [#928](https://github.com/bounswe/bounswe2022group2/pull/928)

 
--------------------

**Milestone-2**


1. Frontend: Unit Testing Initialization for Dropdown, SelectionGrid, JoinLSButton Components  [#695](https://github.com/bounswe/bounswe2022group2/issues/695)

--------------------

**Milestone-1**

1. [Frontend: Unit Tests for Forget Password page](https://github.com/bounswe/bounswe2022group2/issues/464)

## *Additional Information:*  
 
**Final Milestone-3**
 
 None
 
--------------------

**Milestone-2**
 
I did not miss any lecture or lab time. Actively participated in all team meetings, demo ideas and demos.

--------------------

**Milestone-1**
 
As a new team member, I have tried to actively participated in the discussions and give suggestions about project. Even though it is hard to catch up the ideas on the project by the team members since they have been dealing with this project for half a year more than me, I managed to be an active member on meetings. I have been there for all lectures, problem sessions, frontend meetings, and general team meetings some of which were held online and some of which were held in person. I shared all information that I know and I learn during the course of development by discord, whatsapp and github issues with the frontend team. 

