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
    contentUrl,
    postId
  }) {
    const contentRef = useRef();

    const [text, setText] = useState(null);
  
    useEffect(() => {
      setText(contentUrl);
    }, [contentUrl]);
    return (
      <div>
        <div id={"post-content-text" + postId} ref={contentRef}>{text}</div>
      </div>
    );
  }

export default function Post(props){

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

  const imgEl = useRef();

  const [textAnnotation, setTextAnnotation] = useState();
  useEffect(() => {
    const postTextAnnotation = async () => {
      const r = new Recogito({
        content: document.getElementById("post-content-text" + postId),
        widgets: [ 'COMMENT' ]
      });
      r.on('createAnnotation', function (propsTextAnnotation) {
        setTextAnnotation(propsTextAnnotation);
      });
      let data = {
        '@context': "http://www.w3.org/ns/anno.jsonld",
         type: "Annotation",
         body: textAnnotation.body[0].value,
         target: {
           source: 'http://3.76.176.35/' + lsid + '/' + postId,
           selector: textAnnotation.target.selector[1],
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
    postTextAnnotation();
  }, [textAnnotation]);

  useEffect (() => {
    const getTextAnnotation = async () => {
      const response = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}annotations-service/get/${lsid}/${postId}`);
      console.log(response.data);
      const r = new Recogito({
        content: document.getElementById("post-content-text" + postId),
        widgets: [ 'COMMENT' ]
      });
      response.data.annotations.map((item) => {
        if(item.target.selector){
          r.addAnnotation({
            '@context': 'http://www.w3.org/ns/anno.jsonld',
            type: 'Annotation',
            id: item.id,
            body: [
              {
                type: 'TextualBody',
                value: item.body,
                purpose: 'commenting',
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
          });
        }
      });
    };
    getTextAnnotation();
  }, [])

  const [imageAnnotation, setImageAnnotation] = useState();
  useEffect (() => {
    const postImageAnnotation = async () => {
      const a = new Annotorious({
        image: document.getElementById("post-content-image" + postId),
        widgets: [ 'COMMENT' ],
        readOnly: false
      });
      a.on('createAnnotation', function(propsImageAnnotation) {
        setImageAnnotation(propsImageAnnotation);
      });
      let data = {
        '@context': "http://www.w3.org/ns/anno.jsonld",
        type: "Annotation",
        body: imageAnnotation.body[0].value,
        target: {
          source: 'http://3.76.176.35/' + lsid + '/' + postId,
          selector: null,
          type: "Image",
          id: images + "#" + imageAnnotation.target.selector.value,
          format: "image/jpeg"
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
    postImageAnnotation();
  }, [imageAnnotation])

  useEffect (() => {
    const getImageAnnotation = async () => {
      const response = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}annotations-service/get/${lsid}/${postId}`);
      const a = new Annotorious({
        image: document.getElementById("post-content-image" + postId),
        widgets: [ 'COMMENT' ],
        readOnly: false
      });
      response.data.annotations.map((item) => {
        if(!item.target.selector){
          a.addAnnotation({
            '@context': 'http://www.w3.org/ns/anno.jsonld',
            type: 'Annotation',
            id: item.id,
            body: [
              {
                type: 'TextualBody',
                value: item.body,
                purpose: 'commenting',
              },
            ],
            target: {
              selector: [
                {
                  type: 'FragmentSelector',
                  conformsTo: 'http://www.w3.org/TR/media-frags/',
                  value: item.target.id.match(/#(.+)/)[1],
                },
              ],
              source: item.target.id.match(/^(.+?)#/)[1],
            },
          });
      }
      });
    };
    getImageAnnotation();
  }, [])

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
    <script src="/annotorious.min.js"></script>
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
                    id={"post-content-image" + postId}
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
                    contentUrl={content}
                    // handleCreateAnnotation={handleCreateAnnotation}
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
