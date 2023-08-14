import { useState, useEffect } from "react";
import { useDispatch } from "react-redux"
import * as sessionActions from '../../store/sessionReducer'
import '../../context/Modal.css'

const SignupForm = (props) => {
    const dispatch = useDispatch();
    const [email, setEmail] = useState(props.email);
    const [password, setPassword] = useState('');
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('')
    const [emailError, setEmailError] = useState('')
    const [firstNameError, setFirstNameError] = useState('')
    const [lastNameError, setLastNameError] = useState('')
    const [passwordError, setPasswordError] = useState('')
    const { setShowModal } = props

    const demoLogin = (e) => {
        e.preventDefault();
        dispatch(sessionActions.login({email: 'demo@demo.io', password: 'password'}))
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

    const handleSubmit = async e => {
        e.preventDefault();
        setEmailError('')
        setPasswordError('')
        setFirstNameError('')
        setLastNameError('')

        // needs major refactoring
        let hasError = false
        const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

        setEmailError('')
        if (!email) {
            setEmailError('Email is required.');
            hasError = true;
        }

        if (!emailPattern.test(email)) {
            setEmailError("Please enter a valid email.")
            hasError = true;
        }

        if (!firstName) {
            setFirstNameError('First name is required.')
            hasError = true;
        }

        if (!lastName) {
            setLastNameError('Last name is required.')
            hasError = true;
        }

        if (password.length < 6) {
            setPasswordError('Password must be at least 6 characters')
            hasError = true;
        }

        if (hasError) return;

        let user = {
            email,
            password,
            firstName,
            lastName
        }
        await dispatch(sessionActions.signup(user))
    }
    
    return(
        <div className='signup-form'>
            <form onSubmit={handleSubmit}>
                <div className="header">
                    <div className="close-button" onClick={()=> setShowModal(false)}>&times;</div>
                    <header className='modal-header'>Finish signing up</header>
                </div>
                <div className="input-wrapper">
                    <input
                        id='first-name-input' 
                        className='user-input first-name'
                        type='text'
                        placeholder="First name"
                        onChange ={e => setFirstName(e.target.value)} required/>
                    <label htmlFor='first-name-input' className='user-label'>First Name</label>
                </div>
                    {firstNameError && <div className="error-message">
                    <i className="fa-solid fa-circle-exclamation" style={{color: "#ff0000"}}></i>
                    {firstNameError}
                    </div> }
                <div className="input-wrapper">
                    <input
                        id='last-name-input'
                        className='user-input last-name'
                        type='text'
                        placeholder="Last name"
                        value={lastName}
                        onChange ={e => setLastName(e.target.value)} required/>
                    <label htmlFor='last-name-input' className='user-label'>Last Name</label>
                </div>
                    {lastNameError && <div className="error-message">                        
                        <i className="fa-solid fa-circle-exclamation" style={{color: "#ff0000"}}></i>
                        {lastNameError}
                    </div> }
                <p className='user-form-desc'>Make sure it matches the name on your government ID.</p>
                <div className="input-wrapper">
                    <input
                        id='email-input'
                        className='user-input email-input'
                        type='text'
                        placeholder="Email"
                        value={email}
                        onChange ={e => setEmail(e.target.value)} required/>
                    <label htmlFor='email-input' className='user-label'>Email</label>
                </div>
                {emailError && <div className="error-message">
                    <i className="fa-solid fa-circle-exclamation" style={{color: "#ff0000"}}></i>
                    {emailError}
                    </div> }
                <p className='user-form-desc'>We'll email you trip confirmations and receipts.</p>
                <div className="input-wrapper">
                    <input
                        id='password-input'
                        className='user-input password-input'
                        type='password'
                        placeholder="Password"
                        value={password}
                        onChange ={e => setPassword(e.target.value)} required/>
                    <label htmlFor='password-input' className='user-label'>Password</label>
                </div>
                    {passwordError && <div className="error-message">
                        <i className="fa-solid fa-circle-exclamation" style={{color: "#ff0000"}}></i>
                        {passwordError}
                    </div> }
                <p className='user-form-terms'>By selecting Agree and Continue, I agree to Clonebnb's Terms of Service, Payments Terms of Service, and Nondiscrimination Policy and acknowledge the Privacy Policy.</p>
                <button className='user-button' type='submit'>Agree and continue</button>
            </form>
            <button type='button' id='demo-login' className='user-button' onClick={demoLogin}>Demo Login</button>
        </div>
    )
}

export default SignupForm