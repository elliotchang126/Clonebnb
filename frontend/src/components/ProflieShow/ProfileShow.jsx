import { shallowEqual, useDispatch, useSelector } from "react-redux"
import "./ProfileShow.css"
import ReviewsIndexItem from "../ReviewsIndexItem/ReviewsIndexItem"
import { fetchUser, getUser } from "../../store/usersReducer"
import { useEffect, useState } from "react"
import { deleteReview, getReviews } from "../../store/reviewsReducer"
import { Modal } from "../../context/Modal"
import UpdateReviewForm from "../ReviewForm/UpdateReviewForm"
import handleMouseover from "../../util/buttonUtil"
import ReservationsIndex from "../Reservations/ReservationsIndex"
import { getReservations } from "../../store/reservationsReducer"

const ProfileShow = () => {
    const dispatch = useDispatch();
    const user = useSelector(state => state?.session?.user);
    // const user = useSelector(getUser(user?.id))
    const reservations = useSelector(getReservations, shallowEqual)
    const reviews = useSelector(getReviews, shallowEqual);
    const [showModal, setShowModal] = useState(false);
    const [updateId, setUpdateId] = useState(null);

    useEffect(() => {
        dispatch(fetchUser(user?.id))
    }, [dispatch, user.id])

    const openModal = e => {
        if (showModal) return;
        e.stopPropagation();
        setShowModal(true)
    }

    useEffect(() => {
        if (showModal) return;

        const closeModal = () => {
            setShowModal(false)
        }
        document.addEventListener('click', closeModal)
        return () => document.removeEventListener('click', closeModal)
    }, [showModal])

    useEffect(() => {
        const buttons = document.querySelectorAll('.review-button')

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

    const handleUpdateButton = (e, reviewId) => {
        setUpdateId(reviewId)
        openModal(e)
    }

    return(
        <div className="profile-container">
            <h1 className="profile-header">Trips</h1>
                <div className="reservations-container">
                    {/* <ReservationsIndex /> */}
                </div>
            <h1 className="profile-header">Your Previous Trip Reviews</h1>
            <div className='profile-reviews-container'>
                {reviews?.map(review => (
                    <div key={`review-${review.id}`}className='profile-review'>
                        <h4 className='review-listing-title' >{review.listingTitle}</h4>
                        <ReviewsIndexItem className='profile-review-content'review={review} />
                        <button
                            className="review-button"
                            onClick={(e) => handleUpdateButton(e, review.id)}>
                            Update Review
                        </button>
                        <button 
                            className="review-button"
                            onClick={() => dispatch(deleteReview(review.id))}>
                            Delete Review
                        </button>
                    </div>
                ))}
            </div>
            {showModal && (
                user ? (
                    <Modal onClose={() => setShowModal(false)}>
                        <UpdateReviewForm setShowModal={setShowModal} reviewId={updateId}/>
                    </Modal>
                ) :
                <div>Sorry, must be logged in to leave a review.</div>
            )}
        </div>
    )
}

export default ProfileShow