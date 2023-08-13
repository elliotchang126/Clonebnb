import './UserForm.css'
import { useState } from 'react';
import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/sessionReducer'

const UserForm = () => {
    const dispatch = useDispatch();
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    // const [firstName, setFirstName] = useState('')
    // const [lastName, setLastName] = useState('')
    const [errors, setErrors] = useState([])

    const handleBackgroundClick = e => {
        e.preventDefault()
        e.stopPropagation();
        // closeModal()
    }

    const handleSubmit = e => {
        e.preventDefault();
        setErrors([])
        return dispatch(sessionActions.login({email, password}))
            .catch(async res => {
                let data;
                try {
                    data = await res.clone().json();
                } catch {
                    data = await res.text()
                }
                if (data?.errors) setErrors(data.errors);
                else if (data) setErrors([data]);
                else setErrors([res.statusText])
            });
    }

    return (
        <form onSubmit={handleSubmit}>
            <ul>
                {errors.map(error => <li key={error}>{error}</li>)}
            </ul>
            <label>Email:
                <input 
                    type='text' 
                    value={email} 
                    onChange={e => setEmail(e.target.value)} 
                    required />
            </label>
            <br />
            <label>Password:
                <input 
                    type='text' 
                    value={password} 
                    onChange={e => setPassword(e.target.value)} 
                    required />
            </label>
            <button>Log in</button>
        </form>
    )
}

export default UserForm