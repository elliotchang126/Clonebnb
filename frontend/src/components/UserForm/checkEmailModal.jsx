import { useEffect, useState } from "react"
import csrfFetch from "../../store/csrf";
import LoginForm from "./LoginForm";
import SignupForm from "./SignupForm";



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
                <>
                    <input
                        type='text'
                        placeholder='Email'
                        value={email}
                        onChange={e => setEmail(e.target.value)} />
                    <button onClick={() => {console.log("Button clicked")
                    checkEmail()}}>Continue</button>
                </>
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