
const ReviewsIndexItem = ({ review }) => {

    return(
        <div className="review-item-container">
            <div>Host Name</div>
            <div>{review?.body}</div>
        </div>
    )
}

export default ReviewsIndexItem;