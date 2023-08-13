import { useSelector } from "react-redux"
import { NavLink } from "react-router-dom";
import ProfileButton from "./ProfileButton";
import UserFormModal from "../UserForm";
import './Navigation.css'

const Navigation = () => {
    const user = useSelector(state => state.session.user);

    let sessionLinks;
    if (user) {
        sessionLinks = (
            <ProfileButton user={user}/>
        )
    } else {
        sessionLinks = (
            <>
                <UserFormModal />
                {/* <NavLink to='/login'>Login</NavLink>
                <NavLink to='/signup'>Signup</NavLink> */}
            </>
        );
    }

    return (
        <div className='navbar'>
            <div>
                <NavLink exact to='/'>Home</NavLink>
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