import { useDispatch, useSelector } from "react-redux"
import { fetchReviews, getReviews } from "../../store/reviewsReducer";
import { useEffect } from "react";
import ReviewsIndexItem from "../ReviewsIndexItem/ReviewsIndexItem";

const ReviewsIndex = () => {
    const dispatch = useDispatch();
    const reviews = useSelector(getReviews)

    useEffect(() => {
        dispatch(fetchReviews())
    }, [dispatch])

    return(
        <div className="listing-reviews">
            <div className="reviews-header">
                <div>&#9733;</div>
            </div>
            <div className="reviews-index">
                {reviews?.map(review =>
                    <ReviewsIndexItem review={review}/>
                )}
            </div>
        </div>
    )
}

export default ReviewsIndex;