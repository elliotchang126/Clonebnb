import csrfFetch from "./csrf";
import { RECEIVE_LISTING } from "./listingsReducer";
import { RECEIVE_USER } from "./usersReducer";

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
    type: REMOVE_REVIEW,
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
    try {
        const res = await csrfFetch(`/api/reviews`, {
            method: 'POST',
            body: JSON.stringify(review)
        })

        const newReview = await res.json()
        dispatch(receiveReview(newReview))
        return res

    } catch (err) {
        const errors = await err.json();
        dispatch(receiveReviewErrors(errors))
    }
}

export const updateReview = review => async dispatch => {
    try {
        const res = await csrfFetch(`/api/reviews/${review.id}`, {
            method: 'PATCH',
            body: JSON.stringify(review)
        })

        const updatedReview = await res.json();
        dispatch(receiveReview(updatedReview))
        return res
    } catch (err) {
        const errors = await err.json();
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
        case RECEIVE_LISTING:
            return { ...action.payload.reviews }
        case RECEIVE_USER:
            return { ...action.payload.reviews }
        // case RECEIVE_REVIEWS:
        //     return { ...action.reviews }
        case RECEIVE_REVIEW:
            return { ...state, [action.review.id]: action.review}
        case REMOVE_REVIEW:
            delete nextState[action.reviewId]
            return nextState
        default:
            return state
    }
}

export default reviewsReducer;