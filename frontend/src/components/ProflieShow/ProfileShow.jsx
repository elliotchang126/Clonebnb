import { useDispatch, useSelector } from "react-redux"
import "./ProfileShow.css"
import ReviewsIndexItem from "../ReviewsIndexItem/ReviewsIndexItem"
import { fetchUser, getUser } from "../../store/usersReducer"
import { useEffect } from "react"
import { getReviews } from "../../store/reviewsReducer"

const ProfileShow = () => {
    const dispatch = useDispatch();
    const currentUser = useSelector(state => state?.session?.user)
    const user = useSelector(getUser(currentUser?.id))
    const reviews = useSelector(getReviews)

    useEffect(() => {
        dispatch(fetchUser(currentUser?.id))
    }, [dispatch, currentUser.id])
    return(
        <div className="profile-container">
            <h1 className="profile-header">Trips</h1>

            <h1 className="profile-header">Reviews</h1>
            <div className='profile-reviews-container'>
                {reviews?.map(review => (
                    <ReviewsIndexItem className='profile-reviews' review={review} />
                ))}
            </div>
        </div>
    )
}

export default ProfileShow