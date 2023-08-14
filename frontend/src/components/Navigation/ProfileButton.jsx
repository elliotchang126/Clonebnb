import { useDispatch } from "react-redux"
import { useState, useEffect} from "react";
import './ProfileButton.css'
import '../../context/Modal.css'
import UserModal from "../UserForm/checkEmailModal";
import { Modal } from "../../context/Modal";
import * as sessionActions from '../../store/sessionReducer'


const ProfileButton = ({ user }) => {
    const dispatch = useDispatch();

    const [showMenu, setShowMenu] = useState(false)
    const [showModal, setShowModal] = useState(false)

    const openMenu = (e) => {
        if (showMenu) return;
        e.stopPropagation();
        setShowMenu(true)
    }

    useEffect(() => {
        if (user) {
            setShowModal(false)
        }
    }, [user])

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

    const openModal = e => {
        if (showModal) return;
        e.stopPropagation();
        setShowModal(true)
    }

    useEffect(() => {
        if (showModal) return;

        const closeModal = () => {
            setShowModal(false)
        }
        document.addEventListener('click', closeModal)
        return () => document.removeEventListener('click', closeModal)
    }, [showModal])

    return(
        <>
            <div className='profile' onClick={e => openMenu(e)}>
                <i className="fa-solid fa-regular fa-bars" style={{color: '#303030'}}></i>{' '}
                <i className="fa-solid fa-circle-user" style={{color: '#828487'}}></i>
            </div>
            {showMenu && (
                user ? (
                <div className="profile-dropdown">
                    <div className='dropdown-eles dropdown-name'>{user.firstName + " " + user.lastName}</div>
                    <div className='dropdown-eles dropdown-email'>{user.email}</div>
                    <div className='dropdown-eles dropdown-trips'>Trips</div>
                    <div className='dropdown-eles dropdown-logout'>
                    <div onClick={logout}>Log Out</div>
                    </div>
                </div>
                ) : (
                    <div className="profile-dropdown">
                    <div className='dropdown-eles dropdown-signup' onClick={e => openModal(e)}>Signup</div>
                    <div className='dropdown-eles dropdown-login' onClick={e => openModal(e)}>Login</div>
                </div>
                )
            )}
            {showModal && (
                <Modal onClose={() => setShowModal(false)}>
                    <UserModal />
                </Modal>
            )}
        </>
    )
}

export default ProfileButton;