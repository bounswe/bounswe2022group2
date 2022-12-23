import React from 'react';
import './style.css'
import MDEditor from "@uiw/react-md-editor";
import NavBar from '../components/NavBar';
import Footer from '../components/Footer';

function AboutPage() {

    const wikiPage = `
# CMPE 451 Group 2 - 2022 Fall

## ℹ️ About Us
Hi there! We are junior software developers and computer engineering students at Bogazici University. You can find the members of our team in the picture below, taken on 451 Lab Session.

<p align="center">
<img src="https://user-images.githubusercontent.com/64018144/194706872-8b4e83cc-503b-4165-a7be-003430276dc9.jpg" width="80%">
</p>

## 🔭 About Our Project
Our project Learnify is an online learning platform, where learning is achieved through collaboration. Every user can contribute with their knowledge to our platform's learning space by providing any material, comment, notes, or even annotations on the existing learning material.

<a href="http://3.75.151.200" target="_blank">Click me to access the website!</a>

![logo-orange](https://user-images.githubusercontent.com/68481602/198124375-260ed87f-31f4-403a-9f56-c801510a01e0.png)

## [📭 Communication Plan](https://github.com/bounswe/bounswe2022group2/wiki/Communication-Plan)
## [🗺 Project Plan](https://github.com/bounswe/bounswe2022group2/wiki/Project-Plan)

## 🎓 Group Members

- [Altay Acar](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)
- [Egemen Atik](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)
- [Ezgi Aysel Batı](https://github.com/bounswe/bounswe2022group2/wiki/Ezgi-Aysel-Batı)
- [Mehmet Batuhan Çelik](https://github.com/bounswe/bounswe2022group2/wiki/Mehmet-Batuhan-%C3%87elik)
- [Hasan Can Erol](https://github.com/bounswe/bounswe2022group2/wiki/Hasan-Can-Erol)
- [Onur Kömürcü](https://github.com/bounswe/bounswe2022group2/wiki/Onur-Kömürcü)
- ~~[Ahmet Yiğit Özdoğan](https://github.com/bounswe/bounswe2022group2/wiki/Ahmet-Yi%C4%9Fit-%C3%96zdo%C4%9Fan)~~
- [Ecenur Sezer](https://github.com/bounswe/bounswe2022group2/wiki/Ecenur-Sezer)
- [Muhammed Enes Sürmeli](https://github.com/bounswe/bounswe2022group2/wiki/Muhammed-Enes-S%C3%BCrmeli)
- [Bahrican Yesil](https://github.com/bounswe/bounswe2022group2/wiki/Bahrican-Yesil)
- [Koray Tekin](https://github.com/bounswe/bounswe2022group2/wiki/Koray-Tekin)
- [Gökay Yıldız](https://github.com/bounswe/bounswe2022group2/wiki/Gokay-Yildiz)

## ✍️ Meeting Notes of 451

* [Meeting #1 of 451 (08.10.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%231-of-451-(08.10.2022))
* [Meeting #2 of 451 (12.10.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-2-for-451-(12.10.2022))
* [Meeting #3 of 451 (18.10.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-3-for-451-(18.10.2022))
* [Meeting #4 of 451 (25.10.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%234-for-CMPE-451-(25.10.2022))
* [Meeting #5 of 451 (02.11.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%235-of-451-(02.11.2022))
* [Meeting #6 of 451 (08.11.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%236-of-451-(08.11.2022))
* [Meeting #7 of 451 (05.12.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%237)
* [Meeting #8 of 451 (17.12.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%238-of-451-(17.12.2022))

## 📱 Mobile Team Meeting Notes

* [Meeting #1 of the Mobile Team (17.10.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Mobile-Team-Meeting-1-for-451-(17.10.2022))
* [Meeting #2 of the Mobile Team (25.10.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Mobile-Team-Meeting-2-for-CMPE-451-(25.10.2022))
* [Meeting #3 of the Mobile Team (31.10.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Mobile-Team-Meeting-3-for-CMPE-451-(31.10.2022))
* [Meeting #4 of the Mobile Team (02.11.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Mobile-Team-Meeting-4-for-CMPE-451-(02.11.2022))
* [Meeting #5 of the Mobile Team (07.11.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Mobile-Team-Meeting-5-for-CMPE-451-(07.11.2022))

## 🤖 Backend Team Meeting Notes


## 🌐 Frontend Team Meeting Notes

* [Meeting #1 of the Frontend Team (19.10.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Front-end-Team-Meeting-1-for-451-(19.10.2022))
* [Meeting #2 of the Frontend Team (04.11.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%232-of-the-Frontend-Team)
* [Meeting #3 of the Frontend Team (09.11.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%233-of-the-Frontend-Team)
* [Meeting #4 of the Frontend Team (16.11.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%234-of-the-Frontend-Team)


## ✍️ Meeting Notes of 352

* [Meeting #1 (04.03.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%231-(04.03.2022))
* [Meeting #2 (10.03.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%232-(10.03.2022))
* [Meeting #3 (17.03.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%233-(17.03.2022))
* [Meeting #4 (24.03.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%234-(24.03.2022))
* [Meeting #5 (31.03.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%235-(31.03.2022))
* [Meeting #5.1 (02.04.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%235.1---Class-Diagram-Meeting-(02.04.2022))
* [Meeting #5.2 (05.04.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%235.2-Sequence-Diagram-Meeting-(05.04.2022))
* [Meeting #6 (07.04.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%236-(07.04.2022))
* [Meeting #7 (14.04.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%237-(14.04.2022))
* Meeting #8 (21.04.2022)
* [Meeting #9 (01.05.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%239-(01.05.2022))
* [Meeting #10 (12.05.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%2310-(12.05.2022))

## 📱 Practice App
* [Practice App Requirements](https://github.com/bounswe/bounswe2022group2/wiki/Practice-App-Requirements)
* [Practice App API Documentation](https://github.com/bounswe/bounswe2022group2/wiki/Practice-App-API-Documentation)

## Learnify Mobile
* [Mobile APK](https://github.com/bounswe/bounswe2022group2/wiki/Learnify-Mobile-APK)
* [System Manual](https://github.com/bounswe/bounswe2022group2/wiki/System-Manual)
## 🛣 Milestones
* [Milestone 1](https://github.com/bounswe/bounswe2022group2/blob/master/deliverables/M1-Group-2-Milestone%20Report%201%20(3).pdf)
* [Milestone 2](https://github.com/bounswe/bounswe2022group2/blob/master/deliverables/M2_Report_Group2.pdf)

## 📋 Requirements
* [Requirements](https://github.com/bounswe/bounswe2022group2/wiki/Requirements)
* [Questions About Requirements](https://github.com/bounswe/bounswe2022group2/wiki/Questions-About-Requirements)
* [Similar Projects](https://github.com/bounswe/bounswe2022group2/wiki/Similar-Projects)
* [Base Features](https://github.com/bounswe/bounswe2022group2/wiki/Base-Features)

## 🕵 Researches
* Git Related
    * [Git Summary](https://github.com/bounswe/bounswe2022group2/wiki/Git-Summary)
    * [Git Commands](https://github.com/bounswe/bounswe2022group2/wiki/Git-Commands)
    * [Git History](https://github.com/bounswe/bounswe2022group2/wiki/Git-History)
* GitHub Related
    * [Favorite Repos](https://github.com/bounswe/bounswe2022group2/wiki/Repos-We-Liked)
* Semantic Search
    * [Semantic Search](https://github.com/bounswe/bounswe2022group2/wiki/Semantic-Search)
* W3 Web Annotation Model
    * [W3 Web Annotation Model](https://github.com/bounswe/bounswe2022group2/wiki/W3-Web-Annotation-Data-Model)

## 🖼️ Scenarios & Mockups
* Scenarios
    * [Registered Lecturer Scenario](https://github.com/bounswe/bounswe2022group2/wiki/Registered-Lecturer-Scenario,-Hasan-Ta%C5%9Fk%C4%B1ran)
    * [Unregistered Learner Scenario](https://github.com/bounswe/bounswe2022group2/wiki/Unregistered-Learner-Scenario,-Ai-Zheng)
    * [Creating Event Scenario](https://github.com/bounswe/bounswe2022group2/wiki/Lecturer-Creates-Community-Event-Scenario,-Ezgi-Ece-Smith)

## 📈 Diagrams
* Diagrams
  * [Use Case Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Use-Case-Diagram)
  * [Class Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Class-Diagram)
  * [Sequence Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Sequence-Diagram)

</details>
`;

const sideBar = `
# 👋 Welcome to the Wiki of Group #2

## [🏡 Home](https://github.com/bounswe/bounswe2022group2/wiki)

## [📭 Communication Plan](https://github.com/bounswe/bounswe2022group2/wiki/Communication-Plan)

## 🎓 Group Members

* [Personal Information Page Template](https://github.com/bounswe/bounswe2022group2/wiki/Personal-Information-Page-Template)

<details open><summary>Group Members</summary>

  * [Altay Acar](https://github.com/bounswe/bounswe2022group2/wiki/Altay-Acar)
  * [Egemen Atik](https://github.com/bounswe/bounswe2022group2/wiki/Egemen-Atik)
  * [Ezgi Aysel Batı](https://github.com/bounswe/bounswe2022group2/wiki/Ezgi-Aysel-Bat%C4%B1)
  * [Mehmet Batuhan Çelik](https://github.com/bounswe/bounswe2022group2/wiki/Mehmet-Batuhan-%C3%87elik)
  * [Hasan Can Erol](https://github.com/bounswe/bounswe2022group2/wiki/Hasan-Can-Erol)
  * [Onur Kömürcü](https://github.com/bounswe/bounswe2022group2/wiki/Onur-K%C3%B6m%C3%BCrc%C3%BC)
  * [Ecenur Sezer ](https://github.com/bounswe/bounswe2022group2/wiki/Ecenur-Sezer)
  * [Muhammed Enes Sürmeli](https://github.com/bounswe/bounswe2022group2/wiki/Muhammed-Enes-S%C3%BCrmeli)
  * [Bahrican Yeşil](https://github.com/bounswe/bounswe2022group2/wiki/Bahrican-Yesil)
  * [Koray Tekin](https://github.com/bounswe/bounswe2022group2/wiki/Koray-Tekin)
  * [Gökay Yıldız](https://github.com/bounswe/bounswe2022group2/wiki/Gokay-Yildiz)
  * ~~[Ahmet Yiğit Özdoğan](https://github.com/bounswe/bounswe2022group2/wiki/Ahmet-Yi%C4%9Fit-%C3%96zdo%C4%9Fan)~~

</details>

## ✍️ Meeting Notes

* [Meeting Notes Template](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-Notes-Template)

<details open><summary>Meeting Notes of 451</summary>

* [Meeting #1 of 451 (08.10.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%231-of-451-(08.10.2022))
* [Meeting #2 of 451 (12.10.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-2-for-451-(12.10.2022))
* [Meeting #3 of 451 (18.10.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-3-for-451-(18.10.2022))
* [Meeting #4 of 451 (25.10.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%234-for-CMPE-451-(25.10.2022))
* [Meeting #5 of 451 (02.11.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%235-of-451-(2.11.2022))
* [Meeting #6 of 451 (08.11.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%236-of-451-(08.11.2022))
* [Meeting #7 of 451 (05.12.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%237)
* [Meeting #8 of 451 (17.12.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%238-of-451-(17.12.2022))
</details>

<details open><summary>Mobile Team Meeting Notes</summary>

* [Meeting #1 of the Mobile Team](https://github.com/bounswe/bounswe2022group2/wiki/Mobile-Team-Meeting-1-for-451-(17.10.2022))
* [Meeting #2 of the Mobile Team](https://github.com/bounswe/bounswe2022group2/wiki/Mobile-Team-Meeting-2-for-CMPE-451-(25.10.2022))
* [Meeting #3 of the Mobile Team](https://github.com/bounswe/bounswe2022group2/wiki/Mobile-Team-Meeting-3-for-CMPE-451-(31.10.2022)) 
* [Meeting #4 of the Mobile Team](https://github.com/bounswe/bounswe2022group2/wiki/Mobile-Team-Meeting-4-for-CMPE-451-(02.11.2022))
* [Meeting #5 of the Mobile Team](https://github.com/bounswe/bounswe2022group2/wiki/Mobile-Team-Meeting-5-for-CMPE-451-(07.11.2022))

</details>

<details><summary>Back-End Team Meeting Notes</summary>

</details>

<details open><summary>Front-End Team Meeting Notes</summary>

* [Meeting #1 of the Frontend Team](https://github.com/bounswe/bounswe2022group2/wiki/Front-end-Team-Meeting-1-for-451-(19.10.2022))
* [Meeting #2 of the Frontend Team](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%232-of-the-Frontend-Team)
* [Meeting #3 of the Frontend Team](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%233-of-the-Frontend-Team)
* [Meeting #4 of the Frontend Team](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%234-of-the-Frontend-Team)

</details>

<details closed><summary>Meeting Notes of 352</summary>

  * [Meeting #1 (04.03.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%231-(04.03.2022))
  * [Meeting #2 (10.03.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%232-(10.03.2022))
  * [Meeting #3 (17.03.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%233-(17.03.2022))
  * [Meeting #4 (24.03.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%234-(24.03.2022))
  * [Meeting #5 (31.03.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%235-(31.03.2022))
  * [Meeting #5.1 (02.04.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%235.1---Class-Diagram-Meeting-(02.04.2022))
  * [Meeting #5.2 (05.04.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%235.2-Sequence-Diagram-Meeting-(05.04.2022))
  * [Meeting #6 (07.04.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%236-(07.04.2022))
  * [Meeting #6.1 (12.04.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%236.1(12.04.2022))
  * [Meeting #7 (14.04.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%237-(14.04.2022))
  * Meeting #8 (21.04.2022)
  * [Meeting #9 (01.05.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%239-(01.05.2022))
  * [Meeting #10 (12.05.2022)](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-%2310-(12.05.2022))
</details>


## [📅  Project Plan](https://github.com/bounswe/bounswe2022group2/wiki/Project-Plan)

## 📚 Learnify
* [System Manual](https://github.com/bounswe/bounswe2022group2/wiki/System-Manual) 
* [Mobile APK](https://github.com/bounswe/bounswe2022group2/wiki/Learnify-Mobile-APK) 

## 📱 Practice App
* [Practice App Requirements](https://github.com/bounswe/bounswe2022group2/wiki/Practice-App-Requirements)
* [Practice App Use Case Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Practice-App-Use-Case-Diagram)
* [Practice App Sequence Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Practice-App-Sequence-Diagram)
* [Practice App API Documentation](https://github.com/bounswe/bounswe2022group2/wiki/Practice-App-API-Documentation)

## 🛣 Milestones

<details open><summary>CMPE451 Milestones</summary>

* Will be added when ready

</details>


<details><summary>CMPE352 Milestones</summary>

* [Milestone 1](https://github.com/bounswe/bounswe2022group2/blob/master/deliverables/M1-Group-2-Milestone%20Report%201%20(3).pdf)
* [Milestone 2](https://github.com/bounswe/bounswe2022group2/blob/master/deliverables/M2_Report_Group2.pdf)

</details>

## 📋 Requirements
* [Requirements](https://github.com/bounswe/bounswe2022group2/wiki/Requirements)
* [Questions About Requirements](https://github.com/bounswe/bounswe2022group2/wiki/Questions-About-Requirements)
* [Similar Projects](https://github.com/bounswe/bounswe2022group2/wiki/Similar-Projects)
* [Base Features](https://github.com/bounswe/bounswe2022group2/wiki/Base-Features)

## 🕵 Researches

* [Semantic Search](https://github.com/bounswe/bounswe2022group2/wiki/Semantic-Search)
* [W3C Web Annotation Model](https://github.com/bounswe/bounswe2022group2/wiki/W3-Web-Annotation-Data-Model)
* [Favorite Repos](https://github.com/bounswe/bounswe2022group2/wiki/Repos-We-Liked)
<details open><summary>Git Related</summary>

  * [Git Summary](https://github.com/bounswe/bounswe2022group2/wiki/Git-Summary)  
  * [Git Commands](https://github.com/bounswe/bounswe2022group2/wiki/Git-Commands)
  * [Git History](https://github.com/bounswe/bounswe2022group2/wiki/Git-History)

</details>

## 🖼️ Scenarios & Mockups

<details open><summary>Scenarios</summary>
  
  * [Registered Lecturer Scenario](https://github.com/bounswe/bounswe2022group2/wiki/Registered-Lecturer-Scenario,-Hasan-Ta%C5%9Fk%C4%B1ran)
  * [Unregistered Learner Scenario](https://github.com/bounswe/bounswe2022group2/wiki/Unregistered-Learner-Scenario,-Ai-Zheng)
  * [Creating Event Scenario](https://github.com/bounswe/bounswe2022group2/wiki/Lecturer-Creates-Community-Event-Scenario,-Ezgi-Ece-Smith)
</details>

## 📈 Diagrams
  
<details open><summary>Diagrams</summary>

  * [Use Case Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Use-Case-Diagram)
  * [Class Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Class-Diagram)
  * [Sequence Diagram](https://github.com/bounswe/bounswe2022group2/wiki/Sequence-Diagram)

</details>

## 📑 Templates
  
<details open><summary>Templates</summary>

  * [Issue Templates](https://github.com/bounswe/bounswe2022group2/issues/new/choose)
  * [Meeting Notes Template](https://github.com/bounswe/bounswe2022group2/wiki/Meeting-Notes-Template)
  * [Personal Information Page Template](https://github.com/bounswe/bounswe2022group2/wiki/Personal-Information-Page-Template)

</details>
`;

    const [value, setValue] = React.useState(wikiPage);

    const [valueSide, setValueSide] = React.useState(sideBar);

  return(  
    <div className='about-page-layout'>
        <NavBar />
        <div className='learning-space'>
        <div className='about-page-left'>
        <MDEditor.Markdown
            style={{ backgroundColor: "#f8f6f4",
              width: "97%",
              borderRadius: "20px",
              marginTop: "5px",
              marginBottom: "20px",
              boxShadow: "0px 12px 16px -12px rgba(26,26,26,1)",
              textAlign: "left",
              marginRight: "auto",
              marginLeft: "auto",
              padding: "16px",
              paddingLeft: "28px",
              color: "#000000",
              paddingRight: "28px"}}
            source={value}
            linkTarget="_blank"
          />
       </div>
       <div className='about-page-right'>
      <MDEditor.Markdown
        style={{ backgroundColor: "#f8f6f4",
              width: "97%",
              borderRadius: "20px",
              marginTop: "5px",
              marginBottom: "20px",
              marginRight: "auto",
              boxShadow: "0px 12px 16px -12px rgba(26,26,26,1)",
              textAlign: "left",
              padding: "16px",
              color: "#000000",
              paddingLeft: "28px",
              paddingRight: "28px"}}
        source={valueSide}
        linkTarget="_blank"
      />
      </div>
      </div>
      <Footer />
      </div>
      )       
}

export default AboutPage;
