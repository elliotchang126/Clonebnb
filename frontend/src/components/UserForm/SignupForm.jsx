import { useState } from "react";
import { useDispatch } from "react-redux"
import * as sessionActions from '../../store/sessionReducer'

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
        <form onSubmit={handleSubmit}>
            <h1>Finish signing up</h1>
            <label>First Name
                <input
                    type='text'
                    value={firstName}
                    onChange ={e => setFirstName(e.target.value)} />
            </label>
            <label>Last Name
                <input
                    type='text'
                    value={lastName}
                    onChange ={e => setLastName(e.target.value)} />
            </label>
            <p>Make sure it matches the name on your government ID.</p>
            <label>Email
                <input
                    type='text'
                    value={email}
                    onChange ={e => setEmail(e.target.value)} />
            </label>
            <p>We'll email you trip confirmations and receipts.</p>
            <label>Password
                <input
                    type='password'
                    value={password}
                    onChange ={e => setPassword(e.target.value)} />
            </label>
            <p>By selecting Agree and Continue, I agree to Clonebnb's Terms of Service, Payments Terms of Service, and Nondiscrimination Policy and acknowledge the Privacy Policy.</p>
            <button>Agree and continue</button>
        </form>
    )
}

export default SignupForm