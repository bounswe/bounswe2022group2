import React from 'react';
import './style.css'
import MDEditor from "@uiw/react-md-editor";
import NavBar from '../components/NavBar';
import Footer from '../components/Footer';

function AboutPage() {

    const [value, setValue] = React.useState("wikiPage");

    const [valueSide, setValueSide] = React.useState("sideBar");

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
