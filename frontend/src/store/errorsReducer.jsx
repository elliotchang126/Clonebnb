import { CLEAR_LISTING_ERRORS, RECEIVE_LISTING, RECEIVE_LISTINGS, RECEIVE_LISTING_ERRORS } from "./listingsReducer";
import { RECEIVE_REVIEWS, RECEIVE_REVIEW_ERRORS, REMOVE_REVIEW } from "./reviewsReducer";
import { CLEAR_SESSION_ERRORS, RECEIVE_SESSION_ERRORS, REMOVE_CURRENT_USER, SET_CURRENT_USER } from "./sessionReducer";
import { CLEAR_USER_ERRORS, RECEIVE_USER, RECEIVE_USERS, RECEIVE_USER_ERRORS } from "./usersReducer";


const errorsReducer = ( state={ session: [], users: [], listings: [], reviews: [], reservations: [] }, action ) => {
    const nextState = { ...state }
    switch(action.type) {
        case REMOVE_CURRENT_USER:
            return { ...nextState, session: [] }
        case SET_CURRENT_USER:
            return { ...nextState, session: [] }
        case RECEIVE_SESSION_ERRORS:
            return { ...nextState, session: action.payload.errors }
        case CLEAR_SESSION_ERRORS:
            return { ...nextState, session: [] }
        case RECEIVE_LISTING:
            return { ...nextState, listings: [] }
        case RECEIVE_LISTINGS:
            return { ...nextState, listings: [] }
        case RECEIVE_LISTING_ERRORS:
            return { ...nextState, listings: action.payload.errors }
        case CLEAR_LISTING_ERRORS:
            return { ...nextState, listings: [] }
        case RECEIVE_USERS:
            return { ...nextState, users: [] }
        case RECEIVE_USER:
            return { ...nextState, users: [] }
        case RECEIVE_USER_ERRORS:
            return { ...nextState, users: action.payload.errors }
        case CLEAR_USER_ERRORS:
            return { ...nextState, users: [] }
        case RECEIVE_REVIEWS:
            return { ...nextState, reviews: [] }
        case RECEIVE_REVIEW:
            return { ...nextState, reviews: [] }
        case RECEIVE_REVIEW_ERRORS:
            return { ...nextState, reviews: action.payload.errors }
        case REMOVE_REVIEW:
            return { ...nextState, reviews: [] }
        default:
            return state;
    }
}

export default errorsReducer;