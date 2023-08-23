import { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import * as sessionActions from '../../store/sessionReducer'
import handleMouseover from "../../util/buttonUtil";
import '../../context/Modal.css'

const LoginForm = (props) => {
    const dispatch = useDispatch();
    const [email, setEmail] = useState(props.email)
    const [password, setPassword] = useState('')
    const [error, setError] = useState('')
    const {setShowModal} = props
    const sessionErrors = useSelector(state => state.errors.session)

    const demoLogin = (e) => {
        e.preventDefault()
        dispatch(sessionActions.login({email: 'demo@demo.io', password: 'password'}))
    }

    useEffect(() => {
        const buttons = document.querySelectorAll('.user-button')

        if (!buttons.length) return;

        buttons.forEach(button => {
            button.addEventListener('mousemove', handleMouseover);
        })

        return () => {
            buttons.forEach(button => {
                button.removeEventListener('mousemove', handleMouseover)
            })
        }
    }, [])

    const handleSubmit = async e => {
        e.preventDefault()
        await dispatch(sessionActions.login({email, password}))
        .catch(async (res) => {
            let data;
            try {
                data = await res.clone().json();
            } catch {
                data = await res.text();
            }
            if (data?.errors) setError(data.errors);
            else if (data) setError([data]);
            else setError([res.statusText]);
        })
    }

    return(
        <div className='login-form'>
        <form onSubmit={handleSubmit}>
            <div className='header'>
            <div className="close-button" onClick={()=> setShowModal(false)}>&times;</div>
            <header className='modal-header'>Finish logging in</header>
            </div>
            <div className="input-wrapper">
                <input
                    className='user-input'
                    type='text'
                    placeholder='Email'
                    value={email}
                    onChange ={e => setEmail(e.target.value)} required/>
                <label htmlFor='email-input' className='user-label'>Email</label>
            </div>
            <div className="input-wrapper">
                <input
                    id='password-input'
                    className='user-input'
                    type='password'
                    placeholder="Password"
                    value={password}
                    onChange ={e => setPassword(e.target.value)} required/>
                <label htmlFor='password-input' className='user-label'>Password</label>
            </div>
            {error && <div className="error-message">
                <i className="fa-solid fa-circle-exclamation" style={{color: "#ff0000"}}></i>
                {error}
            </div> }
            <button className='user-button'>Log in</button>
        </form>
        <button type='button' id='demo-login' className='user-button' onClick={demoLogin}>Demo Login</button>
    </div>
)
}

export default LoginForm;