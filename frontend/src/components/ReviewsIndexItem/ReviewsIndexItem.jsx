import { useSelector } from "react-redux";
import { getUser } from "../../store/usersReducer";
import { BsPersonCircle } from 'react-icons/bs'
import './ReviewsIndexItem.css'

const ReviewsIndexItem = ({ review }) => {
    const guestId = review?.userId
    const guest = useSelector(getUser(guestId))

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