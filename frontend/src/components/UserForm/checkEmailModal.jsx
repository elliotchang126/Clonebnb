import { useEffect, useState } from "react"
import csrfFetch from "../../store/csrf";
import LoginForm from "./LoginForm";
import SignupForm from "./SignupForm";
import '../../context/Modal.css'
import { useDispatch } from "react-redux";
import * as sessionActions from '../../store/sessionReducer'

const UserModal = ({showModal, setShowModal }) => {
    const dispatch = useDispatch();
    const [email, setEmail] = useState('');
    const [modalType, setModalType] = useState('checkEmail')
    const [emailError, setEmailError] = useState('')

    const checkEmail = async () => {
        const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

        setEmailError('')
        if (!email) {
            setEmailError('Email is required.')
            return
        }

        if (!emailPattern.test(email)) {
            setEmailError("Please enter a valid email.")
            return
        }

        
        const res = await csrfFetch('/api/check_email', {
            method: 'POST',
            body: JSON.stringify({ email })
        })
        
        if (res.ok) {
            const user = await res.json();
            user.exists ? setModalType('login') : setModalType('signup')
        }
    }

    useEffect(() => {
        const buttons = document.querySelectorAll('.user-button')

        if (!buttons.length) return;

        const handleMouseover = e => {
            const rect = e.target.getBoundingClientRect();
            const x = (e.clientX - rect.left) * 100 / e.target.clientWidth;
            const y = (e.clientY - rect.top) * 100 / e.target.clientHeight;
            
            e.target.style.setProperty('--mouse-x', x)
            e.target.style.setProperty('--mouse-y', y)
        }
        buttons.forEach(button => {
            button.addEventListener('mousemove', handleMouseover);
        })

        return () => {
            buttons.forEach(button => {
                button.removeEventListener('mousemove', handleMouseover)
            })
        }
    }, [])

    const demoLogin = () => dispatch(sessionActions.login({email: 'demo@demo.io', password: 'password'}))

    // useEffect(() => {
    //     if (showModal) return;
        
    //     const closeModal = () => {
    //         setShowModal(false)
    //     }
    //     const closeButton = document.querySelector('.close-button')

    //     closeButton.addEventListener('click', closeModal)

    //     return () => closeButton.removeEventListener('click', closeModal)
    // }, [showModal])

    return (
        <div>
            {modalType ==='checkEmail' && (
                <div className='first-form'>
                    <div className='header'>
                        <button className="close-button" onClick={()=> setShowModal(false)}>&times;</button>
                        <header className='modal-header'>Log in or sign up</header>
                    </div>
                    <h3 className='modal-welcome'>Welcome to Clonebnb</h3>
                    <div className="input-wrapper">
                        <input
                            id='email-input'
                            className='user-input'
                            type='text'
                            placeholder='Email'
                            value={email}
                            onChange={e => setEmail(e.target.value)} />
                        <label htmlFor='email-input'>Email</label>
                    </div>
                    {emailError && <div className="error-message">
                        <i className="fa-solid fa-circle-exclamation" style={{color: "#ff0000"}}></i>
                        {emailError}
                        </div> }
                    <button className='user-button' onClick={() =>{checkEmail()}}>Continue</button>
                    <button className='user-button' onClick={demoLogin}>Demo Login</button>
                </div>
            )}
            {modalType ==='login' && <LoginForm email={email} setShowModal={setShowModal} />}
            {modalType ==='signup' && <SignupForm email={email} setShowModal={setShowModal} />}
        </div>
    )
}

export default UserModal;

// const formType = () => {
//     if (emailExists === null) return null;
//     emailExists ? <LoginForm email={email} /> : <SignupForm email={email} />
// }