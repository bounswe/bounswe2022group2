import React, { useEffect , useState } from 'react';
import './style.css'
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';
import {useNavigate} from 'react-router-dom';
import elipse from '../images/learning-space-illustration.svg';
import {useLocation} from 'react-router-dom';
import event from '../images/event.png';
import people from '../images/download.png';
import creator from '../images/creator.png';
import geolocation from '../images/location.png';
import MDEditor from "@uiw/react-md-editor";
import Post from '../components/Post';


function LearningSpace() {
    const [title, setTitle] = React.useState("");
    const [description, setDescription] = React.useState("");
    const location = useLocation();
    var lsid = "638b318f3d70ded23d570220";
    if(location.state!==null){
    lsid = location.state.lsid ? location.state.lsid : "638b318f3d70ded23d570220"; 
    }

    const [value, setValue] = React.useState("");

    const [final, setFinal] = React.useState(value);

    const postArray= [{
        "title": "To The Space We Go",
        "creator": "Elon Musk",
        "content": "Space Exploration Technologies Corp. (SpaceX) is an American spacecraft manufacturer, launcher, and a satellite communications corporation headquartered in Hawthorne, California. It was founded in 2002 by Elon Musk with the stated goal of reducing space transportation costs to enable the colonization of Mars. The company manufactures the Falcon 9, Falcon Heavy, and Starship launch vehicles, several rocket engines, Cargo Dragon and Crew Dragon spacecraft, and Starlink communications satellites.",
        "images": ["http://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/back01.jpg"],
        "_id": "6389d82c5f239536c41eb68c" },{
            "title": "NASA's Artemis I Cameras to Offer New Views of Orion, Earth, Moon",
            "creator": "NASA",
            "content": "During Artemis I, NASA’s Space Launch System (SLS) rocket will send the agency’s Orion spacecraft on a trek 40,000 miles beyond the Moon before returning to Earth. To capture the journey, the rocket and spacecraft are equipped with cameras that will collect valuable engineering data and share a unique perspective of humanity’s return to the Moon. There are 24 cameras on the rocket and spacecraft – eight on SLS and 16 on Orion – to document essential mission events including liftoff, ascent, solar array deployment, external rocket inspections, landing and recovery, and capture images of Earth and the Moon.",
            "images": ["https://www.al.com/resizer/wLVzcHPj6DZirHUuBJiZdxoxnCc=/800x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/FMRMS5ISUZBMHLWIWGXJFZ43AQ.jpg"],
            "_id": "6389d82c5f239536c41eb68c"}, {
                "title": "James Webb Space Telescope",
                "creator": "Northrop Grumman",
                "content": "The James Webb Space Telescope (JWST) is a space telescope which conducts infrared astronomy. As the largest optical telescope in space, its high resolution and sensitivity allow it to view objects too old, distant, or faint for the Hubble Space Telescope. This will enable investigations across many fields of astronomy and cosmology, such as observation of the first stars, the formation of the first galaxies, and detailed atmospheric characterization of potentially habitable exoplanets.",
                "images": ["https://upload.wikimedia.org/wikipedia/commons/2/2a/JWST_spacecraft_model_3.png"],
                "_id": "6389d82c5f239536c41eb68c"}];

    const [postTitle, setPostTitle] = useState("");

    const [imageUrl, setImageUrl] = useState("");

    const token = localStorage.getItem("token");

    const navigate = useNavigate();

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
        setFinal(value);
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
                    });
                    
                    return response.json();
                } 
            })
            .catch((error) => {
                console.log(error.message);
            })
            }
            if(location.state!==null){
                console.log(location.state.lsid)
            }
        getLearningSpace();
    }, []);

  return(
    <div className='learning-space-layout'>
        <NavBar />
        <div className='learning-space'>

            <div className='learning-space-left'>
                <div className='ls-box-title'>
                    <div className='space-5'></div>
                    <label>
                        <h1>{title}</h1>
                    </label>
                </div>
                <div className='ls-box-text'>
                    <div className='space-3'></div>
                    <label>
                        <p>{description}</p>
                    </label>
                    <div className='space-12'></div>
                    <button className="btn-orange" data-testid="forgotPassword">JOIN</button>
                    <div className='space-8'></div>
                    <a><img src={elipse} alt="elipse" height={360} /></a>
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
                                    <Post myPost = {myPost}/>)}
                </div>
                }
            </div>
            <div className='learning-space-right'>
                <div className='space-5'></div>
                <div className='ls-box3'>
                    <label className='feed-title'>
                    <label className='navBarText'><img src={people} alt="Learnify Logo" height={70} /></label>
                        Contributing Users
                    </label>
                    <label className='navBarText'><img src={creator} alt="Learnify Logo" height={50} /> Altay Acar</label>
                    <div className='space-5'></div>
                        <div>Koray</div>
                        <div>Gokay</div>
                        <div>Enes</div>
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