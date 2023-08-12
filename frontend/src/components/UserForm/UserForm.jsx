import './UserForm.css'

const UserForm = ({ closeModal }) => {
    const handleBackgroundClick = e => {
        e.stopPropagation();
        closeModal()
    }
    return (
        <div className="modal">
            <div className="modal-background" onClick={handleBackgroundClick}>
                <div className='modal-foreground'>
                    <h2>Sign Up</h2>
                </div>

            </div>

        </div>
    )
}

export default UserForm