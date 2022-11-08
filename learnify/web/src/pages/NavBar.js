import logo from '../images/logo-dblue.png' 
import bell from '../images/NotificationBell.png'
export default function NavBar(){
    return <nav className="nav">
        <a href="/"><img src={logo} alt="Learnify Logo" height={60} /></a>
        <ul>
            
                <label className="navSearch">Search Bar </label>
            
            <li>
                <a href="/home-page"><img src={bell} alt="Learnify Logo" height={30} /></a>
            </li>
            <li>
                <a href="/home-page">Home</a>
            </li>
            <li>
                <a href="/home-page">Catagories</a>
            </li>
            <li>
                <a href="/home-page">About</a>
            </li>
            <li>
                <a href="/home-page">Contact</a>
            </li>
            <li>
                <a href="/home-page">Profile</a>
            </li>
        </ul>
    </nav>

}