import { shallowEqual, useDispatch, useSelector } from "react-redux"
import { fetchReviews, getReviews } from "../../store/reviewsReducer";
import { useEffect } from "react";
import ReviewsIndexItem from "../ReviewsIndexItem/ReviewsIndexItem";
import './ReviewsIndex.css'
import ReviewProgressbar from "../ReviewProgressBar/ReviewProgressBar";

const ReviewsIndex = ({ listing }) => {
    const dispatch = useDispatch();
    const reviews = useSelector(getReviews, shallowEqual)

    useEffect(() => {
        dispatch(fetchReviews)
    }, [dispatch])

    return(
        <div className="listing-reviews">
            <div className="reviews-header">
                <div>&#9733; {listing?.overallRating} · {reviews.length} reviews</div>
            </div>
            <ReviewProgressbar listing={listing} />
            <div className="reviews-index">
                {reviews?.map(review =>
                    <ReviewsIndexItem className='reviews-index-item' key={review.id} review={review} />
                )}
            </div>
        </div>
    )
}

export default ReviewsIndex;