import { useState } from "react"
import UserForm from '../UserForm/UserForm'

const Home = props => {

    const [showForm, setShowForm] = useState(false)

    return (
        <>
            <h1>Splash</h1>
            <button onClick={() => setShowForm(true)}>Sign Up</button>
            {showForm && (
                <UserForm closeModal = {() => setShowForm(false)}/>
            )}
        </>
    )
}

export default Home