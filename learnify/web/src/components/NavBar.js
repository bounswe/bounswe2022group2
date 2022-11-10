import logo from '../images/logo-dblue.png' 
import bell from '../images/notification-icon.svg'
export default function NavBar(){
    return <nav className="nav">
        <a href="/"><img src={logo} alt="Learnify Logo" height={60} /></a>
        <ul>
            
                <label className="navSearch"><input type="text" placeholder="Search.."  size={30}/> </label>
            
            <li>
                <a href="/home" className='navBarText'><img src={bell} alt="Learnify Logo" height={30} /></a>
            </li>
            <li>
                <a href="/home" className='navBarText'>Home</a>
            </li>
            <li>
                <a href="/categories" className='navBarText'>Categories</a>
            </li>
            <li>
                <a href="/about" className='navBarText'>About</a>
            </li>
            <li>
                <a href="/contact" className='navBarText'>Contact</a>
            </li>
            <li>
                <a href="/profile" className='navBarText'>Profile</a>
            </li>
        </ul>
    </nav>

}