import { useDispatch, useSelector } from "react-redux"
import { fetchReviews, getReviews } from "../../store/reviewsReducer";
import { useEffect } from "react";
import ReviewsIndexItem from "../ReviewsIndexItem/ReviewsIndexItem";
import './ReviewsIndex.css'

const ReviewsIndex = () => {
    const dispatch = useDispatch();
    const reviews = useSelector(getReviews)

    useEffect(() => {
        dispatch(fetchReviews())
    }, [dispatch])

    return(
        <div className="listing-reviews">
            <div className="reviews-header">
                <div>&#9733; 4.94 · 336 reviews</div>
            </div>
            <div className="reviews-index">
                {reviews?.map(review =>
                    <ReviewsIndexItem className='reviews-index-item' key={review.id} review={review}/>
                )}
            </div>
        </div>
    )
}

export default ReviewsIndex;