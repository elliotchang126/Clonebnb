import csrfFetch from "./csrf";

export const RECEIVE_USERS = 'users/RECEIVE_USERS'
export const RECEIVE_USER = 'users/RECEIVE_USER'
export const RECEIVE_USER_ERRORS = 'session/RECEIVE_USER_ERRORS'
export const CLEAR_USER_ERRORS = 'session/CLEAR_USER_ERRORS'

export const receiveUsers = users => ({
    type: RECEIVE_USERS,
    users
})

export const receiveUser = payload => {
    return {
        type: RECEIVE_USER,
        payload
    }
}

export const receiveUserErrors = errorMessage => ({
    type: RECEIVE_USER_ERRORS,
    payload: errorMessage
})


export const getUsers = state => state.users ? Object.values(state.users) : [];
export const getUser = userId => state => state.users ? state.users[userId] : null;

export const fetchUsers = () => async dispatch => {
    const res = await csrfFetch(`/api/users`)
    if (res.ok) {
        const users = await res.json();
        dispatch(receiveUsers(users))
    } else {
        throw res
    }
    return res
}

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

const usersReducer = (state={}, action) => {
    switch(action.type) {
        case RECEIVE_USERS:
            return { ...action.users };
        case RECEIVE_USER:
            return { ...state, [action.payload.user.id]: action.payload.user };
        default:
            return state;
    }
}

export default usersReducer;