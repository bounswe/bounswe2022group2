import React, { useEffect , useState } from 'react';
import './style.css'
import { useParams } from 'react-router-dom';
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';
import elipse from '../images/learning-space-illustration.svg';
import event from '../images/event.png';
import geolocation from '../images/location.png';
import MDEditor from "@uiw/react-md-editor";
import Post from '../components/Post';
import Participants from '../components/Participants';	
import JoinLsButton from '../components/JoinLsButton';	
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'	
import { solid } from '@fortawesome/fontawesome-svg-core/import.macro' // <-- import styles to be used

function LearningSpace() {

    const [title, setTitle] = React.useState("");
    const [description, setDescription] = React.useState("");
    const { lsid } = useParams();


    const [message, setMessage] = useState("");

    const [value, setValue] = useState("");

    const [postArray, setPostArray] = useState([]);

    const [participants, setParticipants] = useState([]);	
    	
    const [lsCreator, setLsCreator] = useState("");

    const [postTitle, setPostTitle] = useState("");

    const [imageUrl, setImageUrl] = useState("");

    const token = localStorage.getItem("token");

    const [forum, setForum]= useState(false);
    const [white, setWhite] = useState(false);
    const [mainPage, setMainPage]= useState(true);
    const [mainPageWhite, setMainPageWhite] = useState(true);
    const [notes, setNotes]= useState(false);
    const [notesWhite, setNotesWhite] = useState(false);
    const [post, setPost]= useState(false);
    const [postWhite, setPostWhite] = useState(false);
    const [discussion, setDiscussion]= useState(false);
    const [discussionWhite, setDiscussionWhite] = useState(false);
    const [addNote, setAddNote]= useState(false);
    const [addNoteWhite, setAddNoteWhite] = useState(false);
    

    const handleSubmitForum  = () => {
        if(!forum){
        setMainPage(current => false);
        setMainPageWhite(current => false);
        setNotes(current => false);
        setNotesWhite(current => false);
        setPost(current => false);
        setPostWhite(current => false);
        setAddNote(current => false);
        setAddNoteWhite(current => false);
        setForum(current => !current);
        setWhite(current => !current);
        }
    }
    const handleSubmitNotes  = () => {
        if(!notes){
        setForum(current => false);
        setWhite(current => false);
        setMainPage(current => false);
        setMainPageWhite(current => false);
        setDiscussion(current => false);
        setDiscussionWhite(current => false);
        setPost(current => false);
        setPostWhite(current => false);
        setNotes(current => !current);
        setNotesWhite(current => !current);
        }
    }
    const handleSubmitMain  = () => {
        if(!mainPage){
        setForum(current => false);
        setWhite(current => false);
        setNotes(current => false);
        setNotesWhite(current => false);
        setDiscussion(current => false);
        setDiscussionWhite(current => false);
        setAddNote(current => false);
        setAddNoteWhite(current => false);
        setMainPage(current => !current);
        setMainPageWhite(current => !current);
        }
    }
    const handleSubmitPost  = () => {
        setPost(current => !current);
        setPostWhite(current => !current);
    }
    const handleSubmitDiscussion  = () => {
        setDiscussion(current => !current);
        setDiscussionWhite(current => !current);
    }
    const handleSubmitAddNote  = () => {
        setAddNote(current => !current);
        setAddNoteWhite(current => !current);
    }
    const handleSubmitFinal  = () => {
        createPost(lsid, postTitle, value, imageUrl);
    }

    useEffect(() => {
        const getLearningSpace = async () => {
            const response = await fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}/learningspace/${lsid}`, {
                method: "GET",
                headers: {
                    'Content-type': 'application/json; charset=UTF-8'
                },
            }).then((response) => {
                console.log(response.status);
                console.log(response.statusText);
                if (response.ok) {
                    console.log("successfull")
                    response.json().then( json => {
                        setTitle(json.learning_spaces[0].title);
                        console.log(json.learning_spaces[0].title);
                        setDescription(json.learning_spaces[0].description);
                        console.log(json.learning_spaces[0].description);
                        setPostArray(json.learning_spaces[0].posts);
                        setLsCreator(json.learning_spaces[0].creator);	
                        setParticipants(json.learning_spaces[0].participants);	
                        console.log(participants);	
                        //setParticipants(participants.filter((item) => item !== lsCreator))
                    });
                    
                    return response.json();
                } 
            })
            .catch((error) => {
                console.log(error.message);
            })
            }
        getLearningSpace();
    }, []);

    
    const createPost = async (lsid, postTitle, final, imageUrl) => {
        console.log(lsid)
        console.log(postTitle)
        console.log(final)
        console.log(imageUrl)
        await fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace/post`, {
            method: "POST",
            body: JSON.stringify({
                ls_id: lsid,
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
                    console.log("Learning Space Post created successfully!");
                    window.location.reload();
                } else {
                    setMessage("Post could not be created!");
                }
            }
            )
            .catch((error) => {
                console.log(error);
            }
            );
    };

  return(
    <div className='learning-space-layout'>
        <NavBar />
        <div className='learning-space'>

            <div className='learning-space-left'>
                <div className='ls-box-title'>
                    <div className='space-5'></div>
                    <label>
                        <div className='h-ls-custom'>{title}</div>
                    </label>
                </div>
                <div className='ls-box-text'>
                    <div className='space-3'></div>
                    <label>
                        <p>{description}</p>
                    </label>
                    <div className='space-12'></div>
                        <JoinLsButton title = {title} participants = {participants}/>
                    <div className='space-8'></div>
                    <a><img src={elipse} alt="elipse" height={360} /></a>
                    <div className='space-8'></div>
                </div>
                
            </div>

            <div className='learning-space-middle'>
                <div className='ls-box-title'>
                    <div className='space-5'></div>
                    <label>
                        Space
                    </label>
                    <div className='space-8'></div>
                </div>
                    <div className='ls-buttons'>
                        <div className='ls-button-container'>
                            <button className={mainPageWhite ? "btn-white2" : "btn-orange"} data-testid="forgotPassword" onClick={()=>handleSubmitMain()}>Posts</button>
                        </div>
                        <div className='ls-button-container'>
                        <button className={white ? "btn-white2" : "btn-orange"} data-testid="forgotPassword" onClick={()=>handleSubmitForum()}>Discussion</button>
                        </div>
                        <div className='ls-button-container'>
                            <button className={notesWhite ? "btn-white2" : "btn-orange"} data-testid="forgotPassword" onClick={()=>handleSubmitNotes()}>Notes</button>
                        </div>
                        <div className='ls-button-container-alt'>
                            <button className={!mainPage ? !forum ? addNoteWhite ?  "btn-white2" : "btn-lightBlue" : discussionWhite ? "btn-white2" : "btn-lightBlue": postWhite ? "btn-white2" : "btn-lightBlue"} data-testid="forgotPassword" onClick={()=>mainPage? handleSubmitPost(): !forum ? handleSubmitAddNote(): handleSubmitDiscussion()}>{notes && <span>Add Note</span>}{mainPage && <span>Add Post</span>}{forum && <span>Add Discussion</span>}</button>
                        </div>
                     </div>
                     <div className='space-8'></div>
                     {forum && <div className='ls-mid-entries'> <div className='ls-box-mid'>
                        <label className='feed-title'>
                        This is discussion forum!
                        </label>
                        </div>
                        {discussion &&
                    <div className='add-post-box-mid'>
                    <MDEditor height={200} value={value} onChange={setValue} />
                    <div className='space-8'></div>
                    <div className='ls-button-container-alt4'>
                    <button className="btn-orange" data-testid="forgotPassword">Submit</button>
                    </div> 
                    </div>
                    }
                    </div>}
                    {notes && <div className='ls-mid-entries'> <div className='ls-box-mid'>
                        <label className='feed-title'>
                        This is note section!
                        </label>
                        </div>
                        {addNote && 
                    <div className='add-post-box-mid'>
                    <MDEditor height={200} value={value} onChange={setValue} />
                    <div className='space-8'></div>
                    <div className='ls-button-container-alt4'>
                    <button className="btn-orange" data-testid="forgotPassword">Submit</button>
                    </div>
                    </div>
                    }
                    </div>}
                    {mainPage && 
                <div className='ls-mid-entries'>
                    {post && 
                    <div className='add-post-box-mid'>
                            <label className="form__label" htmlFor="title">Post Title </label>
                            <div className='space-3'></div>
                            <span className='details-box2' role='textbox' value='nameMessage' contentEditable='true' onInput={(e) => setPostTitle(e.target.textContent)}></span>
                            <div className='space-5'></div>
                            <label className="form__label" htmlFor="imageLink">Image Link </label>
                            <div className='space-3'></div>
                            <span className='details-box2' role='textbox' value='nameMessage' contentEditable='true' onInput={(e) => setImageUrl(e.target.textContent)}></span>
                            <div className='space-5'></div>
                            <label className="form__label" htmlFor="postContent">Post Contents </label>
                            <div className='space-3'></div>
                    <MDEditor height={200} value={value} onChange={setValue} />
                    <div className='space-8'></div>
                    <div className='ls-button-container-alt4'>
                    <button className="btn-orange" data-testid="forgotPassword" onClick={() => {handleSubmitFinal()}}>Submit</button>
                    </div>
                    </div>
                    }
                    <div className='space-5'></div>
                    {postArray.map(myPost =>
                                    <Post myPost = {myPost} my_lsid = {lsid}/>)}
                </div>
                }
            </div>
            <div className='learning-space-right'>
                <div className='space-5'></div>
                <div className='ls-box3'>
                    <label className='feed-title'>
                    <label className='navBarText2'><FontAwesomeIcon icon={solid('people-line') } /> Contributors</label>
                    </label>
                    <div className='space-5'></div>
                    {participants.map(participant =>	
                                    <Participants participant = {participant} creator={lsCreator}/> )}
                </div>
                <div className='ls-box-org'>
                    <label className='feed-title'>
                    <label className='navBarText'><img src={event} alt="Learnify Logo" height={70} /></label>
                        Events
                    <label className='navBarText2'> <img src={geolocation} alt="Learnify Logo" height={70} /></label>
                    </label>
                    <div className='space-5'></div>
                        <div>Preparing for Milestone - North Cafeteria</div>
                        <div>Classical Music Concert - Albert Long Hall</div>
                        <div>Watching Car Racing - CMPE HWLAB</div>
                        <div>Pizza Party - CMPE Roof</div>
                        <div>Baklava in the Making - CMPE B4</div>
                </div>
            </div>
        </div>
        <Footer />
    </div>
    )       
}

export default LearningSpace;
