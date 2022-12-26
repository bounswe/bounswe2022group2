import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import "@recogito/recogito-js/dist/recogito.min.css";
import {useEffect, useRef } from "react";
import { Recogito } from "@recogito/recogito-js";
import { Annotorious } from "@recogito/annotorious";
import "@recogito/annotorious/dist/annotorious.min.css";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { solid, regular } from '@fortawesome/fontawesome-svg-core/import.macro' // <-- import styles to be used
import MDEditor from "@uiw/react-md-editor";
import Comment from './Comment';
import axios from 'axios';

function TextInterface({
    classes,
    contentUrl,
    handleNext,
    handleCreateAnnotation,
    postId
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
      };
    }, [classes, text]);
  
    useEffect(() => {
      console.log("anno changed");
    }, [anno]);
  
    // ref={contentRef}
    return (
      <div>
        <div id={"post-content-text" + postId} ref={contentRef}>{text}</div>
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
    if(images[0] !== ""){
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
          "<p>EasterEgg</p><p>Baklava</p><p>Netting</p><p>Altay</p><p>Enes</p><p>Gökay</p><p>Koray</p>";
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
    return ;
}}, []);

  useEffect(() => {
    console.log("andso", anno?.getImageSnippetById());
  }, [watch]);

  const [i, setI] = useState(0);
  const [url, setUrl] = useState();
  const [classes, setClasses] = useState(["class1", "class2"]);

  const urlList = [
    ""
  ];

  useEffect(() => {
    setUrl(urlList[i]);
  }, [i]);

  const handleNext = () => {
    setI((i + 1) % urlList.length);
  };

  const handleCreateAnnotation = async (annotation) => {
    console.log("current URL", url);
    console.log(annotation);
    let data = {
     '@context': "http://www.w3.org/ns/anno.jsonld",
      type: "Annotation",
      body: annotation.body[0].value,
      target: {
        source: 'http://localhost:3000/' + lsid + '/' + postId,
        selector: annotation.target.selector[1],
      }
    };
    console.log(data);
    await fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}annotations-service/create/${lsid}/${postId}`, {
      method: "POST",
      body: JSON.stringify(data),
      headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'Authorization': `${token}` ,
      },
  })
      .then((response) => {
          if (response.status === 200) {
              console.log("successfull")
              setMessage("Vote added successfully");
          }
      })
      .catch((error) => {
          console.error("Error:", error);
      });
  };

  useEffect (() => {
    const getTextAnnotation = async () => {
      const response = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}annotations-service/get/${lsid}/${postId}`);
      console.log(response.data);
      const r = new Recogito({
        content: document.getElementById("post-content-text" + postId),
      });
      response.data.annotations.map((item) => {
        r.addAnnotation({
          '@context': 'http://www.w3.org/ns/anno.jsonld',
          type: 'Annotation',
          body: [
            {
              type: 'TextualBody',
              value: item.body,
              purpose: 'tagging',
            },
          ],
          target: {
            selector: [
              {
                type: 'TextQuoteSelector',
                exact: item.body,
              },
              {
                type: 'TextPositionSelector',
                start: item.target.selector.start,
                end: item.target.selector.end,
              },
            ],
          },
          id: '#7d7993a-34b6-4d8f-a6bf-2e596fbf9a4a',
        });
      });
    };
    getTextAnnotation();
  }, [])

  const title = props.myPost.title;
  const postId = props.myPost._id;
  const creator = props.myPost.creator;
  const content = props.myPost.content;
  const images = props.myPost.images;
  const commentArray = props.myPost.comments;
  const upvotes = props.myPost.upvote;
  const downvotes = props.myPost.downvote;
  const lsid = props.my_lsid;
  const profileLink = `/profile/${creator}`;

  const [deletePost, setDeletePost] = useState(false);

  const [postTitle, setPostTitle] = useState("");
  const [imageUrl, setImageUrl] = useState("");

  const increaseUp = () => {
      localStorage.setItem((postId+"upClicked"), true);
      console.log((postId+"Clicked"));
      votePost(lsid, postId, "upvote");
  };
  const increaseDown = () => {
    localStorage.setItem((postId+"downClicked"), true);
    console.log((postId+"Clicked"));
    votePost(lsid, postId, "downvote");
  };
  const deleteThePost = () => {
      setDeletePost(current => !current);
  };

  const [editPost, setEditPost] = useState(false);

  const [addComment, setAddComment] = useState(localStorage.getItem("commentClicked") === "true" ? true : false);

  const editThePost = () => {
      setValue(content);
      setEditPost(current => !current);
  };

  const setAddTheComment = () => {
    setAddComment(current => !current);
};

