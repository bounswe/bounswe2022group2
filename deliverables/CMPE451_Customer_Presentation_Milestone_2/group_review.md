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
  |-----|:--------:|
  
  |Pull Request Title|Link|
  |-----|:--------:|

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

Name: xxx

Group: Group2 - xxx Team

### *Responsibilities:*

### *Main Contributions:*

* *Code Related Significant Issues:* My issues that contribute to the code base
demonstrated during the demo:

* *Management Related Significant Issues:* My issues that contribute to the
management of our software project:

### *Pull Requests:*

### *Unit Tests:*

### *Additional Information:*  
