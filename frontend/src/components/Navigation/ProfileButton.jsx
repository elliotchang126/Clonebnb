import { useDispatch } from "react-redux"
import { useState, useEffect } from "react";
import './ProfileButton.css'
import * as sessionActions from '../../store/sessionReducer'


const ProfileButton = ({ user }) => {
    const dispatch = useDispatch();

    const [showMenu, setShowMenu] = useState(false)

    const openMenu = (e) => {
        if (showMenu) return;
        e.stopPropagation();
        setShowMenu(true)
    }

    useEffect(() => {
        if (!showMenu) return;

        const closeMenu = () => {
            setShowMenu(false)
        }

        document.addEventListener('click', closeMenu)
        return () => document.removeEventListener('click', closeMenu)
    }, [showMenu])

    const logout = e => {
        e.preventDefault();
        dispatch(sessionActions.logout())
    }

    return(
        <>
            <div className='profile' onClick={e => openMenu(e)}>
                <i class="fa-solid fa-regular fa-bars" style={{color: '#303030'}}></i>{' '}
                <i class="fa-solid fa-circle-user" style={{color: '#828487'}}></i>
            </div>
            {showMenu && (
                <div className="profile-dropdown">
                    <div className='dropdown-eles'>{user.firstName + " " + user.lastName}</div>
                    <div className='dropdown-eles'>{user.email}</div>
                    <div className='dropdown-eles'>
                    <button onClick={logout}>Log Out</button>
                </div>
                </div>
            )}
        </>
    )
}

export default ProfileButton;