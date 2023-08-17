import csrfFetch from "./csrf";

export const RECEIVE_REVIEWS = 'reviews/RECEIVE_REVIEWS';
export const RECEIVE_REVIEW = 'reviews/RECEIVE_REVIEW';
export const REMOVE_REVIEW = 'reviews/REMOVE_REVIEW';
export const RECEIVE_REVIEW_ERRORS = 'reviews/RECEIVE_REVIEW_ERRORS'
export const CLEAR_REVIEW_ERRORS = 'reviews/CLEAR_REVIEW_ERRORS'

export const receiveReviews = reviews => ({
    type: RECEIVE_REVIEWS,
    reviews
})

export const receiveReview = review => ({
    type: RECEIVE_REVIEW,
    review
})

export const removeReview = reviewId => ({
    type: RECEIVE_REVIEW,
    reviewId
})

export const receiveReviewErrors = errorMessage => ({
    type: RECEIVE_REVIEW_ERRORS,
    payload: errorMessage
})

export const getReviews = state => state.reviews ? Object.values(state.reviews) : [];

export const getReview = reviewId => state => state.reviews ? state.reviews[reviewId] : null;


export const fetchReviews = () => async dispatch => {
    const res = await csrfFetch(`/api/reviews`)

    if (res.ok) {
        const reviews = await res.json();
        dispatch(receiveReviews(reviews))
        return res
    } else {
        const errors = await res.json();
        dispatch(receiveReviewErrors(errors))
    }
}

export const fetchReview = reviewId => async dispatch => {
    const res = await csrfFetch(`/api/reviews/${reviewId}`)

    if (res.ok) {
        const review = await res.json();
        dispatch(receiveReview(review))
        return res
    } else {
        const errors = await res.json();
        dispatch(receiveReviewErrors(errors))
    }
}

export const createReview = review => async dispatch => {
    const res = await csrfFetch(`/api/reviews`, {
        method: 'POST',
        body: JSON.stringify(review)
    })
    if (res.ok) {
        const newReview = await res.json()
        dispatch(receiveReview(newReview))
        return res
    } else {
        const errors = await res.json();
        dispatch(receiveReviewErrors(errors))
    }
}

export const updateReview = review => async dispatch => {
    const res = await csrfFetch(`/api/reviews/${reviewId}`, {
        method: 'PATCH',
        body: JSON.stringify(review)
    })
    if (res.ok) {
        const updatedReview = await res.json();
        dispatch(receiveReview(updatedReview))
    } else {
        const errors = await res.json();
        dispatch(receiveReviewErrors(errors))
    }
}

export const deleteReview = reviewId => async dispatch => {
    const res = await csrfFetch(`/api/reviews/${reviewId}`, {
        method: 'DELETE'
    })
    if (res.ok) {
        dispatch(removeReview(reviewId))
    } else {
        const errors = await res.json();
        dispatch(receiveReviewErrors(errors))
    }
}

const reviewsReducer = ( state={}, action ) => {
    const nextState = { ...state }

    switch(action.type) {
        case RECEIVE_REVIEWS:
            return { ...action.reviews }
        case RECEIVE_REVIEW:
            return { ...state, [action.review.id]: action.review}
        case REMOVE_REVIEW:
            delete nextState[action.reviewId]
        default:
            return state
    }
}

export default reviewsReducer