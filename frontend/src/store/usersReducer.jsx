import csrfFetch from "./csrf";

const RECEIVE_USERS = 'users/RECEIVE_USERS'
const RECEIVE_USER = 'users/RECEIVE_USER'

export const receiveUsers = users => ({
    type: RECEIVE_USERS,
    users
})

export const receiveUser = user => ({
    type: RECEIVE_USER,
    user
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
            return { ...state, [action.user.id]: action.user };
        default:
            return state;
    }
}

export default usersReducer;