import { useState } from "react";
import { Modal } from "../../context/Modal";
import UserModal from "./checkEmailModal";


const UserFormModal = () => {
    const [showModal, setShowModal] = useState(false)

    return (
        <>
            <div className='profile' onClick={() => setShowModal(true)}>
                <i className="fa-solid fa-regular fa-bars" style={{color: '#303030'}}></i>{' '}
                <i className="fa-solid fa-circle-user" style={{color: '#828487'}}></i>
            </div>
            {/* <button onClick={() => setShowModal(true)}>Log in</button> */}
            {showModal && (
                <Modal onClose={() => setShowModal(false)}>
                    <UserModal />
                </Modal>
            )}
        </>
    )
}

export default UserFormModal;