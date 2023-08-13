import { useDispatch } from "react-redux"
import { useState, useEffect } from "react";
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
            <button onClick={e => openMenu(e)}>
                <i className="fa-solid fa-user-circle" />
            </button>
            {showMenu && (
                <ul className="profile-dropdown">
                    <li>{user.firstName + " " + user.lastName}</li>
                    <li>{user.email}</li>
                    <li>
                    <button onClick={logout}>Log Out</button>
                </li>
                </ul>
            )}
        </>
    )
}

export default ProfileButton;