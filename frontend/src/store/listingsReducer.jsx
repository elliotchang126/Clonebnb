import csrfFetch from "./csrf"

export const RECEIVE_LISTINGS = 'listings/RECEIVE_LISTINGS'
export const RECEIVE_LISTING = 'listings/RECEIVE_LISTING'
export const RECEIVE_LISTING_ERRORS = 'session/RECEIVE_LISTING_ERRORS'
export const CLEAR_LISTING_ERRORS = 'session/CLEAR_LISTING_ERRORS'

export const receiveListings = listings => ({
    type: RECEIVE_LISTINGS,
    listings
})

export const receiveListing = payload => {
    return {
        type: RECEIVE_LISTING,
        payload
    }
}

export const receiveListingErrors = errorMessage => ({
    type: RECEIVE_LISTING_ERRORS,
    payload: errorMessage
})

export const getListings = state => state.listings ? Object.values(state.listings) : [];
export const getListing = listingId => state => state.listings ? state.listings[listingId] : null;

export const fetchListings = params => async dispatch => {
    let baseUrl = '/api/listings?'

    for ( let key in params ) {
        baseUrl = baseUrl + `${key}=${params[key]}&`
    }
    try {
        const res = await csrfFetch(`${baseUrl}`)
        const listings = await res.json();
        dispatch(receiveListings(listings))
        return res
    } catch (err) {
        const errors = await err.json();
        console.log(errors)
        dispatch(receiveListingErrors(errors))
    }
}

export const fetchListingsByCategory = category => async dispatch => {
    const encodedCategory = encodeURIComponent(category)
    const res = await csrfFetch(`/api/listings?category=${encodedCategory}`);
    if (res.ok) {
        const listings = await res.json();
        dispatch(receiveListings(listings));
        return res;
    } else {
        const errors = await res.json();
        dispatch(receiveListingErrors(errors))
    }
}

export const fetchListing = listingId => async dispatch => {
    const res = await csrfFetch(`/api/listings/${listingId}`)
    if (res.ok) {
        const listing = await res.json();
        dispatch(receiveListing(listing))
        return res
    } else {
        const errors = await res.json();
        dispatch(receiveListingErrors(errors))
    }
}

const listingsReducer = (state={}, action) => {
    switch (action.type) {
        case RECEIVE_LISTINGS:
            return { ...action.listings }
        case RECEIVE_LISTING:
            return { ...state, [action.payload.listing.id]: action.payload.listing }
        case RECEIVE_LISTING_ERRORS:
            return {}
        default:
            return state;
    }
}

export default listingsReducer;