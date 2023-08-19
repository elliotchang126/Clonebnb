import { useDispatch, useSelector } from "react-redux";
import { fetchUser, getUser } from "../../store/usersReducer";
import { BsPersonCircle } from 'react-icons/bs'
import './ReviewsIndexItem.css'
import { useEffect } from "react";

const ReviewsIndexItem = ({ review }) => {
    const dispatch = useDispatch()
    const userId = review?.userId
    const guest = useSelector(getUser(userId))

    useEffect(() => {
        if (!guest && userId) {
            dispatch(fetchUser(userId))
        }
    }, [dispatch, userId, guest])

    const average = ((review.cleanliness + review.communication + review.checkIn + review.accuracy + review.location + review.value) / 6).toFixed(2)
    const averageReview = parseFloat(average)

    return(
        <div className="review-item-container">
            <div className='guest-container'>
                <BsPersonCircle className='guest-icon'/>
                <div className="guest-text">
                    <div className='guest-name'>{guest?.firstName}</div>
                    <div className='guest-rating'>&#9733; {averageReview}</div>
                </div>
            </div>
            <div className='guest-review'>{review?.body}</div>
        </div>
    )
}

export default ReviewsIndexItem;