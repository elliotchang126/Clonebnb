import { useState } from "react";
import { useDispatch } from "react-redux"
import * as sessionActions from '../../store/sessionReducer'
import '../../context/Modal.css'

const SignupForm = () => {
    const dispatch = useDispatch();
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('')

    const handleSubmit = e => {
        e.preventDefault();
        let user = {
            email,
            password,
            firstName,
            lastName
        }
        dispatch(sessionActions.signup(user))

    }
    return(
        <form className='signup-form' onSubmit={handleSubmit}>
            <header className='modal-header'>Finish signing up</header>
            <label className='user-label'>First Name
                <input
                    className='user-input'
                    type='text'
                    placeholder="First name"
                    onChange ={e => setFirstName(e.target.value)} />
            </label>
            <label className='user-label'>Last Name
                <input
                    className='user-input'
                    type='text'
                    placeholder="Last name"
                    value={lastName}
                    onChange ={e => setLastName(e.target.value)} />
            </label>
            <p>Make sure it matches the name on your government ID.</p>
            <label className='user-label'>Email
                <input
                    className='user-input'
                    type='text'
                    placeholder="Email"
                    value={email}
                    onChange ={e => setEmail(e.target.value)} />
            </label>
            <p>We'll email you trip confirmations and receipts.</p>
            <label className='user-label'>Password
                <input
                    className='user-input'
                    type='password'
                    placeholder="Password"
                    value={password}
                    onChange ={e => setPassword(e.target.value)} />
            </label>
            <p>By selecting Agree and Continue, I agree to Clonebnb's Terms of Service, Payments Terms of Service, and Nondiscrimination Policy and acknowledge the Privacy Policy.</p>
            <button className='user-button'>Agree and continue</button>
        </form>
    )
}

export default SignupForm