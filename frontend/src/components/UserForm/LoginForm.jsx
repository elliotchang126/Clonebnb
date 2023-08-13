import { useState } from "react";
import { useDispatch } from "react-redux";
import * as sessionActions from '../../store/sessionReducer'


const LoginForm = (props) => {
    const { emailData } = props.email
    const dispatch = useDispatch();
    const [email, setEmail] = useState(emailData)
    const [password, setPassword] = useState('')
    console.log('Rendering form')

    const handleSubmit = e => {
        e.preventDefault()
        dispatch(sessionActions.login({email, password}))
    }
    return(
        <form onSubmit={handleSubmit}>
            <label>Email
                <input
                    type='text'
                    value={email}
                    onChange ={e => setEmail(e.target.value)} />
            </label>
            <label>Password
                <input
                    type='password'
                    value={password}
                    onChange ={e => setPassword(e.target.value)} />
            </label>
            <button>Log in</button>
        </form>
    )
}

export default LoginForm;