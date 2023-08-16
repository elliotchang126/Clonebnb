import csrfFetch from "./csrf";

const RECEIVE_USER = 'users/RECEIVE_USER'

export const receiveUser = user => ({
    type: RECEIVE_USER,
    user
})

export const getUser = userId => state => state.users ? state.users[userId] : null;

export const fetchUser = userId => async dispatch => {
    const res = await csrfFetch(`/api/users/${userId}`)
    if (res.ok) {
        const user = await res.json();
        dispatch(receiveUser(user))
    } else {
        throw res
    }
    return res
}

const usersReducer = ({state={}, action}) => {
    switch(action.type) {
        case RECEIVE_USER:
            return { ...state, [action.user.id]: action.user }
        default:
            return state;
    }
}

export default usersReducer;