useEffect(() => {
  localStorage.setItem("commentClicked", false);
}, []);

  const [value, setValue] = useState("");

  const token = localStorage.getItem("token");

  const [message, setMessage] = useState("");

  const [commentValue, setCommentValue] = useState("");

  const [commentImageUrl, setCommentImageUrl] = useState("");

  const [addCommentButton, setAddCommentButton]= useState(true);

  const handleSubmitFinal  = () => {
    localStorage.setItem("commentClicked", true);
    createComment(lsid, postId, commentValue, commentImageUrl);
  }

  const handleSubmitCommentButton  = () => {
    setAddCommentButton(current => !current);
}
  
  const handleSubmitEdit  = () => {
      editExPost(lsid, postId, postTitle, value, imageUrl);
  }

  const votePost = async (lsid, postId, vote) => {
      await fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace/post/vote`, {
          method: "PUT",
          body: JSON.stringify({
              ls_id: lsid,
              post_id: postId,
              type: vote,
          }),
          headers: {
              'Content-type': 'application/json; charset=UTF-8',
              'Authorization': `${token}` ,
          },
      })
          .then((response) => {
              if (response.status === 200) {
                  console.log("successfull")
                  setMessage("Vote added successfully");
                  window.location.reload();
              }
          })
          .catch((error) => {
              console.error("Error:", error);
          });
  }

  const createComment = async (lsid, postId, commentValue, commentImageUrl) => {
      console.log(lsid)
      console.log(postId)
      console.log(commentValue)
      console.log(commentImageUrl)
      await fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace/comment`, {
          method: "POST",
          body: JSON.stringify({
              ls_id: lsid,
              post_id: postId,
              content: commentValue,
              images: [commentImageUrl],
          }),
          headers: {
              'Content-type': 'application/json; charset=UTF-8',
              'Authorization': `${token}` ,
          },
      })
          .then((response) => {
              if (response.status === 200) {
                  console.log("successfull")
                  setMessage("Comment added successfully");
                  setCommentValue("");
                  setCommentImageUrl("");
                  setAddCommentButton(current => !current);
                  window.location.reload();
              } else {
                  console.log("error")
                  setMessage("Error adding comment");
              }
          })
          .catch((error) => {
              console.log(error);
          });
  };

  
  const editExPost = async (lsid, postId, postTitle, final, imageUrl) => {
      console.log(lsid)
      console.log(postId)
      console.log(postTitle)
      console.log(final)
      console.log(imageUrl)
      await fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace/edit/post`, {
          method: "PUT",
          body: JSON.stringify({
              ls_id: lsid,
              post_id: postId,
              title: postTitle,
              content: final,
              images: [imageUrl],
          }),
          headers: {
              'Content-type': 'application/json; charset=UTF-8',
              'Authorization': `${token}` , 
          },
      })
          .then((response) => {
              if (response.status === 200) {
                  console.log("successfull")
                  
                  response.json().then( json => {
                      console.log(json.learningSpace.id)
                  });
                  console.log("Learning Space Post edited successfully!");
                  window.location.reload();
              } else {
                  setMessage("Post could not be edited!");
                  response.json().then( json => {
                      console.log(json.resultMessage);
                  });
              }
          }
          )
          .catch((error) => {
              console.log(error);
          }
          );
  };

    return(
    <div>
        {!deletePost &&
        <div className='ls-box-mid'>
            <label className='feed-title'>
                {title}
            </label>
            <div className='space-5'></div>
            {images[0] !== "" && images[0] !== null && images[0] !== undefined && <div>
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
            <div className='space-5'></div>
            </div>
        }
            <div style={{ whiteSpace: "pre-wrap" }} className="">
                <TextInterface
                    classes={classes}
                    contentUrl={content}
                    handleNext={handleNext}
                    handleCreateAnnotation={handleCreateAnnotation}
                    postId={postId}
                />
            </div>
            <div className='space-5'></div>
            <div className='post-buttons-contaier'>
                <div className='post-box-left'>
                    <div className='ls-button-container2'>
                        <button className='post-upvote-button'>
                            <FontAwesomeIcon icon={solid('caret-up')} color={localStorage.getItem((postId+"upClicked")) ? "green": "black"} onClick={(localStorage.getItem((postId+"upClicked")) || localStorage.getItem((postId+"downClicked"))) ? console.log('onclick..') : increaseUp}/>
                        </button>
                    </div>
                    <div className='post-container-display-item'>
                        <label className="counter__output">{upvotes}</label>
                    </div>
                    <div className='ls-button-container2'>
                        <button className='post-downvote-button' disabled={true}>
                            <FontAwesomeIcon icon={solid('caret-down')} color={localStorage.getItem((postId+"downClicked")) ? "red": "black"} onClick={(localStorage.getItem((postId+"upClicked")) || localStorage.getItem((postId+"downClicked"))) ? console.log('onclick..') : increaseDown}/>
                        </button>
                    </div>
                    <div className='post-container-display-item'>
                        <label className="counter__output">{downvotes}</label>
                    </div>
                    <div className='ls-button-container2'>
                        <div className='post-comment-button'>
                                <FontAwesomeIcon icon={regular('comment')} color="black" onClick={setAddTheComment}/>
                        </div>
                    </div>
                    <div className='post-container-display-item'>
                        <label className="counter__output">{commentArray.length}</label>
                    </div>
                </div>
                <div className='post-box-right'>
                    <div className='ls-button-container-alt3'>
                        <label className='post-owner-icon-container'>
                            <FontAwesomeIcon icon={solid('user-pen')} color="black"/>
                        </label>
                    </div>
                    <div className='post-owner-display-item'>
                    <Link to={profileLink} className='commentsText'>
                    {creator}
                    </Link>
                    </div>
                    <div className='ls-button-container-alt2'>
                        <button className='post-edit-icon-container'>
                                <FontAwesomeIcon icon={solid('edit')} color="black" onClick={editThePost}/>
                        </button>
                    </div>
                    <div className='ls-button-container-alt2'>
                        <button className='post-delete-button'>
                            <FontAwesomeIcon icon={solid('trash-can')} color="black" onClick={deleteThePost}/>
                        </button>
                    </div>
                </div>
                </div>
                {editPost && <div>
                <div className='space-3'></div>
                <div className='add-post-box-mid'>
                            <label className="form__label" htmlFor="title">Post Title </label>
                            <div className='space-3'></div>
                            <span className='title-box-post' role='textbox' data-placeholder={props.myPost.title} value='nameMessage' contentEditable='true' onInput={(e) => setPostTitle(e.target.textContent)}></span>
                            <div className='space-5'></div>
                            <label className="form__label" htmlFor="imageLink">Image Link </label>
                            <div className='space-3'></div>
                            <span className='details-box2' role='textbox' value='nameMessage' contentEditable='true' onInput={(e) => setImageUrl(e.target.textContent)}></span>
                            <div className='space-5'></div>
                            <label className="form__label" htmlFor="postContent">Post Contents </label>
                            <div className='space-3'></div>
                    <MDEditor height={200} value={value} onChange={setValue} />
                    <div className='space-8'></div>
                    <div>
                      <button className="btn-orange" data-testid="forgotPassword" onClick={() => {handleSubmitEdit()}}>Submit</button>
                    </div>
                    </div>
                </div>}
                {addComment && <div>
                  <div className='space-3'></div>
                  <div className='comment-section-header'>
                  <label className='comment-indicator'>
                      L
                    </label>
                  <label className='comment-title'>
                      Comment Section
                    </label>
                    <div className='ls-button-container-comment'>
                            <button className={!addCommentButton ? "btn-comment-white" : "btn-comment-lightBlue"} data-testid="forgotPassword" onClick={()=>handleSubmitCommentButton()}>{<span>Add Comment</span>}</button>
                    </div>
                  </div>
                  {!addCommentButton && 
                    <div className='add-post-box-mid'>
                            <label className="form__label" htmlFor="imageLink">Image Link </label>
                            <div className='space-3'></div>
                            <span className='details-box2' role='textbox' value='nameMessage' contentEditable='true' onInput={(e) => setCommentImageUrl(e.target.textContent)}></span>
                            <div className='space-5'></div>
                            <label className="form__label" htmlFor="postContent">Comment Contents </label>
                            <div className='space-3'></div>
                            <MDEditor height={200} value={commentValue} onChange={setCommentValue} />
                    <div className='space-8'></div>
                    <div className='ls-button-container-alt4'>
                    <button className="btn-orange" data-testid="forgotPassword" onClick={() => {handleSubmitFinal()}}>Submit</button>
                    </div>
                    </div>
                    }
                    {commentArray != null && commentArray.length > 0 &&
                    <div className='add-post-box-mid'>
                    {commentArray.map(myComment =>
                                    <Comment myComment = {myComment} my_lsid = {lsid} my_postId = {postId}/>)}
                    </div>
                    }
                </div>}
        </div>
        }
        </div>
    );
}
