import React, { useState } from 'react';
import up from '../images/chevron-up-solid.svg';
import down from '../images/chevron-down-solid.svg';
import comment from '../images/comment-regular.svg';
import edit from '../images/pen-to-square-regular.svg';
import trash from '../images/trash-can-regular.svg';
import author from '../images/create2.svg';
import MDEditor from "@uiw/react-md-editor";
import "@recogito/recogito-js/dist/recogito.min.css";
import {useEffect, useRef } from "react";
import { Recogito } from "@recogito/recogito-js";
import { Annotorious } from "@recogito/annotorious";
import "@recogito/annotorious/dist/annotorious.min.css";

function TextInterface({
    classes,
    contentUrl,
    handleNext,
    handleCreateAnnotation
  }) {
    const contentRef = useRef();
  
    const [anno, setAnno] = useState(null);
    const [text, setText] = useState(null);
  
    useEffect(() => {
      // fetch(contentUrl).then((response) => {
      //   response.text().then((t) => {
      //     setText(t);
      //   });
      // });
      setText(contentUrl);
    }, [contentUrl]);
  
    useEffect(() => {
      let annotorious = null;
      // console.log("contentRef.current.parentNode", contentRef.current.parentNode);
      if (classes && text && contentRef.current) {
        anno && anno.destroy();
        console.log("init anno", anno);
  
        const config = {
          widgets: [
            {
              widget: "TAG",
              vocabulary: classes
            }
          ],
          readOnly: false,
          content: contentRef.current
        };
  
        annotorious = new Recogito(config);
  
        // Attach event handlers here
        annotorious.on("createAnnotation", (annotation) => {
          handleCreateAnnotation(annotation);
        });
      }
      setAnno(annotorious);
      return () => {
        anno && anno.destroy();
        console.log(
          "contentRef.current.parentNode",
          contentRef.current.parentNode
        );
      };
    }, [classes, text]);
  
    useEffect(() => {
      console.log("anno changed");
    }, [anno]);
  
    // ref={contentRef}
    return (
      <div>
        <div ref={contentRef}>{text}</div>
      </div>
    );
  }

