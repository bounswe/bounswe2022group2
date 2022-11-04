# Group 2 - Milestone 1 - Group Review

1. [Executive Summary](#executive-summary)
2. [List and status of deliverables](#list-and-status-of-deliverables)
3. [Evaluation of the status of deliverables and its impact on your project plan](#evaluation-of-deliverables)
4. [Evaluation of tools and processes you have used to manage your team project](#evaluation-of-tools-and-processes)
5. [Review the Milestone](#review-the-milestone)
6. [The requirements addressed in this milestone](#requirements)
7. [Overall description of responsibilities that are assigned to each member](#responsibilities)
8. [A Summary of work performed by each team member (in tabular format)](#summary-of-individual-work)

---------

## Executive Summary

Our application is an online learning platform named Learnify, where learning is accomplished through collaboration. Our application name comes from the words Learn and Unify. Each user can add their expertise to the learning space on our platform by adding any content, comments, notes, or even annotations to the already-existing learning materials. The application is not based on teachers and students, it has a forum  where the users who take part a learning space can share their thoughts and recommendation.There are also annotation available for learning space contents so the users can take notes and reminders for theirselves and other users. This features provide ultimate collaboration on learning spaces. Our application works on mobile and web platforms. The current status of our application is that it supports sing-up, login, email verification, forgot password and resend email verification code features. These were the requirements we aimed to implement for Milestone-1.

## List and Status of Deliverables

|Deliverable|Status|Date Delivered| 
|-----|:--------:|:------:| 
|[Software Requirements Specification](https://github.com/bounswe/bounswe2022group2/wiki/Requirements)| Delivered |01/11/2022 |
|[Software Design (UML):Use-Case Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Use-Case-Diagram)|Delivered|01/11/2022|
|[Software Design (UML):Class Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Class-Diagram)|Delivered|01/11/2022|
|[Software Design (UML):Sequence Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Sequence-Diagram)|Delivered|01/11/2022|
|Scenarios and Mockups ([1](https://github.com/bounswe/bounswe2022group2/wiki/Registered-Lecturer-Scenario,-Hasan-Ta%C5%9Fk%C4%B1ran),   [2](https://github.com/bounswe/bounswe2022group2/wiki/Unregistered-Learner-Scenario,-Ai-Zheng),  [3](https://github.com/bounswe/bounswe2022group2/wiki/Lecturer-Creates-Community-Event-Scenario,-Ezgi-Ece-Smith)) | Delivered | 01/11/2022|
|[Project Plan](https://github.com/bounswe/bounswe2022group2/wiki/Project-Plan)|Delivered|01/11/2022|
|[Individual Contribution Reports](https://github.com/bounswe/bounswe2022group2/blob/master/deliverables/CMPE451_Customer_Presentation_Milestone_1/deliverables.md#Individual-Contributions-Report)|Delivered|01/11/2022|
|[Software](https://github.com/bounswe/bounswe2022group2) | Delivered | 01/11/2022| 
|Mobile Deliverables ([Manual](https://github.com/bounswe/bounswe2022group2/wiki/System-Manual),     [APK](https://github.com/bounswe/bounswe2022group2/wiki/Learnify-Mobile-APK))|Delivered |01/11/2022|
|Group Review (This Document) | Delivered | 04/11/2022|




---------

## Evaluation of Deliverables

---------

## Evaluation of Tools and Processes

### ~ Evaluation of Tools ~

#### **1. General**

We used so many different tools while we are developing the project. Since in this term we have divided into different sub-teams, the number, and variety of the tools we used also increased. When we are having a conversation about choosing a tool for development, we considered several points. We can say that one of the most significant items that we considered is that the tool has to enable us to work collaboratively and to track each other easily in an organized way. Another thing we considered is the use of the tool. The reason behind this consideration is the fact that we have so limited time to develop the project. Therefore, having familiarity with the tool will be a good advantage for all of us.

#### **2. Discord**

We used Discord as our main communication tool. All team meetings including the sub-team meetings were held via the voice channels we created. We have created a different voice and text channels for different needs such as meeting notes, mobile team, front-team, back-team, research material, and general and random chats. We found Discord to be useful as our main communication tool since it is easy to use and many of us were already familiar with it. Having multiple voice channels in the same group and being able to separate text channels were the main features that we benefit from.

Besides these, using threads to separate messages within the same text channel (such as having a new thread for each meeting or research topic) made our channel easy to navigate and organized. Overall, Discord provided all the basic features we required from a team communication environment. All team members were able to organize, see and track the notes, and texts written under the channels.

#### **3. GitHub**

The GitHub repository is where all progress made as well as all the deliverables can be viewed. Our whole code is stored under GitHub and we are managing our code base with the help of Git&GitHub. Our repository provides a portfolio of all the work we have done. It includes information about who we are and all the design and research we have done in the wiki section. It includes information about what should be expected from the project we are developing and also who has done what via the regularly created and maintained issues. Additionally, since we started the real-implementation of the real project we assigned (Online Learning Platform), the whole code of the project is in the project repository.

GitHub is the most important tool we are using during the development of the project. The reason for this is the fact that it gathers everything we have done in one place including not only the code lines but also the documents, deliverables, meeting notes, and so on. Almost all types of work we have done include Github in one way, every task of design, documentation, research, assignment tracking, and even reviews include and can be reached from our GitHub repository.

We are also actively using the version control aspects of Github such as committing changes and merging branches. We actively opened issues for the work we will do, we held the development processes under branches we created. We opened pull requests after each development, got a review (at least 1 with the help of branch protection we set), and merged firstly to dev and then master.

We found Github to be useful for this purpose as it contains every feature we needed for such a tracking and management system. Also, it has good user interaction for both the contributors and outsiders observing. Alternatives such as BitBucket provide similar features for version management but we find Github is more useful in terms of merging version control and information wiki together in one space.

#### **4. Flutter**

We conducted research on Flutter before we decided to use it for mobile development. Here are our findings and reasonings to choose Flutter as the tool for Mobile development:

1- Flutter is based on Dart language which is so similar to Java. Since we all took beginner-level courses in the department with Java and learned the programming basics with Java, using Dart will not be a problem for us, and the adaptation process will be easy for us.
2- In Flutter, the visual (UI) and logic parts of the code are included in the one-single code base. This fact eases and speeds up the coding. In the end, we can reach MVP and the aimed version of the app in a shorter time compared to other technologies.
3- Normally, it is expected to performance decrease in cross-platform technologies. Even though Flutter has also some downgrades, it serves near-to-native performance in most cases with the help of the Dart compiler since it converts the Flutter app to native code. In the end, we are able to use the native features.
4- We are building a huge app with lots of features and so with lots of screens, UI components, widgets, and so on. This brings up complexity and difficulty of implementation. However, Flutter gives various UI components as in-built support and you can use all of them as just widgets. Besides this, its package system ([pub.dev](https://pub.dev/)) has lots of free open-source packages that include various design/logic solutions for apps.
5- Flutter has a hot-reload feature with a very fast reloading time. This feature will be very useful in the development and debugging process!
6- We have experienced people with Flutter, this will speed up our development and we will be able to implement almost all features with good design and code patterns in the given time (1 semester).
7- We have people who are very curious about Flutter and want to learn it. This curiosity and desire to learn will carry us forward when we start to code the project.

After the first milestone demo, we understood that we gave the correct decision by choosing Flutter. We were able to quickly develop the first milestone with lots of good features, nice design touches, and fewer problems. People in the mobile team who have curious about Flutter but have no experience got the initial experience. According to their feedback in our team meetings, we are satisfied with the development experience with Flutter.

#### **5. NodeJS**

We choosed to implement our application on NodeJS keeping following in mind.

1- We already have implemented our practice app in Node.JS, thus, members were educated on the stack. We have already completed courses on REST API implementation on NodeJS. Moreover, we already have a base project to use with some cool features readily implemented like in memory test database from our test API.

2- It is considerably more lightweight compared to its closest competitor(Python) during our research, since we will be using a free tier EC2 instance, we try to keep our CPU usage low as much as possible.

3- It is a well established stack, meaning it will be more reliable than other suggestions like FastAPI(which is still in alpha).

4- There is a huge community of NodeJs, thus, a huge community support and lots of out of the box packages for DB access, data validation, etc.

The last point was the actual reason we have gone with the NodeJS and during our implementation we enjoyed being able to Google every bug we encountered.


#### **6. Docker and the DockerHub**

As the our team has grew and divided, setting up the apps on everyone's local environments was not feasible, so we dockerized our database, backend, and frontend via collecting all containers in a single dockerfile. This is especially helpful with EC2 instances because they come with virtually no software installed on Ubuntu. However, one problem with docker being we use more than 3000 packages for our frontend, thus, each docker build requires a considerable computation power which consumes almost all the CPU credits on our EC2 instance. This is where DockerHub comes into the picture. We created docker images on our personal computers and uploaded images to the DockerHub to be used on our EC2 instance. In the next stages of the project we plan to make it so all members can access to all containers on DockerHub. 

Our docker images are private on Dockerhub because they come with bash installed, so if we made them public, anyone on the internet can access to our API keys(like the one we use to connect to our Gmail Address).

#### **7. AWS: EC2 and Cloudwatch**

Both of our apps, practice app and Learnify, are deployed on free EC2 instances with their databases alongside. Only interface our EC2 machines provide are through API's and there is no way to directly access the databases, keeping our data safe and square. Instance's ssh settings are on default, so that shh connection can be established only using a .pem file.

One crucial mistake we have been made last semester was not keeping an eye on our instance monitoring which resulted in a 10$ bill. Therefore, this semester we introduced AWS Cloudwatch to our system. Cloudwatch is a monitoring tool provided by AWS that checks our instance's CPU usage, CPU credit(amount of CPU time our free instance has left) and runtime. We set the cloudwatch so that if we ever get close to the billing range, it will shut down the server automatically, keeping us safe in the free-tier zone.

#### **8. Gmail**

We needed a mail account to send our verification mails. This comes with some complications since logging in to a mail account as a person(performing a Captcha check) is a lot simpler than logging in to a mail account as a bot. Most providers require you to set a development account and store some keys for OAuth2 authentication. However, Google implemented a quite developer friendly system named Application Password. Their working process is in the following: You generate an application password from Gmail web interface then use that password to perform OAauth1 authentication. Then the password is set for your MAC address and your application can log in to Gmail using its MAC and Application Password pair. This requires generating a new application password for each device our server will run but generating one for the server and 3 for backend memebers were sufficient since mobile and front teams directly interacted with the API set up on EC2 instance.   

---------

## Review the Milestone

---------

### ~ Against Objectives ~

---------

### ~ Progress ~

With the start of the semester, we have started the development of our application Learnify. Learnify is an online learning platform, which aims to create a collaborative learning space for all the users. Although we have successfully completed the design and planning phases of our project last semester, we needed to revise most of the design before starting the development. We have divided into three teams, which have worked on separate parts of our application. Frontend team worked on the web application, mobile team worked on the mobile application, and the backend team worked on the development of our RESTful API. At the beginning of our development phase we have updated our communication plan and project plan according to the needs and aims of the scope of our project. We have welcomed new members. Every week we have held a customer meeting, in which we discussed the current state of our project and in the following a general group meeting where everyone participated and the tasks are identified for the next week. Every development team also held their own meetings each week to meet the objectives of our application’s development.

For the milestone 1, we have aimed to have a fully functioning authentication part of our application. After discussing with our customer, we have decided to have e-mail verification for a registered user. Also, when a user forgets their password, they can also reset their password via e-mail verification. For the demonstration purposes, a static mockup homepage also can be seen after successfully signing in to our application. To develop every related part of the project each team collaboratively worked together and before Milestone 1 every feature, page, and screen was implemented, tested, dockerized, and deployed as planned. We have effectively used React and some external libraries for frontend, Flutter for mobile, Node.js for the backend, Docker for dockerization, and AWS for the deployment.

---------

### ~ What went well? ~

---------

### ~ What did not go well? ~

---------

### ~ The Customer Presentation ~

---------

## Requirements
These are the Requirements addressed up to this milestone.  
**1.1.1.1. Signup**   
1.1.1.1.1. Guests shall enter an unused username, an unregistered email address, and a strong password to signup.  
1.1.1.1.2. Guests shall agree to the privacy policy and terms&conditions to signup.  
**1.1.1.2. Login**  
1.1.1.2.1. Users shall provide their usernames and passwords to log in.  
**1.1.1.3. Email Verification**  
1.1.1.3.1. Users shall enter the received verification codes (via their registered email addresses) to complete the email verification process.  
**1.1.1.4. Forgot Password**  
1.1.1.4.1. Users shall first enter the email addresses they signed up with and then the verification code they received.  
**1.1.1.5. Logout**  
1.1.1.5.1. Users shall be able to log out.  
**1.1.2. Profile Page**  
1.1.2.1. Users shall have a profile page.  
1.1.2.4. Users shall have an avatar.  
1.1.2.5. Users shall be able to change their avatars.  
**2.1.  Availability and Accessibility**  
2.1.1. System should have a Website interface that provides an web specific user experience.  
2.1.2. System should have a Android application interface that provides an mobile specific user experience.  
2.1.4. System should support English language.  
**2.2. Privacy**  
2.2.1. Ethical concerns must be considered, so system must follow the rules defined by GDPR/KVKK.  
2.2.1.2 Users must agree to the Privacy Policy and User Agreement.  
**2.3. Security**  
2.3.1 All sensitive data shall be encrypted before storing.  
**2.5. Usability**  
2.5.1 The system should provide a user-friendly interface. It should contain a basic site map and should not contain a confusing linking system.  
2.5.2 The system should provide a direct feedback mechanism. Upon interaction, user shall be informed about success or failure of their action.  
2.5.3 The system should have a well-chosen typeface that should be readable and clean.  

---------

## Responsibilities

- **Altay Acar**
    1. Designing the logo of our app and determining the typeface and color scheme that is used throughout the app.
    2. Building the main structure and layout of authentication pages.
    3. Implementing the sign up page.
    4. Implementing the validation check for the sign up form.
    5. Implementing the backend connection between the sign up page and our REST API.
    6. Implementing unit tests for the sign up page.
    7. Conducting research on React libraries, frameworks, and methodologies that will be used during our development process.
    8. Providing methods for validation.
    9. Providing methods for backend connection.
    10. Providing methods for unit tests.
    11. Dockerization of the frontend.
    12. Deployment of the frontend.
    13. Creating a new mockup homepage image for the demonstration.
    14. Reviewing the works done by the frontend team.

- **Egemen Atik**
    1. Implementing verification screen and providing its back-end connection.
    2. Implementing the resend button and countdown timer for verification screen.
    3. Implementing widget tests and network tests for verification screen.
    4. Implementing a horizontal scrollable course preview list widget for home screen.
    5. Reviewing all works done by the mobile team members.
    6. Learning Flutter and testing in Flutter.
    7. Revising and updating requirements and UML diagrams related to Lecture Structure.

- **Ezgi Aysel Batı**
    1. Implementing forget password screen and backend connection for mobile.
    2. Implementing Course Preview widget which is the main component of mobile home page.
    3. Implementing unit & widget tests.
    4. Reviewing and testing work done by other mobile team members.
    5. Revising Requirements & UML design related to User-Lecture interactions
    6. Writing System Manual for Mobile.
    7. Learning flutter, flutter testing.

- **Ecenur Sezer:**
    1. Implementing the login endpoint
    2. Implementing the verify email endpoint
    3. Testing and documenting both endpoints
    4. Implementing unit tests for both endpoints
    5. Reviewing all works done by backend teammates  
    6. Doing research on technologies needed to use on backend development

- **Onur Kömürcü**
    1. Implementing login screen and its backend connection for mobile app.
    2. Implementing widget and network test for login screen.
    3. Reviewing the codes that are written by mobile team.
    4. Learning implementation details of Flutter.
    5. Revising achievements related software requirements specifications and UML diagrams.
    6. Updating project plan and communication plan.


- **Bahrican Yeşil:**
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

---------

## Summary of Individual Work

- **Altay Acar**
  |Issue Title|Link|
  |-----|:--------:|
  |Revising the Requirements Specification #323|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/323)|
  |Research & Report for Frontend Technologies (Frontend Team) #327|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/327)|
  |Documenting Meeting Notes for the Meeting 2 of CMPE 451 #328|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/328)|
  |Revising the Requirements Specification: Notifications #329|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/329)|
  |Designing the Logo and Determining Color Scheme, Typeface of the Project #353|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/353)|
  |Frontend: Implementation of Sign Up Page #376|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/376)|
  |Frontend: Backend Connection for the Sign Up Page #405|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/405)|
  |Frontend: Dockerization of the Frontend #412|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/412)|
  |Frontend: Adding Form Validations for Sign Up Form #424|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/424)|
  |Frontend: Unit Tests for Sign Up Page #451|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/451)|
  |AWS Deployment of the Web Application #459|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/459)|
  
  |Pull Request Title|Link|
  |-----|:--------:|
  |Frontend: Sign up page implementation|[#387](https://github.com/bounswe/bounswe2022group2/pull/387)|
  |Dockerization of Frontend|[#413](https://github.com/bounswe/bounswe2022group2/pull/413)|
  |Frontend: Sign Up Form Validation|[#426](https://github.com/bounswe/bounswe2022group2/pull/426)|
  |Frontend: Backend connection for sign up page|[#438](https://github.com/bounswe/bounswe2022group2/pull/438)|
  |Frontend: Unit tests for sign up page|[#456](https://github.com/bounswe/bounswe2022group2/pull/456)|

- **Egemen Atik**
  |Issue Title|Link|
  |-----|:--------:|
  |Mobile: Scrollable Horizontal Course List Widget For Home Screen #457|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/457)|
  |Mobile: Writing Network Connection Tests for Verification Screen #454|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/454)|
  |Mobile: Back-end Connection of Verification Screen #434|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/434)|
  |Documenting Meeting Notes for the Meeting 2 of Mobile Team #427|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/427)|
  |Documenting Meeting Notes for the Meeting 4 of CMPE 451 #425|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/425)|
  |Mobile: Writing Tests for Verification Screen #417|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/417)|
  |Mobile: Implementing Verification Screen #395|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/395)|
  |Revising the Diagrams based on Lecture Structure #347|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/347)|
  |Revising the Requirements: Lecture Structure #341|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/341)|
  |Update Requirements Page #325|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/325)|
  |Update Personal Wiki Pages #324|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/324)|

  |Pull Request Title|Link|
  |-----|:--------:|
  |Mobile: Scrollable horizontal course list widget for home screen / 457|[#462](https://github.com/bounswe/bounswe2022group2/pull/462)|
  |Mobile: Verification screen network tests|[#455](https://github.com/bounswe/bounswe2022group2/pull/455)|
  |Mobile: Back-End Connection of Verification Screen/434|[#435](https://github.com/bounswe/bounswe2022group2/pull/435)|
  |Mobile/verification screen tests 417|[#432](https://github.com/bounswe/bounswe2022group2/pull/432)|
  |Mobile/verification screen 395|[#416](https://github.com/bounswe/bounswe2022group2/pull/416)|

- **Ezgi Aysel Batı**
  |Issue Title|Link|
  |-----|:--------:|
  |Mobile Team: Setting up development Environment #372|[Issue](https://github.com/bounswe/bounswe2022group2/issues/372)|
  |Mobile: Implementing Forget Password Screen #375|[Issue](https://github.com/bounswe/bounswe2022group2/issues/375)|
  |Mobile: Writing Tests for Forget Password Screen #383|[Issue](https://github.com/bounswe/bounswe2022group2/issues/383)|
  |Mobile: Back-end Connection of Forget Password/Verify Email Endpoint #384|[Issue](https://github.com/bounswe/bounswe2022group2/issues/384)|
  |Mobile: Custom Widget For Course Preview #408|[Issue](https://github.com/bounswe/bounswe2022group2/issues/408)|
  |Revising the Requirements: User-Lecture Interaction #330|[Issue](https://github.com/bounswe/bounswe2022group2/issues/330)|
  |Updating ReadMe #317|[Issue](https://github.com/bounswe/bounswe2022group2/issues/317)|
  |Revising the Diagrams based on User - Lecture Interaction #343|[Issue](https://github.com/bounswe/bounswe2022group2/issues/343)|
  |Writing System Manual For Mobile #407|[Issue](https://github.com/bounswe/bounswe2022group2/issues/407)|
    
  |Pull Request Title|Link|
  |-----|:--------:|
  |Mobile/forget password screen|[#382](https://github.com/bounswe/bounswe2022group2/pull/382)|
  |Mobile: course preview widget |[#430](https://github.com/bounswe/bounswe2022group2/pull/430)|
  |Mobile: forget password backend|[#433](https://github.com/bounswe/bounswe2022group2/pull/433)|
  |Mobile: implement tests for forget password|[#442](https://github.com/bounswe/bounswe2022group2/pull/442)|
  
- **Ecenur Sezer**
  |Issue Title|Link|
  |-----|:--------:|
  |Backend: Implementing Unit Tests for Login Endpoint|[Issue](https://github.com/bounswe/bounswe2022group2/issues/421)|
  |Backend: Writing Tests for Verify Email Endpoint|[Issue](https://github.com/bounswe/bounswe2022group2/issues/418)|
  |Backend: Implementation of Login API|[Issue](https://github.com/bounswe/bounswe2022group2/issues/380)|
  |Backend: Email Verification API|[Issue](https://github.com/bounswe/bounswe2022group2/issues/364)|
  |Research & Report for Backend Technologies (Backend Team)|[Issue](https://github.com/bounswe/bounswe2022group2/issues/321)|
  |Revising the Requirements : User - User Interaction|[Issue](https://github.com/bounswe/bounswe2022group2/issues/334)|
  |Revising the Requirements : Glossary|[Issue](https://github.com/bounswe/bounswe2022group2/issues/335)|
  |Prepaing the Slide for our First Demo|[Issue](https://github.com/bounswe/bounswe2022group2/issues/460)|
    
  |Pull Request Title|Link|
  |-----|:--------:|
  |Backend: Implementing Unit Tests for Login endpoint |[#422](https://github.com/bounswe/bounswe2022group2/pull/422)|
  |Backend: Implementing Tests for Verify Email Endpoint|[#420](https://github.com/bounswe/bounswe2022group2/pull/420)|
  |380 implementation of login api|[#380](https://github.com/bounswe/bounswe2022group2/pull/380)|
  |Verify email endpoint|[#374](https://github.com/bounswe/bounswe2022group2/pull/374)|
  
- **Onur Kömürcü:**
  |Issue Title|Link|
  |-----|:--------:|
  |Mobile: Setting up development Environment|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/372)|
  |Mobile: Implementation of Login Screen Including Backend Connection|[Issue Link](https://github.com/bounswe/bounswe2022group2/pull/398)|
  |Mobile: Writing Tests for Login Page|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/447)|
  |Milestone 1: Project Plan|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/448)|
  |Updating Communication Plan|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/377)|
  |Updating the Project plan for upcoming semeste|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/316)|
  |Revising the Requirements: Achievements and Badges|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/333)|
  |Revising the Diagrams based on Achievements|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/346)|
  |Updating Personal Wiki Pages|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/324)|
  
  |Pull Request Title|Link|
  |-----|:--------:|
  |Mobile: Implementing Login Page Including Backend Connection|[#396](https://github.com/bounswe/bounswe2022group2/issues/396)|
  |Mobile: Tests for Login Page|[#485](https://github.com/bounswe/bounswe2022group2/pull/485)|
  
- **Bahrican Yeşil:**
  |Issue Title|Link|
  |-----|:--------:|
  |Implementation of MVVM Setup, Extensions and the Initial App Widget|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/350)|
  |Mobile: Implementing Sign Up Screen|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/358)|
  |Mobile: Writing Tests for Sign Up Screen|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/359)|
  |Mobile: Back-end Connection of Sign Up Endpoint|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/369)|
  |Mobile: Implementing Static Profile Screen|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/397)|
  |Mobile: Writing Tests of the Profile Screen|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/403)|
  |Mobile: Implementing the Navigation Manager|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/356)|
  |Mobile: Base Setup for Multi-Language and Multi-Theme Setup|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/357)|
  |Mobile: Bottom Navigation and App Bar Widgets|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/393)|
  |Mobile: Implement App Icon|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/401)|
  |Revising the Requirements: Authentication|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/331)|
  |Revising the Diagrams based on Signup&Login|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/337)|
  |Documenting Meeting Notes for the Meeting 3 of CMPE 451|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/348)|
  |Documenting Meeting Notes for the Meeting 1 of Mobile Team|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/349)|
  |Revising the Diagrams based on Signup&Login|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/337)|
  |Preparing Milestone 1 - CMPE 451 Deliverables|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/409)|
  |Updating Sidebar|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/313)|
  |Revising Mockups|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/326)|
  |Report and Research on Flutter|[Issue Link](https://github.com/bounswe/bounswe2022group2/issues/314)|

  |Pull Request Title|Link|
  |-----|:--------:|
  |Initial app, MVVM design pattern and other helper functions|[#354](https://github.com/bounswe/bounswe2022group2/pull/354)|
  |Implementation of the Navigation Manager|[#360](https://github.com/bounswe/bounswe2022group2/pull/360)|
  |Base Setup for Multi Language and Multi Theme Support|[#361](https://github.com/bounswe/bounswe2022group2/pull/361)|
  |Implementation of Sign Up Screen|[#368](https://github.com/bounswe/bounswe2022group2/pull/368)|
  |Tests of the Sign Up Screen|[#373](https://github.com/bounswe/bounswe2022group2/pull/373)|
  |Back-end Connection of the Sign Up Screen and Tests|[#389](https://github.com/bounswe/bounswe2022group2/pull/389)|
  |Bottom Navigation and App Bar Widgets|[#394](https://github.com/bounswe/bounswe2022group2/pull/394)|
  |Static Profile Screen|[#400](https://github.com/bounswe/bounswe2022group2/pull/400)|
  |Profile Screen Tests|[#404](https://github.com/bounswe/bounswe2022group2/pull/404)|
  |Configuring app icon as our logo|[#402](https://github.com/bounswe/bounswe2022group2/pull/402)|
  |Creating milestone 1 deliverables and individual report|[#410](https://github.com/bounswe/bounswe2022group2/pull/410)|
  |Update Issue Templates|[#340](https://github.com/bounswe/bounswe2022group2/pull/340)|
  |Create the base folder structure and base files of the Flutter project|[#342](https://github.com/bounswe/bounswe2022group2/pull/342)|
