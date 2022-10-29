# Deliverables

Below are the hyperlinks to our deliverable documents which are mentioned in the instructions:

* [Software Requirements Specification](https://github.com/bounswe/bounswe2022group2/wiki/Requirements)
* Software Design (UML):
  * [Use-Case Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Use-Case-Diagram)
  * [Class Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Class-Diagram)
  * [Sequence Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Sequence-Diagram)
* Scenarios and Mockups
  * [Registered Lecturer Scenario, Hasan Taşkıran](https://github.com/bounswe/bounswe2022group2/wiki/Registered-Lecturer-Scenario,-Hasan-Ta%C5%9Fk%C4%B1ran)
  * [Unregistered Learner Scenario, Ai Zheng](https://github.com/bounswe/bounswe2022group2/wiki/Unregistered-Learner-Scenario,-Ai-Zheng)
  * [Lecturer Creates Community Event Scenario, Ezgi Ece Smith](https://github.com/bounswe/bounswe2022group2/wiki/Lecturer-Creates-Community-Event-Scenario,-Ezgi-Ece-Smith)
* [Project Plan](https://github.com/bounswe/bounswe2022group2/wiki/Project-Plan)
* [Individual Contribution Reports](#Individual-Contributions-Report)
* [Customer Milestone 1 Group Review](#Milestone-Group-Review)

## Individual Contributions Report

--------------------------  

### *Member:*  

Name: Bahrican Yeşil  
Group: Group2 - Mobile Team

### *Responsibilities:*

  1. Building the main structure of the Flutter project
  2. Implementing core managers: network, navigation, and local storage managers
  3. Adding multi-theme and multi-language structure base.
  4. Implementing sign up screen, making its back-end connection
  5. Writing tests of the sign up screen
  6. Implementing static profile screen
  7. Writing tests of the profile screen
  8. Make the app icon as our logo and configure the app name
  9. Implementing bottom navigation and app bars
  10. Reviewing all works done by mobile teammates  

### *Main contributions:*

I especially contributed to the mobile side with Flutter since I am a part of the mobile team. I have set up the base project, implemented the base managers (network, navigation, local), base widgets and logics which appear at almost every part of the app (like extensions, common widgets, helpers). I also took the responsibility of the signup and profile (static) screens and implemented them successfully. I did a research on testing with Flutter and I wrote the tests of the screens I developed. These tests created helpful examples for my teammates to use.

* *Code related significant issues:* My issues that contribute to the code base
demonstrated during the demo:
  1. [Implementation of MVVM Setup, Extensions and the Initial App Widget](https://github.com/bounswe/bounswe2022group2/issues/350)
  2. [Mobile: Implementing Sign Up Screen](https://github.com/bounswe/bounswe2022group2/issues/358)
  3. [Mobile: Writing Tests for Sign Up Screen](https://github.com/bounswe/bounswe2022group2/issues/359)
  4. [Mobile: Back-end Connection of Sign Up Endpoint](https://github.com/bounswe/bounswe2022group2/issues/369)
  5. [Mobile: Implementing Static Profile Screen](https://github.com/bounswe/bounswe2022group2/issues/397)
  6. [Mobile: Writing Tests of the Profile Screen](https://github.com/bounswe/bounswe2022group2/issues/403)
  7. [Mobile: Implementing the Navigation Manager](https://github.com/bounswe/bounswe2022group2/issues/356)
  8. [Mobile: Base Setup for Multi-Language and Multi-Theme Setup](https://github.com/bounswe/bounswe2022group2/issues/357)
  9. [Mobile: Bottom Navigation and App Bar Widgets](https://github.com/bounswe/bounswe2022group2/issues/393)
* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Revising the Requirements: Authentication](https://github.com/bounswe/bounswe2022group2/issues/331)
  2. [Revising the Diagrams based on Signup&Login](https://github.com/bounswe/bounswe2022group2/issues/337)
  3. [Documenting Meeting Notes for the Meeting 3 of CMPE 451](https://github.com/bounswe/bounswe2022group2/issues/348)
  4. [Documenting Meeting Notes for the Meeting 1 of Mobile Team](https://github.com/bounswe/bounswe2022group2/issues/349)
  5. [Revising the Diagrams based on Signup&Login](https://github.com/bounswe/bounswe2022group2/issues/337)
  6. [Preparing Milestone 1 - CMPE 451 Deliverables](https://github.com/bounswe/bounswe2022group2/issues/409)

### *Pull requests:*

1. Initial app, MVVM design pattern and other helper functions [#354](https://github.com/bounswe/bounswe2022group2/pull/354)
2. Implementation of the Navigation Manager [#360](https://github.com/bounswe/bounswe2022group2/pull/360)
3. Base Setup for Multi Language and Multi Theme Support [#361](https://github.com/bounswe/bounswe2022group2/pull/361)
4. Implementation of Sign Up Screen [#368](https://github.com/bounswe/bounswe2022group2/pull/368)
5. Tests of the Sign Up Screen [#373](https://github.com/bounswe/bounswe2022group2/pull/373)
6. Back-end Connection of the Sign Up Screen and Tests [#389](https://github.com/bounswe/bounswe2022group2/pull/389)
7. Bottom Navigation and App Bar Widgets [#394](https://github.com/bounswe/bounswe2022group2/pull/394)
8. Static Profile Screen [#400](https://github.com/bounswe/bounswe2022group2/pull/400)
9. Profile Screen Tests [#404](https://github.com/bounswe/bounswe2022group2/pull/404)
10. Configuring app icon as our logo [#402](https://github.com/bounswe/bounswe2022group2/pull/402)
11. Creating milestone 1 deliverables and individual report [#410](https://github.com/bounswe/bounswe2022group2/pull/410)

### *Additional information:*  

I built the base file, folder structure on mobile project. We have decided to use MVVM design pattern while implementing the project and I created a base structure for it. I have informed my teammates about the user flow we should follow.

I actively participated in and give suggestions about the endpoints we should have. I also give suggestions about the request and response bodies of the endpoints. I explained some concepts and real-life examples of the front designs both for web and mobile. I contributed to the logic we should implement in the authentication flow (signup-login-forgot password-email verification)

### *Member:*  

Name: Ecenur Sezer  
Group: Group2 - Backend Team

### *Responsibilities:*

  1. Implementing the login endpoint
  2. Implementing the verify email endpoint
  3. Testing and documenting both endpoints
  4. Implementing unit tests for both endpoints
  5. Reviewing all works done by backend teammates  
  6. Doing research on technologies needed to use on backend development

### *Main contributions:*

We are a team of three for backend development of Learnify app. In that context, I firstly deeply researched the popular technologies on software development and we decided as a team on Node.js. Secondly, we do job share on implementation of needed endpoints. For Milestone 1, we had 4 endpoints planned and I implemented two of them, verify email and login.

* *Code related significant issues:* My issues that contribute to the code base
demonstrated during the demo:
  1. [Backend: Implementing Unit Tests for Login Endpoint ](https://github.com/bounswe/bounswe2022group2/issues/421)
  2. [Backend: Writing Tests for Verify Email Endpoint](https://github.com/bounswe/bounswe2022group2/issues/418)
  3. [Backend: Implementation of Login API ](https://github.com/bounswe/bounswe2022group2/issues/380)
  4. [Backend: Email Verification API](https://github.com/bounswe/bounswe2022group2/issues/364)
* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Research & Report for Backend Technologies (Backend Team) ](https://github.com/bounswe/bounswe2022group2/issues/321)
  2. [Revising the Requirements : User - User Interaction](https://github.com/bounswe/bounswe2022group2/issues/334)
  3. [Revising the Requirements : Glossary](https://github.com/bounswe/bounswe2022group2/issues/335)
  4. [Revising the Diagrams based on User - User Interaction ](https://github.com/bounswe/bounswe2022group2/issues/336)
  5. [Reviewing the Revising the Requirements: Achievements and Badges ](https://github.com/bounswe/bounswe2022group2/issues/333)
  6. [Reviewing the Revising the Diagrams based on Signup&Login](https://github.com/bounswe/bounswe2022group2/issues/337)
  7. [Reviewing the Revising the Diagrams based on Achievements](https://github.com/bounswe/bounswe2022group2/issues/346)
  8. [Reviewing the Dockerization of the API](https://github.com/bounswe/bounswe2022group2/issues/355)

### *Pull requests:*

1. Backend: Implementing Unit Tests for Login endpoint  [#422](https://github.com/bounswe/bounswe2022group2/pull/422)
2. Backend: Implementing Tests for Verify Email Endpoint [#420](https://github.com/bounswe/bounswe2022group2/pull/420)
3. 380 implementation of login api [#380](https://github.com/bounswe/bounswe2022group2/pull/380)
4. Verify email endpoint [#374](https://github.com/bounswe/bounswe2022group2/pull/374)

### *Additional information:*  
I have attended all team meetings on backend & overall. Some took part face-to-face and some were on Discord.

## Milestone Group Review