export default function Post(props){

     // Ref to the image DOM element
  const imgEl = useRef();

  // The current Annotorious instance
  const [anno, setAnno] = useState();
  const [watch, setWatch] = useState(true);

  // Current drawing tool name
  const [tool, setTool] = useState("rect");

  // Init Annotorious when the component
  // mounts, and keep the current 'anno'
  // instance in the application state
  useEffect(() => {
    let annotorious = null;

    if (imgEl.current) {
      // Init
      annotorious = new Annotorious({
        image: imgEl.current,
        widgets: [
          "COMMENT",
          { widget: "TAG", vocabulary: ["Animal", "Building", "Waterbody"] }
        ]
      });

      // Attach event handlers here
      annotorious.on("createAnnotation", (annotation) => {
        setWatch((prev) => !prev);
        console.log("created", annotation, anno);
      });

      annotorious.on("updateAnnotation", (annotation, previous) => {
        console.log("updated", annotation, previous);
      });

      annotorious.on("deleteAnnotation", (annotation) => {
        console.log("deleted", annotation);
      });

      annotorious.on("createSelection", function () {
        const defaultSuggestions =
          "<p>Damian</p><p>Derek</p><p>Emmanuel</p><p>Ibukun</p><p>Tobi</p><p>Tolu</p>";
        const commentWrapper = document.querySelector(".comment");
        const commentTextarea = document.querySelector(".comment > textarea");
        const commentSuggestion = document.createElement("div");
        commentSuggestion.classList.add("comment-suggestion");
        commentSuggestion.innerHTML = defaultSuggestions;
        commentSuggestion.style.display = "none";
        commentSuggestion.style.position = "absolute";
        commentSuggestion.style.left = "3px";
        commentSuggestion.style.backgroundColor = "#fff";
        commentSuggestion.style.padding = "2px 12px";
        commentSuggestion.style.boxShadow = "0 0 20px #00000040";
        commentSuggestion.style.border = "1px solid #d6d7d9";
        commentSuggestion.style.borderRadius = "3px";
        commentSuggestion.style.zIndex = "1";
        commentSuggestion.style.maxHeight = "100px";
        commentSuggestion.style.overflowY = "auto";

        if (commentTextarea) {
          commentTextarea.addEventListener("keyup", () => {
            let elements = [];
            commentSuggestion.innerHTML = defaultSuggestions;
            commentSuggestion.style.display = "block";

            document
              .querySelectorAll(".comment-suggestion > p")
              .forEach((item) => {
                if (
                  item.innerText
                    .toLowerCase()
                    .includes(commentTextarea.value.toLowerCase())
                ) {
                  elements.push(`<p>${item.innerText}</p>`);
                }
              });

            if (commentTextarea.value.toLowerCase() === "") {
              commentSuggestion.innerHTML = defaultSuggestions;
            } else if (elements.length < 1) {
              commentSuggestion.style.display = "none";
            } else {
              commentSuggestion.innerHTML = elements.join("");
            }
          });
        }

        if (commentWrapper) {
          commentWrapper.addEventListener("click", () => {
            commentSuggestion.style.display = "block";
          });
          commentWrapper.style.position = "relative";
          commentWrapper.appendChild(commentSuggestion);
          document
            .querySelectorAll(".comment-suggestion > p")
            .forEach((item) => {
              item.addEventListener("click", (e) => {
                commentTextarea.value = e.target.innerText;
                commentSuggestion.style.display = "none";
              });
            });
        }

        document.querySelectorAll(".comment-suggestion > p").forEach((item) => {
          item.style.margin = "0 -12px";
          item.style.padding = "2px 12px";

          item.addEventListener("mouseover", () => {
            item.style.backgroundColor = "rgb(189, 228, 255)";
          });

          item.addEventListener("mouseleave", () => {
            item.style.backgroundColor = "#fff";
          });
        });
      });
    }

    // Keep current Annotorious instance in state
    setAnno(annotorious);
    console.log("bganno", anno, annotorious?.getImageSnippetById());

    // Cleanup: destroy current instance
    return () => annotorious.destroy();
  }, []);

  useEffect(() => {
    console.log("andso", anno?.getImageSnippetById());
  }, [watch]);

  // Toggles current tool + button label
  const toggleTool = () => {
    if (tool === "rect") {
      setTool("polygon");
      anno.setDrawingTool("polygon");
    } else {
      setTool("rect");
      anno.setDrawingTool("rect");
    }
  };

    const [i, setI] = useState(0);
  const [url, setUrl] = useState();
  const [classes, setClasses] = useState(["class1", "class2"]);

  const urlList = [
    "https://raw.githubusercontent.com/torchgan/torchgan/master/.readthedocs.yml \n <this should be in another line>",
    "https://raw.githubusercontent.com/torchgan/torchgan/master/pyproject.toml"
  ];

  useEffect(() => {
    setUrl(urlList[i]);
  }, [i]);

  const handleNext = () => {
    setI((i + 1) % urlList.length);
  };

  const handleCreateAnnotation = (annotation) => {
    console.log("current URL", url);
  };

    const title = props.myPost.title;
    const creator = props.myPost.creator;
    const content = props.myPost.content;
    const images = props.myPost.images;

    const [upCounter, setUpCounter] = useState(0);
    const [downCounter, setDownCounter] = useState(0);
    const [deletePost, setDeletePost] = useState(false);

    const increaseUp = () => {
        setUpCounter(count => count + 1);
    };
    const increaseDown = () => {
        setDownCounter(count => count + 1);
    };
    const deleteThePost = () => {
        setDeletePost(current => !current);
    };

    return(
    <div>
        {!deletePost &&
        <div className='ls-box-mid'>
            <label className='feed-title'>
                {title}
            </label>
            <div className='space-5'></div>
            <div>
      <div>
        <button onClick={toggleTool}>
          {tool === "rect" ? "RECTANGLE" : "POLYGON"}
        </button>
      </div>

                <img
                    ref={imgEl}
                    src={images}
                    alt="space"
                    style = {{width: "893.5px",
                    height: "auto",
                    maxWidth: "100%",
                    objectFit: "cover",
                    objectPosition: "center",}}
                />
        </div>
            <div className='space-5'></div>
            <div style={{ whiteSpace: "pre-wrap" }} className="">
                <TextInterface
                    classes={classes}
                    contentUrl={content}
                    handleNext={handleNext}
                    handleCreateAnnotation={handleCreateAnnotation}
                />
            </div>
            <div className='space-5'></div>
            <div className='ls-buttons'>
                <div className='ls-button-container2'>
                    <button className='ls-button'><img src={up} alt="Learnify Logo" height={20} onClick={increaseUp}/></button>
                </div>
                <div className='ls-button-container'>
                    <label className="counter__output">{upCounter}</label>
                </div>
                <div className='ls-button-container2'>
                <button className='ls-button'><img src={down} alt="Learnify Logo" height={20} onClick={increaseDown}/></button>
                </div>
                <div className='ls-button-container'>
                    <label className="counter__output">{downCounter}</label>
                </div>
                <div className='ls-button-container2'>
                    <a href="/reply" className='navBarText'><img src={comment} alt="Learnify Logo" height={20} /></a>
                </div>
                <div className='ls-button-container'>
                    <label className="counter__output">{0}</label>
                </div>
                <div className='ls-button-container'>
                    <button className="btn-orange" data-testid="forgotPassword">Annotations</button>
                </div>
                <div className='ls-button-container-alt3'>
                    <a href="/author" className='navBarText'><img src={author} alt="Learnify Logo" height={25} /></a>
                </div>
                    {creator}
                <div className='ls-button-container-alt2'>
                    <a href="/edit" className='navBarText'><img src={edit} alt="Learnify Logo" height={20} /></a>
                </div>
                <div className='ls-button-container-alt2'>
                    <button className='ls-button'> <img src={trash} alt="Learnify Logo" height={20} onClick={deleteThePost}/> </button>
                </div>
                </div>
                
        </div>
        }
        </div>
    );
}
