import { useState } from "react";
import { Modal } from "../../context/Modal";
// import UserForm from "./UserForm";
import './UserForm.css'
import UserModal from "./checkEmailModal";


const UserFormModal = () => {
    const [showModal, setShowModal] = useState(false)

    return (
        <>
            <button onClick={() => setShowModal(true)}>Log in</button>
            {showModal && (
                <Modal onClose={() => setShowModal(false)}>
                    <UserModal />
                </Modal>
            )}
        </>
    )
}

export default UserFormModal;