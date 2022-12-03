import React, { useEffect , useState } from 'react';
import './style.css'
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';
import elipse from '../images/learning-space-illustration.svg';
import {useLocation} from 'react-router-dom';
import up from '../images/chevron-up-solid.svg';
import down from '../images/chevron-down-solid.svg';
import comment from '../images/comment-regular.svg';
import edit from '../images/pen-to-square-regular.svg';
import trash from '../images/trash-can-regular.svg';
import event from '../images/event.png';
import people from '../images/download.png';
import creator from '../images/creator.png';
import geolocation from '../images/location.png';

function LearningSpace() {
    const [title, setTitle] = React.useState("");
    const [description, setDescription] = React.useState("");
    const location = useLocation();
    var lsid = "638b318f3d70ded23d570220";
    if(location.state!==null){
    lsid = location.state.lsid ? location.state.lsid : "638b318f3d70ded23d570220"; 
    }

    const [upCounter, setUpCounter] = useState(0);
    const [upCounter2, setUpCounter2] = useState(0);
    const [upCounter3, setUpCounter3] = useState(0);
    const [upCounter4, setUpCounter4] = useState(0);
    const [upCounter5, setUpCounter5] = useState(0);
    const [upCounter6, setUpCounter6] = useState(0);

    const [downCounter, setDownCounter] = useState(0);
    const [downCounter2, setDownCounter2] = useState(0);
    const [downCounter3, setDownCounter3] = useState(0);
    const [downCounter4, setDownCounter4] = useState(0);
    const [downCounter5, setDownCounter5] = useState(0);
    const [downCounter6, setDownCounter6] = useState(0);

    const [deletePost, setDeletePost] = useState(false);
    const [deletePost2, setDeletePost2] = useState(false);
    const [deletePost3, setDeletePost3] = useState(false);
    const [deletePost4, setDeletePost4] = useState(false);
    const [deletePost5, setDeletePost5] = useState(false);
    const [deletePost6, setDeletePost6] = useState(false);

    const increaseUp = () => {
        setUpCounter(count => count + 1);
    };
    const increaseUp2 = () => {
        setUpCounter2(count => count + 1);
    };
    const increaseUp3 = () => {
        setUpCounter3(count => count + 1);
    };
    const increaseUp4 = () => {
        setUpCounter4(count => count + 1);
    };
    const increaseUp5 = () => {
        setUpCounter5(count => count + 1);
    };
    const increaseUp6 = () => {
        setUpCounter6(count => count + 1);
    };

    const increaseDown = () => {
        setDownCounter(count => count + 1);
    };
    const increaseDown2 = () => {
        setDownCounter2(count => count + 1);
    };
    const increaseDown3 = () => {
        setDownCounter3(count => count + 1);
    };
    const increaseDown4 = () => {
        setDownCounter4(count => count + 1);
    };
    const increaseDown5 = () => {
        setDownCounter5(count => count + 1);
    };
    const increaseDown6 = () => {
        setDownCounter6(count => count + 1);
    };

    const deleteThePost = () => {
        setDeletePost(current => !current);
    };
    const deleteThePost2 = () => {
        setDeletePost2(current => !current);
    };
    const deleteThePost3 = () => {
        setDeletePost3(current => !current);
    };
    const deleteThePost4 = () => {
        setDeletePost4(current => !current);
    };
    const deleteThePost5 = () => {
        setDeletePost5(current => !current);
    };
    const deleteThePost6 = () => {
        setDeletePost6(current => !current);
    };

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
                        Content
                    </label>
                    <div className='space-8'></div>
                </div>
                    <div className='ls-buttons'>
                        <div className='ls-button-container'>
                            <button className="btn-orange" data-testid="forgotPassword">Posts</button>
                        </div>
                        <div className='ls-button-container'>
                            <button className="btn-orange" data-testid="forgotPassword">Discussion</button>
                        </div>
                        <div className='ls-button-container'>
                            <button className="btn-orange" data-testid="forgotPassword">Notes</button>
                        </div>
                        <div className='ls-button-container-alt'>
                            <button className="btn-lightBlue" data-testid="forgotPassword">Add Post</button>
                        </div>
                       
                     </div>
                     <div className='space-8'></div>
                <div className='ls-mid-entries'>
                    {!deletePost && 
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Entry Title
                        </label>
                        <div className='space-5'></div>
                             <div>Nascetur ridiculus mus mauris vitae ultricies leo integer. Cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non diam.</div>
                            <div>scetur ridiculus mus mauris vitae ultricies leo integ</div>
                            <div>iaculis at erat pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non diam.</div>
                            <div>mauris vitae ultricies leo integer. Cursus mattis molestie a iaculis at erat pe</div>
                            <div>pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non</div>
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
                            <a href="/edit" className='navBarText'><img src={edit} alt="Learnify Logo" height={20} /></a>
                            </div>
                            <div className='ls-button-container-alt2'>
                            <button className='ls-button'> <img src={trash} alt="Learnify Logo" height={20} onClick={deleteThePost}/> </button>
                            </div>
                            </div>
                    </div>
                    }
                    {!deletePost2 && 
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Entry Title
                        </label>
                        <div className='space-5'></div>
                             <div>Ac ut consequat semper viverra</div>
                            <div>nam libero justo.</div>
                            <div>Eget sit amet tellus cras adipiscing</div>
                            <div>Pellentesque nec nam</div>
                            <div>lorem mollis</div>
                            <div className='space-5'></div>
                            <div className='ls-buttons'>
                            <div className='ls-button-container2'>
                            <button className='ls-button'><img src={up} alt="Learnify Logo" height={20} onClick={increaseUp2}/></button>
                            </div>
                            <div className='ls-button-container'>
                            <label className="counter__output">{upCounter2}</label>
                            </div>
                            <div className='ls-button-container2'>
                            <button className='ls-button'><img src={down} alt="Learnify Logo" height={20} onClick={increaseDown2}/></button>
                            </div>
                            <div className='ls-button-container'>
                            <label className="counter__output">{downCounter2}</label>
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
                            <a href="/edit" className='navBarText'><img src={edit} alt="Learnify Logo" height={20} /></a>
                            </div>
                            <div className='ls-button-container-alt2'>
                            <button className='ls-button'> <img src={trash} alt="Learnify Logo" height={20} onClick={deleteThePost2}/> </button>
                            </div>
                            </div>
                    </div>
                    }
                    {!deletePost3 && 
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Entry Title
                        </label>
                        <div className='space-5'></div>
                             <div>Nascetur ridiculus mus mauris vitae ultricies leo integer. Cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non diam.</div>
                            <div>scetur ridiculus mus mauris vitae ultricies leo integ</div>
                            <div>iaculis at erat pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non diam.</div>
                            <div>mauris vitae ultricies leo integer. Cursus mattis molestie a iaculis at erat pe</div>
                            <div>pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non</div>
                            <div className='space-5'></div>
                            <div className='ls-buttons'>
                            <div className='ls-button-container2'>
                            <button className='ls-button'><img src={up} alt="Learnify Logo" height={20} onClick={increaseUp3}/></button>
                            </div>
                            <div className='ls-button-container'>
                            <label className="counter__output">{upCounter3}</label>
                            </div>
                            <div className='ls-button-container2'>
                            <button className='ls-button'><img src={down} alt="Learnify Logo" height={20} onClick={increaseDown3}/></button>
                            </div>
                            <div className='ls-button-container'>
                            <label className="counter__output">{downCounter3}</label>
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
                            <a href="/edit" className='navBarText'><img src={edit} alt="Learnify Logo" height={20} /></a>
                            </div>
                            <div className='ls-button-container-alt2'>
                            <button className='ls-button'> <img src={trash} alt="Learnify Logo" height={20} onClick={deleteThePost3}/> </button>
                            </div>
                            </div>
                    </div>
                    }   
                    {!deletePost4 && 
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Entry Title
                        </label>
                        <div className='space-5'></div>
                             <div>Ac ut consequat semper viverra</div>
                            <div>nam libero justo.</div>
                            <div>Eget sit amet tellus cras adipiscing</div>
                            <div>Pellentesque nec nam</div>
                            <div>lorem mollis</div>
                            <div className='space-5'></div>
                            <div className='ls-buttons'>
                            <div className='ls-button-container2'>
                            <button className='ls-button'><img src={up} alt="Learnify Logo" height={20} onClick={increaseUp4}/></button>
                            </div>
                            <div className='ls-button-container'>
                            <label className="counter__output">{upCounter4}</label>
                            </div>
                            <div className='ls-button-container2'>
                            <button className='ls-button'><img src={down} alt="Learnify Logo" height={20} onClick={increaseDown4}/></button>
                            </div>
                            <div className='ls-button-container'>
                            <label className="counter__output">{downCounter4}</label>
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
                            <a href="/edit" className='navBarText'><img src={edit} alt="Learnify Logo" height={20} /></a>
                            </div>
                            <div className='ls-button-container-alt2'>
                            <button className='ls-button'> <img src={trash} alt="Learnify Logo" height={20} onClick={deleteThePost4}/> </button>
                            </div>
                            </div>
                    </div>
                    }
                    {!deletePost5 && 
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Entry Title
                        </label>
                        <div className='space-5'></div>
                             <div>Nascetur ridiculus mus mauris vitae ultricies leo integer. Cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non diam.</div>
                            <div>scetur ridiculus mus mauris vitae ultricies leo integ</div>
                            <div>iaculis at erat pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non diam.</div>
                            <div>mauris vitae ultricies leo integer. Cursus mattis molestie a iaculis at erat pe</div>
                            <div>pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non</div>
                            <div className='space-5'></div>
                            <div className='ls-buttons'>
                            <div className='ls-button-container2'>
                            <button className='ls-button'><img src={up} alt="Learnify Logo" height={20} onClick={increaseUp5}/></button>
                            </div>
                            <div className='ls-button-container'>
                            <label className="counter__output">{upCounter5}</label>
                            </div>
                            <div className='ls-button-container2'>
                            <button className='ls-button'><img src={down} alt="Learnify Logo" height={20} onClick={increaseDown5}/></button>
                            </div>
                            <div className='ls-button-container'>
                            <label className="counter__output">{downCounter5}</label>
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
                            <a href="/edit" className='navBarText'><img src={edit} alt="Learnify Logo" height={20} /></a>
                            </div>
                            <div className='ls-button-container-alt2'>
                            <button className='ls-button'> <img src={trash} alt="Learnify Logo" height={20} onClick={deleteThePost5}/> </button>
                            </div>
                            </div>
                    </div>
                    }
                    {!deletePost6 && 
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Entry Title
                        </label>
                        <div className='space-5'></div>
                             <div>Ac ut consequat semper viverra</div>
                            <div>nam libero justo.</div>
                            <div>Eget sit amet tellus cras adipiscing</div>
                            <div>Pellentesque nec nam</div>
                            <div>lorem mollis</div>
                            <div className='space-5'></div>
                            <div className='ls-buttons'>
                            <div className='ls-button-container2'>
                            <button className='ls-button'><img src={up} alt="Learnify Logo" height={20} onClick={increaseUp6}/></button>
                            </div>
                            <div className='ls-button-container'>
                            <label className="counter__output">{upCounter6}</label>
                            </div>
                            <div className='ls-button-container2'>
                            <button className='ls-button'><img src={down} alt="Learnify Logo" height={20} onClick={increaseDown6}/></button>
                            </div>
                            <div className='ls-button-container'>
                            <label className="counter__output">{downCounter6}</label>
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
                            <a href="/edit" className='navBarText'><img src={edit} alt="Learnify Logo" height={20} /></a>
                            </div>
                            <div className='ls-button-container-alt2'>
                            <button className='ls-button'> <img src={trash} alt="Learnify Logo" height={20} onClick={deleteThePost6}/> </button>
                            </div>
                            </div>
                    </div>
                    }
                </div>
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
