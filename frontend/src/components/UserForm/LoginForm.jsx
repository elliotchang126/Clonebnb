import { useState } from "react";
import { useDispatch } from "react-redux";
import * as sessionActions from '../../store/sessionReducer'
import '../../context/Modal.css'

const LoginForm = (props) => {
    const { emailData } = props.email
    const dispatch = useDispatch();
    const [email, setEmail] = useState(emailData)
    const [password, setPassword] = useState('')

    const handleSubmit = e => {
        e.preventDefault()
        dispatch(sessionActions.login({email, password}))
    }
    return(
        <form className='login-form' onSubmit={handleSubmit}>
            <header className='modal-header'>Finish logging in</header>
            <label className='user-label'>Email
                <input
                    className='user-input'
                    type='text'
                    placeholder='Email'
                    value={email}
                    onChange ={e => setEmail(e.target.value)} />
            </label>
            <label className='user-label'>Password
                <input
                    className='user-input'
                    type='password'
                    placeholder="Password"
                    value={password}
                    onChange ={e => setPassword(e.target.value)} />
            </label>
            <button className='user-button'>Log in</button>
        </form>
    )
}

export default LoginForm;