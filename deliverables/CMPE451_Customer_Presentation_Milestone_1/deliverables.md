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

Name: Altay Acar

Group: Group2 - Frontend Team

### *Responsibilities:*

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

### *Main contributions:*

I am a member of our fronend team for the development of our application, namely Learnify. Generally, I took the responsibility of visual side of our web application. For that extent I have designed our logo, provided and appropriate typeface and color scheme using Adobe applications. Then, I have provided the general layout and structure of our authentication pages with appropriate theme. I was also responsible for the implementation of the sign up page from the scratch. Since any of us in the frontend team is not used to work with React,I have conducted very detailed research on how to connect pages, how to uses states, how to validate form inputs, how to handle API requests, and how to do unit testing. In the light of my findings I have implemented our sign up page: First the initial structure and layout, then the validation, then the backend connection, and last the unit testing. Additionaly I took care of the dockerization and the AWS deployment of our web application's frontend.

* *Code related significant issues:* My issues that contribute to the code base
demonstrated during the demo:
  1. [Designing the Logo and Determining Color Scheme, Typeface of the Project](https://github.com/bounswe/bounswe2022group2/issues/353)
  2. [Frontend: Implementation of Sign Up Page](https://github.com/bounswe/bounswe2022group2/issues/376)
  3. [Frontend: Backend Connection for the Sign Up Page](https://github.com/bounswe/bounswe2022group2/issues/405)
  4. [Frontend: Adding Form Validations for Sign Up Form](https://github.com/bounswe/bounswe2022group2/issues/424)
  5. [Frontend: Unit Tests for Sign Up Page](https://github.com/bounswe/bounswe2022group2/issues/451)
  6. [Frontend: Dockerization of the Frontend](https://github.com/bounswe/bounswe2022group2/issues/412)
  7. [AWS Deployment of the Web Application](https://github.com/bounswe/bounswe2022group2/issues/459)
* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Revising the Requirements Specification](https://github.com/bounswe/bounswe2022group2/issues/323)
  2. [Research & Report for Frontend Technologies (Frontend Team)](https://github.com/bounswe/bounswe2022group2/issues/327)
  3. [Documenting Meeting Notes for the Meeting 2 of CMPE 451](https://github.com/bounswe/bounswe2022group2/issues/328)
  4. [Revising the Requirements Specification: Notifications](https://github.com/bounswe/bounswe2022group2/issues/329)

### *Pull requests:*

1. Frontend: Sign up page implementation [#387](https://github.com/bounswe/bounswe2022group2/pull/387)
2. Dockerization of Frontend [#413](https://github.com/bounswe/bounswe2022group2/pull/413)
3. Frontend: Sign Up Form Validation [#426](https://github.com/bounswe/bounswe2022group2/pull/426)
4. Frontend: Backend connection for sign up page [#438](https://github.com/bounswe/bounswe2022group2/pull/438)
5. Frontend: Unit tests for sign up page [#456](https://github.com/bounswe/bounswe2022group2/pull/456)

***

### *Member:*  

Name: Egemen Atik  

Group: Group2 - Mobile Team

### *Responsibilities:*

  1. Implementing verification screen for mobile application.
  2. Implementing "resend code" functionality and countdown timer in verification screen.
  3. Providing backend connection for verification screen.
  4. Implementing verification screen tests and verification network tests.
  5. Implementing horizontal scrollable course preview list widget for home screen.
  6. Reviewing and testing work done by other mobile team members.
  7. Revising Requirements & UML design related to Lecture Structure
  8. Learning flutter, flutter testing. 


### *Main contributions:*

I am one of the four members in our application's, Learnify, mobile development team. We chose using Flutter as our main technology in mobile development. Since I did not use Flutter prior to this, my first task was getting familiar with Flutter and Dart. I set up my environment and tried to understand the basics of Flutter, learn how to program effectively with Flutter. Later, as a team we all voted for our application's name, main theme(colors, fonts) and logo just before we started our implementations.

Then, I have been assigned with implementing the verification screen of our mobile application. In verification screen; I implemented four input boxes for users to enter the verification code they received, a "verify" button to confirm the verification code(it gets activated when remaining time is bigger than 0 and all four input fields are filled), a countdown timer informing user about validity period of the code they received, a description for verification screen and a "request another code" button which resets the timer and sends another verification code to user. I also implemented correct navigation routes. Finally, I provided back-end connection, widget tests and network tests to our verification screen. While providing the back-end connection, I implemented necessary response and request models and functions like "VerifyEmailRequest" model, "VerifyEmailResponse" model. I also researched about testing in Flutter and implemented my tests.

Then, I implemented a horizontal scrollable course preview list widget for our home page. It is not crucial for this demo session, since it only contains mock data for now; but in the next demo sessions, it will have a more important role.

* *Code related significant issues:* My issues that contribute to the code base
demonstrated during the demo:
  1. [Mobile: Implementing Verification Screen #395](https://github.com/bounswe/bounswe2022group2/issues/395)
  2. [Mobile: Writing Tests for Verification Screen #417](https://github.com/bounswe/bounswe2022group2/issues/417)
  3. [Mobile: Back-end Connection of Verification Endpoint #434](https://github.com/bounswe/bounswe2022group2/issues/434)
  4. [Mobile: Writing Network Connection Tests for Verification Screen #454](https://github.com/bounswe/bounswe2022group2/issues/454)
  5. [Mobile: Scrollable Horizontal Course List Widget For Home Screen #457](https://github.com/bounswe/bounswe2022group2/issues/457)

* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Update Personal Wiki Pages #324](https://github.com/bounswe/bounswe2022group2/issues/324)
  2. [Update Requirements Page #325](https://github.com/bounswe/bounswe2022group2/issues/325)
  3. [Revising the Requirements: Lecture Structure #341](https://github.com/bounswe/bounswe2022group2/issues/341)
  4. [Revising the Diagrams based on Lecture Structure #347](https://github.com/bounswe/bounswe2022group2/issues/347)
  5. [Documenting Meeting Notes for the Meeting 4 of CMPE 451 #425](https://github.com/bounswe/bounswe2022group2/issues/425)
  6. [Documenting Meeting Notes for the Meeting 2 of Mobile Team #427](https://github.com/bounswe/bounswe2022group2/issues/427)


### *Pull requests:*

1. Mobile/verification screen [#416](https://github.com/bounswe/bounswe2022group2/pull/416)
2. Mobile/verification screen tests [#432](https://github.com/bounswe/bounswe2022group2/pull/432)
3. Mobile: Back-End Connection of Verification Screen [#435](https://github.com/bounswe/bounswe2022group2/pull/435)
4. Mobile: Verification screen network tests [#455](https://github.com/bounswe/bounswe2022group2/pull/455)
5. Mobile: Scrollable horizontal course list widget for home screen [#462](https://github.com/bounswe/bounswe2022group2/pull/462)


### *Additional information:*  

I participated in all lecture hours, PS hours, general team meetings and mobile team meetings and shared my opinions in those gatherings to help building our application.

***

### *Member:*  

Name: Ezgi Aysel Batı  

Group: Group2 - Mobile Team

### *Responsibilities:*

  1. Implementing forget password screen and backend connection for mobile.
  2. Implementing Course Preview widget which is the main component of mobile home page.
  3. Implementing unit & widget tests.
  4. Reviewing and testing work done by other mobile team members.
  5. Revising Requirements & UML design related to User-Lecture interactions
  6. Writing System Manual for Mobile.
  7. Learning flutter, flutter testing.

### *Main contributions:*

As a member of the mobile team, my first priority was to learn flutter and keep researching about it every step of the way in order to come up with the best possible implementation. I worked on implementing the forgot password screen, its connection to the backend endpoint send verification code and also unit/widget tests. I also worked on creating a custom part that displays a preview of courses, which will be the main part of home page. This process involved experimenting with different designs and trying out different combination of components to come up with something that both works nicely and is pleasing visually.
I attended all lectures, ps'es, mobile & general team meetings. I participated actively especially regarding future planning. I had no prior knowledge of flutter or mobile development.

* *Code related significant issues:* My issues that contribute to the code base
demonstrated during the demo:
  1. [Mobile Team: Setting up development Environment #372](https://github.com/bounswe/bounswe2022group2/issues/372)
  2. [Mobile: Implementing Forget Password Screen #375](https://github.com/bounswe/bounswe2022group2/issues/375)
  3. [Mobile: Writing Tests for Forget Password Screen #383](https://github.com/bounswe/bounswe2022group2/issues/383)
  4. [Mobile: Back-end Connection of Forget Password/Verify Email Endpoint #384](https://github.com/bounswe/bounswe2022group2/issues/384)
  5. [Mobile: Custom Widget For Course Preview #408](https://github.com/bounswe/bounswe2022group2/issues/408)

* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Revising the Requirements: User-Lecture Interaction #330](https://github.com/bounswe/bounswe2022group2/issues/330)
  2. [Updating ReadMe #317](https://github.com/bounswe/bounswe2022group2/issues/317)
  3. [Revising the Diagrams based on User - Lecture Interaction #343](https://github.com/bounswe/bounswe2022group2/issues/343)
  4. [Writing System Manual For Mobile #407](https://github.com/bounswe/bounswe2022group2/issues/407)

### *Pull requests:*

1. Mobile/forget password screen [#382](https://github.com/bounswe/bounswe2022group2/pull/382)
2. Mobile: course preview widget [#430](https://github.com/bounswe/bounswe2022group2/pull/430)
3. Mobile: forget password backend [#433](https://github.com/bounswe/bounswe2022group2/pull/433)
4. Mobile: implement tests for forget password [#442](https://github.com/bounswe/bounswe2022group2/pull/442)

***

### *Member:*  

Name: Batuhan Çelik

Group: Group2 - Backend Team

### *Responsibilities:*

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

### *Main contributions:*

I took an active part in team management: came up with the project plan, talked with the customer personally to create a feasible plan, designed API definition and project architecture with Bahrican while keeping needs of front and backend in mind. I created the server implementation structure editing the practice-app's structure. I set up the connecting to database process such that it recognizes when it should use docker network, connect to and actual server and create a in-memory volatile database for testing purposes. After creating the development environment for backend, I implemented the signup endpoint with its tests. After it is implemented I used it as a base case to implement the docker file for the backend and optimized it for fast building. Then created a docker compose file to connect my container to a MongoDB container using docker network. After the dockerization of backend is complete, working with Altay, I took part in dockerization of the frontend. Then, set up the EC2 instance with Ellastic IP and required security settings. Since we do not have github actions, I became the github actions myself via being online and taking action whenever a hardfix is needed(I am the only one with the EC2 instance access since noone asked for access and requested for changes from me instead). After those ended, I implemented a migration and mock courses endpoint to add mockup data to the database and from provide dataflow  from database to mocking pages.

On top of that, I was active in all of the meetings and PSes.

* *Code related significant issues, hotfixes and PRs:* My contribution to the code base
demonstrated during the demo:
  1. [Initialization of the backend project](https://github.com/bounswe/bounswe2022group2/issues/351)
  2. [Dockeriation of the API](https://github.com/bounswe/bounswe2022group2/issues/355)
  3. [Signup Endpoint](https://github.com/bounswe/bounswe2022group2/issues/366)
  4. [Structure to send verification emails](https://github.com/bounswe/bounswe2022group2/issues/391)
  5. [Converting verification code from jwt to otp](https://github.com/bounswe/bounswe2022group2/issues/428)
  6. [AWS depoloyment of backend](https://github.com/bounswe/bounswe2022group2/issues/423)
  7. [Hotfix: broken user model](https://github.com/bounswe/bounswe2022group2/commit/b33ca00ab2004d02b6b0ebc360867b51de6f70bd)
  8. [Hotfix: broken error messages from the API](https://github.com/bounswe/bounswe2022group2/commit/9410d48fd75a6c24758c36a73feffe2f9f0e63ad)
  9. [Hotfix: broken variables names in the API](https://github.com/bounswe/bounswe2022group2/commit/1f4fbd754a905a63248bc200b212212ad357701a)
  10. [GET /courses endpoint for mock data](https://github.com/bounswe/bounswe2022group2/issues/437)
* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Update the project plan for the semester](https://github.com/bounswe/bounswe2022group2/issues/316)
  2. [Documentation of the meeting notes for Meeting 1](https://github.com/bounswe/bounswe2022group2/issues/309)
  3. [Revising non functional requirements](https://github.com/bounswe/bounswe2022group2/issues/339)
  4. [Research and Report Backend Technologies](https://github.com/bounswe/bounswe2022group2/issues/321)
  5. [Update the project plan for milestone 1](https://github.com/bounswe/bounswe2022group2/issues/448)
  6. [Dockerization of the frontend](https://github.com/bounswe/bounswe2022group2/issues/412)
  [Even though I am not the assignee of this one, I helped Altay greatly with docker issues]

***

### *Member:*  

Name: Hasan Can Erol
Group: Group2 - Backend Team

### *Responsibilities:*

  1. Implementing the resend verification email endpoint
  2. Reviewing and making sure all works done by each beackend team member are working properly
  3. Providing postman documentations for the frontend and mobile teams
  4. Doing research on technologies needed to use on backend development

### *Main contributions:*
  
I'm one of the 3 contributors of backend team for the Learnify app. Firstly, we discuss about popular technologies on software development and decided on Node.js as a team. After that, we splitted the implementation of 4 endpoints which are decided to be developed for the milestone-1 demo. I implemented resend the verificaiton email for signup and forgot password pages. I was always on touch with my backend teammates via discord, whatsapp or on person. I tried the project on my local and made sure the whole backend demo works properly.

* *Code related significant issues:* My issues that contribute to the code base
demonstrated during the demo:
  1. [Backend: Implementation of Resend Email Verification](https://github.com/bounswe/bounswe2022group2/issues/406)
* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Revising the Requirements: Profile Page](https://github.com/bounswe/bounswe2022group2/issues/345)
  2. [Revisions About All the Diagrams](https://github.com/bounswe/bounswe2022group2/issues/322)
  3. [Reviewing the Updating Communication Plan](https://github.com/bounswe/bounswe2022group2/issues/315)
  4. [Reviewing the Revising the Requirements: Chat to forum Transformation](https://github.com/bounswe/bounswe2022group2/issues/344)
  
### *Pull requests:*

  1. [Backend: Implementing Resend The Verification Code](https://github.com/bounswe/bounswe2022group2/pull/411)

### *Additional information:*  

I've attended the team meetings on backend & overall. Some of them are on discord or zoom, some of them on the class which is the PS's classroom.

***

### *Member:*  

Name: Onur Kömürcü 

Group: Group2 - Mobile Team

### *Responsibilities:*

  1. Doing research on Flutter and Android Studio
  2. Implementing login page
  3. Setting up back end connection of login page
  4. Writing tests for login page
  5. Reviewing whole work that is done by mobile team
  6. Contributing to project plan development
  7. Transferring project plan from notion to ProjectLibre
  
### *Main contributions:*

I am member of the mobile team. I mainly contribute to the tasks that are related to the mobile side of our project. At first, I contribute to planning the project for the whole term. After that, I contribute to the tasks that are related to updating and reviewing at the beginning of the term. When we started to implementation, I have responsibility to implement login page. I implement the login page and make the backend connection. Tested whole edge cases using emulator. Additionally, I write widget tests also. During this process, I analyze the backend responses and other structural objects in mobile. These ease my learning process of the Flutter. Reviewed almost whole features. Also, contributed to the clarification of some points for the whole project (contributor issue and annotation). 

* *Code related significant issues:* My issues that contribute to the code base
demonstrated during the demo:
  1. [Mobile Team: Setting up development Environment](https://github.com/bounswe/bounswe2022group2/issues/372)
  2. [Mobile - Implementing Login Page Including Backend Connection](https://github.com/bounswe/bounswe2022group2/issues/396)
  3. [Mobile: Writing Tests for Login Page](https://github.com/bounswe/bounswe2022group2/issues/447) (Ongoing)
* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Revising the Requirements Specification](https://github.com/bounswe/bounswe2022group2/issues/323)
  2. [Update the Project plan for upcoming semester](https://github.com/bounswe/bounswe2022group2/issues/316)
  3. [Milestone 1: Project Plan](https://github.com/bounswe/bounswe2022group2/issues/448)
  4. [Updating Communication Plan](https://github.com/bounswe/bounswe2022group2/issues/377)
  5. [Revising the Diagrams based on Achievements](https://github.com/bounswe/bounswe2022group2/issues/346)
  6. [Revising the Requirements: Achievements and Badges](https://github.com/bounswe/bounswe2022group2/issues/333)
  7. [Revising Mockups](https://github.com/bounswe/bounswe2022group2/issues/326)
  
### *Pull requests:*

1. Mobile: Implementation of Login Screen Including Backend Connection [#398](https://github.com/bounswe/bounswe2022group2/pull/398)


### *Additional information:*  

I have attended whole classes, labs, mobile team meetings and weekly meetings. I learn so much thing in a very short period of time as in CmpE352. Also, have better knowledge about git usage. I am now using the git system more effectively and consciously. 

***

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
  1. [Backend: Implementing Unit Tests for Login Endpoint](https://github.com/bounswe/bounswe2022group2/issues/421)
  2. [Backend: Writing Tests for Verify Email Endpoint](https://github.com/bounswe/bounswe2022group2/issues/418)
  3. [Backend: Implementation of Login API](https://github.com/bounswe/bounswe2022group2/issues/380)
  4. [Backend: Email Verification API](https://github.com/bounswe/bounswe2022group2/issues/364)
* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Research & Report for Backend Technologies (Backend Team)](https://github.com/bounswe/bounswe2022group2/issues/321)
  2. [Revising the Requirements : User - User Interaction](https://github.com/bounswe/bounswe2022group2/issues/334)
  3. [Revising the Requirements : Glossary](https://github.com/bounswe/bounswe2022group2/issues/335)
  4. [Revising the Diagrams based on User - User Interaction](https://github.com/bounswe/bounswe2022group2/issues/336)
  5. [Reviewing the Revising the Requirements: Achievements and Badges](https://github.com/bounswe/bounswe2022group2/issues/333)
  6. [Reviewing the Revising the Diagrams based on Signup&Login](https://github.com/bounswe/bounswe2022group2/issues/337)
  7. [Reviewing the Revising the Diagrams based on Achievements](https://github.com/bounswe/bounswe2022group2/issues/346)
  8. [Reviewing the Dockerization of the API](https://github.com/bounswe/bounswe2022group2/issues/355)
  9. [Prepaing the Slide for our First Demo](https://github.com/bounswe/bounswe2022group2/issues/460)

### *Pull requests:*

1. Backend: Implementing Unit Tests for Login endpoint  [#422](https://github.com/bounswe/bounswe2022group2/pull/422)
2. Backend: Implementing Tests for Verify Email Endpoint [#420](https://github.com/bounswe/bounswe2022group2/pull/420)
3. 380 implementation of login api [#380](https://github.com/bounswe/bounswe2022group2/pull/380)
4. Verify email endpoint [#374](https://github.com/bounswe/bounswe2022group2/pull/374)

### *Additional information:*  

I have attended all team meetings on backend & overall. Some took part face-to-face and some were on Discord.

***

### *Member:*  

Name: Muhammed Enes Sürmeli  
Group: Group2 - Frontend Team

### *Responsibilities:*

  1. Implementing Email Verification page
  2. Adding Form Validation for Email Verification Page
  3. Providing validation methods
  4. Implementing navigation from and to the Email Verification page
  5. Testing the Email Verification page by writing unit tests
  6. Setting up the Email Verification page's back-end connection
  7. Providing methods for establishing back-end connection
  8. Reviewing all frontend team members' work
  9. Doing research on technologies needed to use on frontend development
  
### *Main contributions:*

I contributed mainly to the frontend side with React since I am a member of the frontend team of our application, Learnify. In general, I was given the task of building the web application's email verification page. To achieve this, I was in charge of creating the functions and components for the email verification page from scratch and putting it into operation. I did a research on testing with React and am also responsible for the tests of the Email Verification page I developed. We had to undertake thorough research on how to link pages, how to utilize states, how to validate form inputs, how to manage API calls, and how to do unit testing because none of us on the frontend team are accustomed to working with React. My conclusions have led me to implement our email verification page. Initial structure and layout were implemented initially, followed by validation, the backend connection, and finally, unit testing.

* *Code related significant issues:* My issues that contribute to the code base
demonstrated during the demo:
  1. [Frontend: Implementation of Email Verification Page](https://github.com/bounswe/bounswe2022group2/issues/385)
  2. [Frontend: Adding Form Validation for Email Verification Page](https://github.com/bounswe/bounswe2022group2/issues/429)
  3. [Frontend: Backend Connection for the Email Verification Page](https://github.com/bounswe/bounswe2022group2/issues/449)
  4. [Frontend: Unit Tests for Email Verification Page](https://github.com/bounswe/bounswe2022group2/issues/453)
* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Revising the Requirements Specification](https://github.com/bounswe/bounswe2022group2/issues/323)
  2. [Conducting Research on React Router](https://github.com/bounswe/bounswe2022group2/issues/386)
  3. [Revising the Requirements Specification: Notifications](https://github.com/bounswe/bounswe2022group2/issues/329)
  4. [Revisions About All the Diagrams](https://github.com/bounswe/bounswe2022group2/issues/422)
  5. [Updating Communication Plan](https://github.com/bounswe/bounswe2022group2/issues/315)
  6. [Research & Report for Frontend Technologies (Frontend Team)](https://github.com/bounswe/bounswe2022group2/issues/327)
  7. [Revising Mockups](https://github.com/bounswe/bounswe2022group2/issues/326)
  
### *Pull requests:*

1. Frontend: Email Verification Page Implementation [#392](https://github.com/bounswe/bounswe2022group2/pull/392)
2. Frontend: Email Verification Form Validation [#431](https://github.com/bounswe/bounswe2022group2/pull/431)
3. Frontend: Backend Connection for Email Verification Page [#450](https://github.com/bounswe/bounswe2022group2/pull/450)
4. Frontend: Unit Tests for Email Verification Page [#453](https://github.com/bounswe/bounswe2022group2/pull/453)

### *Additional information:*  

I have been there for all lectures, problem sessions, frontend meetings, and general team meetings some of which were held online and some of which were held in person. I readily contributed and shared my ideas when it came to project planning and decision making with other team members. Lastly, I had no prior experience with frontend development or React, so, I had to step outside of my comfort zone to learn and understand more about these topics.

***

### *Member:*  

Name: Koray Tekin 

Group: Group2 - Frontend Team

### *Responsibilities:*
  1. Requirements and Diagrams revision and replacement of chat with forum
  2. Updating the group issue template
  3. Creating personal wiki page as a new member
  4. Implementing the functionality for the LoginForm for the web application
  6. Doing research on technologies needed to use on front-end development(mainly react)
  7. Documenting front-end meeting notes
  8. Reviewing related issues and mentioned PR's of front-end team members'
  9. Providing methods for establishing back-end connection
  10. Setting up the LoginForm's back-end connection
  11. Adding Form Validation for LoginForm
  12. Implementing navigation items from LoginForm(namely via forgot password redirector and login button)
  13. Implementing the Unit Tests related to the LoginForm
  14. Testing the Email Verification page by writing unit tests


### *Main contributions:*

As one of the new members of the team the first subject I gave priority was to catch up with the requirements specification and the diagrams that my team has prepared in the last term. In order to manage that, I have been assigned several discovery tasks, and I also took responsibility in terms of contributing to the revision of both the requirements and the diagrams. I was the assignee for the replacement of the chat feature with the forum feature specific to lectures. After a fast on-boarding our team was divided into sub-groups and I took part in the front-end team, had responsibility in research tasks such as "discovering the features of react applications", "how to initialize a react project", "implementation of unit tests in react projects", etc. Then in order to proceed faster the initial pages have been shared among the front-end team members, and accordingly I have created the design, structure items, and functional elements such as buttons and redirectors for the LoginForm. Then I have implemented the back-end connection of the LoginForm, and finally the unit tests also for LoginForm. For both of these tasks I had to do discovery research since I had no experience at this side of the coin, I mean the front-end.

* *Code related significant issues:* My issues that contribute to the code base
demonstrated during the demo:
  1. [Frontend: Implementation of LoginForm](https://github.com/bounswe/bounswe2022group2/issues/390)
  2. [Frontend: Adding Form Validation and Back-end connection for LoginForm](https://github.com/bounswe/bounswe2022group2/issues/441)
  3. [Frontend: Unit Tests Implementation for LoginForm](https://github.com/bounswe/bounswe2022group2/issues/466)
* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Adding my personal wiki page](https://github.com/bounswe/bounswe2022group2/issues/312)
  2. [Discovery and on-boarding for new members](https://github.com/bounswe/bounswe2022group2/issues/320)
  3. [Revising the Requirements and the Diagrams related to conversion of chat/forum](https://github.com/bounswe/bounswe2022group2/issues/344)
  4. [Documentation of meeting notes of first meeting(front-end team)](https://github.com/bounswe/bounswe2022group2/issues/388)
  5. [Research & Report for Frontend Technologies (Frontend Team)](https://github.com/bounswe/bounswe2022group2/issues/327)

### *Pull requests:*

1. Frontend: LoginForm Implementation [#399](https://github.com/bounswe/bounswe2022group2/pull/399)
2. Frontend: LoginForm Validation and Back-end Connection [#446](https://github.com/bounswe/bounswe2022group2/pull/446)
3. Frontend: Implementation of Unit tests for LoginForm [#467](https://github.com/bounswe/bounswe2022group2/pull/467)

### *Additional information:*  

I have been present for all of the lectures, labs, general team meetings, and sub-team meetings. I have tried my best in terms of discovery tasks and contribution to implementation of the front-end. 

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
  10. Reviewing all works done by the mobile teammates
  11. Determination of the endpoints, request and response bodies
  12. Implement app icon and app name to the required config files

### *Main contributions:*

I played active and important role while designing the API definition and project architecture while keeping needs of front and backend in mind. I reviewed all works done by the mobile team, build the communication between back-end and mobile teams. I actively reported the problems, missing points to them and had discussion on the processes. I explained the flow we should follow for email verification to all team members in our weekly meeting. I also expressed my suggestions on the request and response bodies.

I especially contributed to the mobile side with Flutter since I am a part of the mobile team. I have set up the base project, implemented the base managers (network, navigation, local), base widgets and logics which appear at almost every part of the app (like extensions, common widgets, helpers). I created the base structure to support multi-language and multi-theme features. I took the responsibility of the signup screen which was the first screen we developed on mobile. I developed various generic widgets while developing this screen like CustomFormField, ActionButton, and so on. I also created a base network manager to use across the app and built the back-end connection of the signup endpoint. I did a research on testing with Flutter and created the first tests of our app, wrote some examples and beneficial helpers. I also write both unit-widget tests and also the network request tests of the signup screen.

I also took the responsibility of the profile screen. Since the back-end connection and content of this screen is not ready yet, I implemented it as static (by using some dynamic data from login/signup screens). I managed the navigation from authentication screen to the home screen and movement/update of the data of authentication screens. I also wrote unit-widget tests for the profile screen. Additionally, I implemented the bottom and top app bars for the home screen. Finally, I configured the required files for the app logo and name.

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
  10. [Mobile: Implement App Icon](https://github.com/bounswe/bounswe2022group2/issues/401)
* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Revising the Requirements: Authentication](https://github.com/bounswe/bounswe2022group2/issues/331)
  2. [Revising the Diagrams based on Signup&Login](https://github.com/bounswe/bounswe2022group2/issues/337)
  3. [Documenting Meeting Notes for the Meeting 3 of CMPE 451](https://github.com/bounswe/bounswe2022group2/issues/348)
  4. [Documenting Meeting Notes for the Meeting 1 of Mobile Team](https://github.com/bounswe/bounswe2022group2/issues/349)
  5. [Revising the Diagrams based on Signup&Login](https://github.com/bounswe/bounswe2022group2/issues/337)
  6. [Preparing Milestone 1 - CMPE 451 Deliverables](https://github.com/bounswe/bounswe2022group2/issues/409)
  7. [Updating Sidebar](https://github.com/bounswe/bounswe2022group2/issues/313)
  8. [Revising Mockups](https://github.com/bounswe/bounswe2022group2/issues/326)
  9. [Report and Research on Flutter](https://github.com/bounswe/bounswe2022group2/issues/314)

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
12. Update Issue Templates [#340](https://github.com/bounswe/bounswe2022group2/pull/340)
13. Create the base folder structure and base files of the Flutter project [#342](https://github.com/bounswe/bounswe2022group2/pull/342)

### *Additional information:*  

I built the base file, folder structure on mobile project. We have decided to use MVVM design pattern while implementing the project and I created a base structure for it. I have informed my teammates about the user flow we should follow.

I actively participated in and give suggestions about the endpoints we should have. I also give suggestions about the request and response bodies of the endpoints. I explained some concepts and real-life examples of the front designs both for web and mobile. I contributed to the logic we should implement in the authentication flow (signup-login-forgot password-email verification)

***
### *Member:*  

Name: Mehmet Gökay Yıldız

Group: Group2 - Frontend Team

### *Responsibilities:*

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

### *Main contributions:*

I am a part of the frontend team of our project. Took part at the naming of the project and the final decision, Learnify is one of my suggestions. After deciding the essentials and seperating into teams, I initialize the frontend project and created initial pages to make colaborative work possible. We decided branch naming conventions to follow each others work easily as frontend team. After that, I was also responsible for the implementation of the forget password page by the design perspective that our team follows. Since we do not have a detailed experience on React, I have go over the basics of React for subjects like; connecting pages, routing, using states, input forms and validations, handling API requests, and unit testing. After my research, individual trials and discussions in the team, I have implemented our forget password page. After that the backend connection, input verification and unit testing. Additionaly, I took part of each of the pull requests by the front end team, review and give feedback to all.

* *Code related significant issues:* My issues that contribute to the code base
demonstrated during the demo:
  1. [Initialization of the frontend project](https://github.com/bounswe/bounswe2022group2/issues/371)
  2. [Frontend: Implementing Forgot Password Screen](https://github.com/bounswe/bounswe2022group2/issues/379)
  3. [Frontend: Backend connection for the Forget Password page](https://github.com/bounswe/bounswe2022group2/issues/444)
  4. [Frontend: Unit Tests for Forget Password page](https://github.com/bounswe/bounswe2022group2/issues/464)
  5. [Frontend: Creating mock home page and adding to the repository](https://github.com/bounswe/bounswe2022group2/issues/465)
* *Management related significant issues:* My issues that contribute to the
management of our software project:
  1. [Personal Wiki Page: Gokay Yildiz](https://github.com/bounswe/bounswe2022group2/issues/311)
  2. [Discovery and Questions about Project for New Members](https://github.com/bounswe/bounswe2022group2/issues/320)
  3. [Revising the Requirements Specification](https://github.com/bounswe/bounswe2022group2/issues/323)
  4. [Research & Report for Frontend Technologies (Frontend Team)](https://github.com/bounswe/bounswe2022group2/issues/327)
  5. [Revising the Requirements: Profile Page](https://github.com/bounswe/bounswe2022group2/issues/345)
  6. [Conducting Research on React Router](https://github.com/bounswe/bounswe2022group2/issues/386)

### *Pull requests:*

1. Frontend: Initial pages created to present as an example [#378](https://github.com/bounswe/bounswe2022group2/pull/378)
2. Frontend/forget password [#419](https://github.com/bounswe/bounswe2022group2/pull/419)
3. Frontend: Backend connection to forget password [#445](https://github.com/bounswe/bounswe2022group2/pull/445)
4. Frontend: Frontend/dev to dev [#452](https://github.com/bounswe/bounswe2022group2/pull/452)
5. Frontend: Home page mock [#461](https://github.com/bounswe/bounswe2022group2/pull/461)
6. Frontend/dev forget password unit tests [#463](https://github.com/bounswe/bounswe2022group2/pull/463)

### *Additional information:*  

As a new team member, I have tried to actively participated in the discussions and give suggestions about project. Even though it is hard to catch up the ideas on the project by the team members since they have been dealing with this project for half a year more than me, I managed to be an active member on meetings. I have been there for all lectures, problem sessions, frontend meetings, and general team meetings some of which were held online and some of which were held in person. I shared all information that I know and I learn during the course of development by discord, whatsapp and github issues with the frontend team. 


## Milestone Group Review
