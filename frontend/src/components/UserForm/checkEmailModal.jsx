import { useEffect, useState } from "react"
import csrfFetch from "../../store/csrf";
import LoginForm from "./LoginForm";
import SignupForm from "./SignupForm";
import '../../context/Modal.css'


const UserModal = ({ setShowModal }) => {
    const [email, setEmail] = useState('');
    const [modalType, setModalType] = useState('checkEmail')

    const checkEmail = async () => {
        const res = await csrfFetch('/api/check_email', {
            method: 'POST',
            body: JSON.stringify({ email })
        })
        const user = await res.json();
        user.exists ? setModalType('login') : setModalType('signup')
    }
    
    return (
        <div>
            {modalType ==='checkEmail' && (
                <div className='first-form'>
                    <header className='modal-header'>Log in or sign up</header>
                    <h3 className='modal-welcome'>Welcome to Clonebnb</h3>
                    <input
                        className='user-input'
                        type='text'
                        placeholder='Email'
                        value={email}
                        onChange={e => setEmail(e.target.value)} />
                    <button className='user-button' onClick={() =>{checkEmail()}}>Continue</button>
                </div>
            )}
            {modalType ==='login' && <LoginForm email={email} />}
            {modalType ==='signup' && <SignupForm email={email} />}
        </div>
    )
}

export default UserModal;

// const formType = () => {
//     if (emailExists === null) return null;
//     emailExists ? <LoginForm email={email} /> : <SignupForm email={email} />
// }