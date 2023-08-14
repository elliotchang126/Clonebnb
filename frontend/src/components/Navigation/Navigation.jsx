import { useSelector } from "react-redux"
import { NavLink } from "react-router-dom";
import ProfileButton from "./ProfileButton";
import logo from '../../assets/airbnb.svg'
import UserFormModal from "../UserForm";
import './Navigation.css'

const Navigation = () => {
    const user = useSelector(state => state.session.user);

    let sessionLinks = (
            <ProfileButton user={user}/>
        )
    // } else {
    //     sessionLinks = (
    //         <>
    //             <UserFormModal />
    //             {/* <NavLink to='/login'>Login</NavLink>
    //             <NavLink to='/signup'>Signup</NavLink> */}
    //         </>
    //     );
    // }

    return (
        <div className='navbar'>
            <div>
                {/* <NavLink exact to='/'><i className="fa-solid fa-house-chimney-user" style={{color: "#ff5a5f"}}></i></NavLink>  */}
                <NavLink exact to='/'><img className='site-logo' src={logo} alt='site-logo'/></NavLink> 
                {/* Placeholder Image */}
            </div>
            <div>
                {sessionLinks}
            </div>
        </div>
    )
}

export default Navigation
// return (
//     <>
//         <ul>
//             <NavLink to='/'>Home</NavLink>{' '}
//             <NavLink to='/login'>Login</NavLink>{' '}
//             <NavLink to='/signup'>Signup</NavLink>
//         </ul>
//     </>
// )