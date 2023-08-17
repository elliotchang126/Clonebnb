import csrfFetch from "./csrf";

export const SET_CURRENT_USER = 'session/SET_CURRENT_USER';
export const REMOVE_CURRENT_USER = 'session/REMOVE_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'session/RECEIVE_SESSION_ERRORS'
export const CLEAR_SESSION_ERRORS = 'session/CLEAR_SESSION_ERRORS'

export const setCurrentUser = user => ({
    type: SET_CURRENT_USER,
    user
})

export const removeCurrentUser = userId => ({
    type: REMOVE_CURRENT_USER,
    userId
})

export const receiveSessionErrors = errorMessage => ({
    type: RECEIVE_SESSION_ERRORS,
    payload: errorMessage
})

const storeCSRFToken = res => {
    const csrfToken = res.headers.get('X-CSRF-Token')
    if (csrfToken) sessionStorage.setItem('X-CSRF-Token', csrfToken)
}

export const storeCurrentUser = user => {
    if (user) sessionStorage.setItem('currentUser', JSON.stringify(user));
    else sessionStorage.removeItem('currentUser')
}

export const login = ({email, password}) => async dispatch => {
    const res = await csrfFetch('/api/session', {
        method: 'POST',
        body: JSON.stringify({email, password})
    })
    if (res.ok) {
        const userData = await res.json();
        restoreSession(userData.user)
        dispatch(setCurrentUser(userData.user))
        return res
    } else {
        const errors = await res.json();
        dispatch(receiveSessionErrors(errors))
    }
}

export const restoreSession = () => async dispatch => {
    const res = await csrfFetch('/api/session');
    storeCSRFToken(res);
    const userData = await res.json();
    storeCurrentUser(userData.user);
    dispatch(setCurrentUser(userData.user))
    return res
}

export const logout = () => async dispatch => {
    const res = await csrfFetch('/api/session', {
        method: 'DELETE'
    })
    if (res.ok) {
        storeCurrentUser(null);
        dispatch(removeCurrentUser())
        return res
    } else {
        const errors = await res.json();
        dispatch(receiveSessionErrors(errors))
    }
}

export const signup = ({email, password, firstName, lastName}) => async dispatch => {
    const res = await csrfFetch('/api/users', {
        method: 'POST',
        body: JSON.stringify({user: {email, password, firstName, lastName}})
    })
    if (res.ok) {
        const userData = await res.json();
        storeCurrentUser(userData.user);
        dispatch(setCurrentUser(userData.user))
        return res
    } else {
        const errors = await res.json();
        dispatch(receiveSessionErrors(errors))
    }
}


const initialState = { user: JSON.parse(sessionStorage.getItem('currentUser'))}

const sessionReducer = (state=initialState, action) => {
    switch(action.type) {
        case SET_CURRENT_USER:
            return { ...state, user: action.user}
        case REMOVE_CURRENT_USER:
            return { ...state, user: null}
        default:
            return state
    }
}

export default sessionReducer;