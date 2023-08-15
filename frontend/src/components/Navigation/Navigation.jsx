import { useSelector } from "react-redux"
import { NavLink } from "react-router-dom";
import ProfileButton from "./ProfileButton";
import logo from '../../assets/airbnb_logo.svg'
import UserFormModal from "../UserForm";
import './Navigation.css'
import { useState } from "react";

const Navigation = () => {
    const user = useSelector(state => state.session.user);
    const [search, setSearch] = useState('')

    const handleSearchChange= e => setSearch(e.target.value);

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
            <div className='home-logo'>
                {/* <NavLink exact to='/'><i className="fa-solid fa-house-chimney-user" style={{color: "#ff5a5f"}}></i></NavLink>  */}
                <NavLink exact to='/'><img className='site-logo' src={logo} alt='site-logo'/></NavLink> 
                {/* Placeholder Image */}
            </div>
            <div className='searchbar-container'>
                <form className='search-form'>
                    <input
                        className='searchbar'
                        type='text'
                        value={search}
                        placeholder='Search your destination'
                        onChange={handleSearchChange}
                    />
                    <button className='search-button'><i className="fa-solid fa-magnifying-glass" style={{color: "#ffffff",}} ></i></button>
                </form>
            </div>
            <div className='navbar-user'>
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