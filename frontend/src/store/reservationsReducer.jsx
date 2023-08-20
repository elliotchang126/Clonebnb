import csrfFetch from "./csrf";

export const RECEIVE_RESERVATIONS = 'reservations/RECEIVE_RESERVATIONS'
export const RECEIVE_RESERVATION = 'reservations/RECEIVE_RESERVATION'
export const REMOVE_RESERVATION = 'reservations/REMOVE_RESERVATION'
export const RECEIVE_RESERVATION_ERRORS = 'reservations/RECEIVE_RESERVATION_ERRORS'
export const CLEAR_RESERVATION_ERRORS = 'reservations/CLEAR_RESERVATION_ERRORS'

export const receiveReservations = reservations => ({
    type: RECEIVE_RESERVATIONS,
    reservations
})

export const receiveReservation = reservation => ({
    type: RECEIVE_RESERVATION,
    reservation
})

export const removeReservation = reservationId => ({
    type: REMOVE_RESERVATION,
    reservationId
})

export const receiveReservationErrors = errorMessage => ({
    type: RECEIVE_RESERVATION_ERRORS,
    payload: errorMessage
})

export const getReservations = state => state.reservations ? Object.values(state.reservations) : [];

export const getReservation = reservationId => state => state.reservations ? state.reservations[reservationId] : null;

export const fetchReservations = () => async dispatch => {
    const res = await csrfFetch('/api/reservations')

    if (res.ok) {
        const reservations = await res.json();
        dispatch(receiveReservations(reservations))
    } else {
        const errors = await res.json();
        dispatch(receiveReservationErrors(errors))
    }
}

export const fetchReservation = reservationId => async dispatch => {
    const res = await csrfFetch(`/api/reservations/${reservationId}`)

    if (res.ok) {
        const reservation = await res.json();
        dispatch(receiveReservation(reservation))
    } else {
        const errors = await res.json();
        dispatch(receiveReservationErrors(errors))
    }
}

export const createReservation = reservation => async dispatch => {
    const res = await csrfFetch('/api/reservations', {
        method: 'POST',
        body: JSON.stringify(reservation)
    })
    if (res.ok) {
        const newReservation = await res.json();
        dispatch(receiveReservation(newReservation))
    } else {
        const errors = await res.json();
        dispatch(receiveReservationErrors(errors))
    }
}

export const updateReservation = reservation => async dispatch => {
    const res = await csrfFetch(`/api/reservations/${reservation.id}`, {
        method: 'PATCH',
        body: JSON.stringify(reservation)
    })
    if (res.ok) {
        const updatedReservation = await res.json();
        dispatch(receiveReservation(updatedReservation))
    } else {
        const errors = await res.json();
        dispatch(receiveReservationErrors(errors))
    }
}

export const deleteReservation = reservationId => async dispatch => {
    const res = await csrfFetch(`/api/reservations/${reservationId}`, {
        method: 'DELETE',
    })
    if (res.ok) {
        dispatch(removeReservation(reservationId))
    } else {
        const errors = await res.json();
        dispatch(receiveReservationErrors(errors))
    }
}

const reservationsReducer = ( state={}, action ) => {
    const nextState = { ...state }

    switch(action.type) {
        case RECEIVE_LISTING:
            return { ...action.payload.reservations }
        case RECEIVE_USER:
            return { ...action.payload.reservations }
        case RECEIVE_RESERVATION:
            return { ...state, [action.reservation.id]: action.reservation }
        case REMOVE_RESERVATION:
            delete nextState[action.reservationId]
            return nextState
        default:
            return state
    }
}

export default reservationsReducer;