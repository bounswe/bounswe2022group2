# Group 2 - Milestone 2 - Group Review

1. [Executive Summary](#executive-summary)
* 1.1 Summary of the Project Status
* 1.2 Changes the team has made or planned since Milestone 1 to improve development process, and how those changes will impact the process
* 1.3 The Improvements Planned for the Remainder of the Project
2. [Progress Based on Teamwork](#progress-based-on-teamwork)
* 2.1 Summary of Individual Work
* 2.2 Status of the Deliverables of Milestone 1
* 2.3 Progress According to Requirements
* 2.4 API Endpoints
* 2.5 User Interface / User Experience
* 2.6 Annotations
* 2.7 Standards
3. [Individual Reports](#individual-reports)

---------

## Executive Summary

***

### Summary of the Project Status:

***

### Changes the team has made or planned since Milestone 1 to improve development process, and how those changes will impact the process:

***

### The Improvements Planned for the Remainder of the Project:

***

## Progress Based on Teamwork

---------

### Summary of Individual Work

- **Altay Acar**
  |Issue Title|Link|
  |Frontend: Implementation of Home Page|[#518](https://github.com/bounswe/bounswe2022group2/issues/518)|
  |Frontend: Implementation of Categories Page|[#544](https://github.com/bounswe/bounswe2022group2/issues/544)|
  |Frontend: Implementation of Learning Spaces by Category Page|[#605](https://github.com/bounswe/bounswe2022group2/issues/605)|
  |Frontend: HOTFIX Learning Space Page Structural Overflow|[#636](https://github.com/bounswe/bounswe2022group2/issues/636)|
  |Frontend: Implementation of Semantic Search Bar|[#652](https://github.com/bounswe/bounswe2022group2/issues/652)|
  |Frontend: Unit Tests for Categories Page|[#673](https://github.com/bounswe/bounswe2022group2/issues/673)| 
  |Frontend: Unit Tests for Learning Spaces by Categories Page|[#679](https://github.com/bounswe/bounswe2022group2/issues/679)| 
  |Frontend: Unit Tests for Navigation Bar and Semantic Search Component|[#682](https://github.com/bounswe/bounswe2022group2/issues/682)| 
  
  |Pull Request Title|Link|
  |Frontend: Implementation of Home Page|[#536](https://github.com/bounswe/bounswe2022group2/issues/536)|
  |Frontend: Implementation of Categories Page|[#571](https://github.com/bounswe/bounswe2022group2/issues/571)|
  |Frontend: Learning Spaces by Category Pages Implementation|[#633](https://github.com/bounswe/bounswe2022group2/issues/633)|
  |Frontend: HOTFIX Learning Space Page Structural Overflow|[#637](https://github.com/bounswe/bounswe2022group2/issues/637)|
  |Frontend: Semantic Search Bar Implementation|[#655](https://github.com/bounswe/bounswe2022group2/issues/655)|
  |Frontend: Unit Tests for Categories Page|[#676](https://github.com/bounswe/bounswe2022group2/issues/676)|
  |Frontend: Unit Tests for Learning Spaces by Category Page|[#680](https://github.com/bounswe/bounswe2022group2/issues/680)|
  |Frontend: Unit Tests for Navigation Bar and Semantic Search Component|[#684](https://github.com/bounswe/bounswe2022group2/issues/684)|

- **Egemen Atik**
  |Issue Title|Link|
  |-----|:--------:|

  |Pull Request Title|Link|
  |-----|:--------:|

- **Ezgi Aysel Batı**
  |Issue Title|Link|
  |-----|:--------:|

  |Pull Request Title|Link|
  |-----|:--------:|
  
- **Batuhan Çelik**
  
  |Issue Title|Link|
  |-----|:--------:|

  |Pull Request Title|Link|
  |-----|:--------:|
  
- **Hasan Can Erol**
  |Issue Title|Link|
  |-----|:--------:|
  
  |Pull Request Title|Link|
  |-----|:--------:|
  
- **Onur Kömürcü:**
  |Issue Title|Link|
  |-----|:--------:|
  
  |Pull Request Title|Link|
  |-----|:--------:|
  
- **Ecenur Sezer**
  |Issue Title|Link|
  |-----|:--------:|

  |Pull Request Title|Link|
  |-----|:--------:|
  
- **Muhammed Enes Sürmeli:**
  |Issue Title|Link|
  |-----|:--------:|

  |Pull Request Title|Link|
  |-----|:--------:|
  
- **Koray Tekin**
  |Issue Title|Link|
  |-----|:--------:|
    
  |Pull Request Title|Link|
  |-----|:--------:|
  
- **Bahrican Yeşil:**
  |Issue Title|Link|
  |-----|:--------:|

  |Pull Request Title|Link|
  |-----|:--------:|
  
- **Mehmet Gökay Yıldız**
  |Issue Title|Link|
  |-----|:--------:|

  |Pull Request Title|Link|
  |-----|:--------:|
  
***
  
### Status of the Deliverables of Milestone 1

***

### Progress According to Requirements

***

### API Endpoints

***

### User Interface / User Experience

***

### Annotations

#### Status
  
  In our recent status, annotations are supported on both mobile and frontend. In application level, we are able to annotate both images and text. Users can select a specific part of an image and leave a text annotation. Similarly, users can select a piece of text and leave text annotation as well. In both cases, annotated area is highlighted. On mobile, the application connection with specification is also complete. Which means users can re-visit their own and others' annotations anytime they visit a learning space post. On frontend, connection with backend will be implemented on near future, however, annotations are still present on current web session. 
  
***
  
#### Standarts
  
  As conventions, annotations are required to be universal, which means that any web client should be able to use existing and create new annotations from/coming to our microservice. To provide this, the annotations should be the W3 Web Annotation Data model. This aspects of annotating is pretty clear on our side. However, for the sake of Milestone 2, the microservice implementation was left to near future. Currently, annotations are stored on learnify servers. The annotations saved on the database follow the W3 Model. The image below is an example of how image and text annotations are stored in our database.
    
  ![imageannot](https://user-images.githubusercontent.com/64018144/206256739-c0594972-3d76-4b01-b383-0bbaea0965eb.jpg)

  **Image annotation**
    
  ![photo](https://user-images.githubusercontent.com/64018144/206253615-7417e2c0-a835-46df-a3f9-16901faf8fbe.jpg)
    
  **Text annotation**

  And in this images you can see the models we do follow from W3 model.
   
  ![image annotation](https://user-images.githubusercontent.com/64018144/206257031-c7c4ca7a-25b4-4185-803c-6c37b9b0e4b6.jpg)
  
  **Resource: https://www.w3.org/TR/annotation-model/#embedded-textual-body**
  
  ![text annotation](https://user-images.githubusercontent.com/64018144/206257184-d1443e41-f05f-4698-8970-454b0382c90e.jpg)
  
  **Resource : https://www.w3.org/TR/annotation-model/#text-position-selector**
  
  ![creator](https://user-images.githubusercontent.com/64018144/206247957-0f4edf11-4996-49a2-aad3-70c073b97374.jpg)
  
  **Resource: https://www.w3.org/TR/annotation-model/#index-of-json-keys**
  
  The API calls and examples are present on the postman documentation of the CREATE ANNOTATIONS endpoint. Please do check the link in [API Endpoints](https://www.w3.org/TR/annotation-model/#index-of-json-keys) section of our milestone 2 report.
  
 ***
 
  #### Improvements in the Future
   **After our second demo, along with feedback we as a team see clearer on our mistakes on providing the universality and reusability of our annotations and we will do many improvements.** 
  These improvements will be:
   - Create microservice:
   
     We will create another service designed just to keep and return annotations and we will access it using axios library.
   - Change the request parameters on Create Annotation Endpoint:
   
     Although the annotations kept in the database and returned to the application fully obeys the W3 annotation model, the model sent by the application to the create annotation endpoint does not follow the same convention. In very near future, the annotation model sent by the application and get by the specification will be exactly the same and will be W3 annotation model.

***

## Individual Reports

--------------------------  

### *Member:*  

Name: Altay Acar

Group: Group2 - Frontend Team

### *Responsibilities:*

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

### *Main Contributions:*
I am a member of our frontend team for the development of our application, namely Learnify. As I did in the first milestone, I continued to provide visual components of our web application according to the design guidelines we have determined together and in harmony with other components and pages of our web application. Before our weekly frontend team meetings I have regularly inspected our application's development's current state and provided necessary agenda for that week. I have also provided page layouts and visual components like icons, logos, or illustrations for our web application. I have also researched on icon library that we can use (Fontawesome) and implemented it so that the performance and loading times for our screens increase significantly by not trying to render each png file when loading. I have also researched n dynamic routing in React and provided an easy-to-use and effective solution to one of our biggest issues: overcoming hardcoding each url path in App.js. I have also provided a component based page layouting logic so that we can eaily import components and use them withouut repeating lines of code and be able to pass specific parameters to display components. Besides, I have implemented categories page, learning spaces by category page and semantic search component in the navigation bar. For each, I have implemented separate components, established backend connection, established dynamic routing and passed parameters to display components according to the response acquired from the REST API. I have also regularly provided css classes that satisfy our design guidelines for the components implemented by the whole frontend team. I have regularly helped my teammates to fix any erroneous part of their code, provided hotfixes, and tried to share them good practices that I have learned. Additionally, I have implemented unit tests for the components that I have created during the development of our web application’s frontend.

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:
  1. [Frontend: Implementation of Home Page](https://github.com/bounswe/bounswe2022group2/issues/518)
  2. [Frontend: Implementation of Categories Page](https://github.com/bounswe/bounswe2022group2/issues/544)
  3. [Frontend: Implementation of Learning Spaces by Category Page](https://github.com/bounswe/bounswe2022group2/issues/605)
  4. [Frontend: HOTFIX Learning Space Page Structural Overflow](https://github.com/bounswe/bounswe2022group2/issues/636)
  5. [Frontend: Implementation of Semantic Search Bar](https://github.com/bounswe/bounswe2022group2/issues/652)
  6. [Frontend: Unit Tests for Categories Page](https://github.com/bounswe/bounswe2022group2/issues/673)
  7. [Frontend: Unit Tests for Learning Spaces by Categories Page](https://github.com/bounswe/bounswe2022group2/issues/679)
  8. [Frontend: Unit Tests for Navigation Bar and Semantic Search Component](https://github.com/bounswe/bounswe2022group2/issues/682)

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:
  None between the milestone 1 and milestone 2

### *Pull Requests:*
1. Frontend: Implementation of Home Page [#536](https://github.com/bounswe/bounswe2022group2/issues/536)
2. Frontend: Implementation of Categories Page [#571](https://github.com/bounswe/bounswe2022group2/issues/571)
3. Frontend: Learning Spaces by Category Pages Implementation [#633](https://github.com/bounswe/bounswe2022group2/issues/633)
4. Frontend: HOTFIX Learning Space Page Structural Overflow [#637](https://github.com/bounswe/bounswe2022group2/issues/637)
5. Frontend: Semantic Search Bar Implementation [#655](https://github.com/bounswe/bounswe2022group2/issues/655)
6. Frontend: Unit Tests for Categories Page [#676](https://github.com/bounswe/bounswe2022group2/issues/676)
7. Frontend: Unit Tests for Learning Spaces by Category Page [#680](https://github.com/bounswe/bounswe2022group2/issues/680)
8. Frontend: Unit Tests for Navigation Bar and Semantic Search Component [#684](https://github.com/bounswe/bounswe2022group2/issues/684)

### *Unit Tests:*
1. Unit Tests for Categories Page [#676](https://github.com/bounswe/bounswe2022group2/issues/676)
2. Unit Tests for Learning Spaces by Category Page [#680](https://github.com/bounswe/bounswe2022group2/issues/680)
3. Unit Tests for Navigation Bar and Semantic Search Component [#684](https://github.com/bounswe/bounswe2022group2/issues/684)

### *Additional Information:*  
None
