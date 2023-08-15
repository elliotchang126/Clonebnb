import csrfFetch from "./csrf"

const RECEIVE_LISTINGS = 'listings/RECEIVE_LISTINGS'
const RECEIVE_LISTING = 'listings/RECEIVE_LISTING'

export const receiveListings = listings => ({
    type: RECEIVE_LISTINGS,
    listings
})

export const receiveListing = listing => ({
    type: RECEIVE_LISTING,
    listing
})

export const getListings = state => state.listings ? Object.values(state.listings) : [];
export const getListing = listingId => state.listings ? state.listings[listingId] : null;

export const fetchListings = () => async dispatch => {
    const res = await csrfFetch('/api/listings')
    if (res.ok) {
        const listings = await res.json();
        dispatch(receiveListings(listings))
    } else {
        throw res
    }
    return res
}

export const fetchListing = listingId => async dispatch => {
    const res = await csrfFetch(`/api/listings/${listingId}`)
    if (res.ok) {
        const listing = await res.json();
        dispatch(receiveListing(listing))
    } else {
        throw res
    }
    return res
}


const listingsReducer = (state={}, action) => {
    switch (action.type) {
        case RECEIVE_LISTINGS:
            return { ...action.listings }
        case RECEIVE_LISTING:
            return { ...state, [action.listing.id]: action.listing }
        default:
            return state;
    }
}

export default listingsReducer;