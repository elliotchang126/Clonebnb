import { useSelector } from "react-redux";
import { getUser } from "../../store/usersReducer";
import { BsPersonCircle } from 'react-icons/bs'
import './ReviewsIndexItem.css'

const ReviewsIndexItem = ({ review }) => {
    const guestId = review?.userId
    const guest = useSelector(getUser(guestId))

    return(
        <div className="review-item-container">
            <div className='guest-container'>
                <BsPersonCircle className='guest-icon'/>
                <div className='guest-name'>{guest.firstName}</div>
            </div>
            <div className='guest-review'>{review?.body}</div>
        </div>
    )
}

export default ReviewsIndexItem;