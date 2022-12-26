import React, { useEffect, useState } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { solid, regular } from '@fortawesome/fontawesome-svg-core/import.macro' // <-- import styles to be used
import MDEditor from "@uiw/react-md-editor";

export default function Comment(props){

  const commentId = props.myComment._id;
  const creator = props.myComment.creator;
  const content = props.myComment.content;
  const images = props.myComment.images;

  const [deleteComment, setDeleteComment] = useState(false);

  const [imageUrl, setImageUrl] = useState("");


  const increaseUp = () => {
      localStorage.setItem((commentId+"upClicked"), true);
      localStorage.setItem(commentId+"upCounter", (1+parseInt(localStorage.getItem(commentId+"upCounter"))));
      localStorage.setItem("commentClicked", true);
      window.location.reload();
  };
  const increaseDown = () => {
      localStorage.setItem((commentId+"downClicked"), true);
      localStorage.setItem(commentId+"downCounter", (1+parseInt(localStorage.getItem(commentId+"downCounter"))));
      localStorage.setItem("commentClicked", true);
      window.location.reload();
  };
  const deleteTheComment = () => {
      setDeleteComment(current => !current);
  };

  const [editComment, setEditComment] = useState(false);

  const editTheComment = () => {
      setValue(content);
      setEditComment(current => !current);
  };

  const [value, setValue] = useState("");

  const token = localStorage.getItem("token");

  const [message, setMessage] = useState("");

  const lsid = props.my_lsid;
  
  const handleSubmitEdit  = () => {
     // editExComment(lsid, commentId, commentTitle, value, imageUrl);
  }
  /*
  const editExComment = async (lsid, commentId, commentTitle, final, imageUrl) => {
      console.log(lsid)
      console.log(commentId)
      console.log(commentTitle)
      console.log(final)
      console.log(imageUrl)
      await fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace/edit/comment`, {
          method: "PUT",
          body: JSON.stringify({
              ls_id: lsid,
              comment_id: commentId,
              title: commentTitle,
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
                  console.log("Learning Space Comment edited successfully!");
                  window.location.reload();
              } else {
                  setMessage("Comment could not be edited!");
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
  */

    return(
    <div>
        {!deleteComment &&
        <div className='ls-box-mid'>
            <div className='space-5'></div>
              {images[0] !== "" && images[0] !== null && images[0] !== undefined && <div>
                <img
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
            <MDEditor.Markdown
                style={{ padding: 15 , overflow: "auto"}}
                source={content}
                linkTarget="_blank"
            />
            <div className='space-5'></div>
            <div className='post-buttons-contaier'>
                <div className='post-box-left'>
                    <div className='ls-button-container2'>
                        <button className='post-upvote-button'>
                            <FontAwesomeIcon icon={solid('caret-up')} color={localStorage.getItem((commentId+"upClicked")) ? "green": "black"} onClick={(localStorage.getItem((commentId+"upClicked")) || localStorage.getItem((commentId+"downClicked"))) ? console.log('onclick..') : increaseUp}/>
                        </button>
                    </div>
                    <div className='post-container-display-item'>
                        <label className="counter__output">{localStorage.getItem(commentId+"upCounter")}</label>
                    </div>
                    <div className='ls-button-container2'>
                        <button className='post-downvote-button'>
                            <FontAwesomeIcon icon={solid('caret-down')} color={localStorage.getItem((commentId+"downClicked")) ? "red": "black"} onClick={(localStorage.getItem((commentId+"upClicked")) || localStorage.getItem((commentId+"downClicked"))) ? console.log('onclick..') : increaseDown}/>
                        </button>
                    </div>
                    <div className='post-container-display-item'>
                        <label className="counter__output">{localStorage.getItem(commentId+"downCounter")}</label>
                    </div>
                    <div className='ls-button-container2'>
                        <div className='post-comment-button'>
                            <a href="/reply">
                                <FontAwesomeIcon icon={regular('comment')} color="black"/>
                            </a>
                        </div>
                    </div>
                    <div className='post-container-display-item'>
                        <label className="counter__output">{0}</label>
                    </div>
                </div>
                <div className='comment-box-right'>
                    <div className='ls-button-container-alt3'>
                        <label className='post-owner-icon-container'>
                            <FontAwesomeIcon icon={solid('user-pen')} color="black"/>
                        </label>
                    </div>
                    <div className='post-owner-display-item'>
                        {creator}
                    </div>
                    <div className='ls-button-container-alt2'>
                        <button className='post-edit-icon-container'>
                                <FontAwesomeIcon icon={solid('edit')} color="black" onClick={editTheComment}/>
                        </button>
                    </div>
                    <div className='ls-button-container-alt2'>
                        <button className='post-delete-button'>
                            <FontAwesomeIcon icon={solid('trash-can')} color="black" onClick={deleteTheComment}/>
                        </button>
                    </div>
                </div>
                </div>
                {editComment && <div>
                <div className='space-3'></div>
                <div className='add-post-box-mid'>
                            <label className="form__label" htmlFor="imageLink">Image Link </label>
                            <div className='space-3'></div>
                            <span className='details-box2' role='textbox' value='nameMessage' contentEditable='true' onInput={(e) => setImageUrl(e.target.textContent)}></span>
                            <div className='space-5'></div>
                            <label className="form__label" htmlFor="postContent">Comment Contents </label>
                            <div className='space-3'></div>
                    <MDEditor height={200} value={value} onChange={setValue} />
                    <div className='space-8'></div>
                    <div>
                      <button className="btn-orange" data-testid="forgotPassword" onClick={() => {handleSubmitEdit()}}>Submit</button>
                    </div>
                    </div>
                </div>}
        </div>
        }
        </div>
    );
}