import { useEffect, useState } from 'react'
import moment from 'moment'
import './ReservationForm.css'
import ReservationCalendar from '../ReservationCalendar/ReservationCalendar'
import { useDispatch, useSelector } from 'react-redux'
import { updateReservation } from '../../../store/reservationsReducer'
import { useHistory } from 'react-router-dom/cjs/react-router-dom'

const UpdateReservationForm = ({ reservation, listing, reservationId,setRefresh, setShowUpdate }) => {
    const dispatch = useDispatch();
    const history = useHistory();
    const user = useSelector(state => state.session.user)
    const [startDate, setStartDate] = useState(moment(reservation?.startDate));
    const [endDate, setEndDate] = useState(moment(reservation?.endDate));
    const [dateError, setDateError] = useState('')
    // const [focusedInput, setFocusedInput] = useState(null);
    const [numGuests, setNumGuests] = useState(reservation?.numGuests);
    const [numNights, setNumNights] = useState(0);
    const [rawPrice, setRawPrice] = useState(0);
    const [totalPrice, setTotalPrice] = useState(0);
    const [serviceFee, setServiceFee] = useState(0)
    const [showLogin, setShowLogin] = useState(false);
    const reservationErrors = useSelector(state => state.errors.reservations)

    const blockedDates = [];

    listing?.reservations?.forEach(reservation => {
        let resDate = moment(reservation?.startDate);
        let resEndDate = moment(reservation?.endDate)

        while (resDate <= resEndDate) {
            blockedDates.push(resDate.format('YYYY-MM-DD'))
            resDate = resDate.add(1, 'days')
        }
    })

    // const isDateBlocked = date => {
    //     const dateToCheck = moment(date).format('YYYY-MM-DD')
    //     return blockedDates.includes(dateToCheck)
    // }

    const handleDecrement = () => {
        setNumGuests(prev => {
            if (prev === 1) {
                return prev
            } else {
                return prev - 1
            }
        })
    }

    const handleIncrement = () => {
        setNumGuests(prev => prev + 1)
    }

    useEffect(() => {
        if (startDate && endDate) {
            const start = new Date(startDate);
            const end = new Date(endDate);
            const time = end.getTime() - start.getTime();
            const nights = time / (1000 * 3600 * 24)
            setNumNights(nights)
            
            const price = reservation?.price * nights
            const fee = Math.round(((price + reservation?.cleaningFee) * 0.08))
            setRawPrice(price)
            setServiceFee(fee)
            setTotalPrice(price + reservation?.cleaningFee + fee)
        }
    }, [startDate, endDate, reservation?.cleaningFee, reservation?.price])

    const handleSubmit = () => {
        if (!user) {
            setShowLogin(true);
            return;
        }
        setShowLogin(false)
        // setRefresh(prev => !prev)
        
        if (!startDate || !endDate) {
            setDateError('Check-in and checkout dates are required')
            return;
        }
        
        const updatedReservation = {
            // ...reservation,
            id: reservationId,
            listing_id: reservation.listingId,
            user_id: reservation?.userId,
            start_date: startDate.format("YYYY-MM-DD"),
            end_date: endDate.format("YYYY-MM-DD"),
            num_guests: numGuests
        }
        dispatch(updateReservation(updatedReservation))
        setShowUpdate(false)
        history.push(`/users/${user.id}`)
        setDateError('')
    }

    return (
        <div className='reservation-container'>
            <div className='listing-info'>
                <div className="reservation-price">
                    <span className="reservation-price-night">${reservation?.price}</span> night
                </div>
                <div className="reservation-listing-info">
                    <div>
                        <span className="reserve-reviews-avg">&#9733; {reservation?.overallRating} · </span>
                        <span className="reserve-reviews">{reservation?.reviews.length} reviews</span>
                    </div>
                </div>
            </div>
            <div className='reservation-field'>
                <div className='calendar-title'>
                    <p>CHECK-IN</p>
                    <p>CHECKOUT</p>
                </div>
                <ReservationCalendar
                    startDate={startDate}
                    setStartDate={setStartDate}
                    endDate={endDate}
                    setEndDate={setEndDate}
                    // isDateBlocked={isDateBlocked}
                />
                <div className='num-guests'>
                    <div className='guest-count'>Guests</div>
                    <div className='num-guests-handler'>
                        <button className="guest-button" onClick={handleDecrement}>-</button>
                        <div className='guest-count' >{numGuests}</div>
                        <button className="guest-button"  onClick={handleIncrement}>+</button>
                    </div>
                </div>
            </div>
            <button className='user-button' onClick={handleSubmit}>Update Reservation</button>
            {dateError && <p className='login-text'>{dateError}</p>}
            {showLogin && <p className='login-text'>You must be logged in to reserve</p>}
            <ul>
            {reservationErrors.map(error => <li key={error}>{error}</li>)}
            </ul>
            <p className='button-text'>You won't be charged yet</p>
            <div className="pricing-container">
                <div className='price-calculator'>
                    <div className="pricing-item-container">
                        <div className="price-text">${reservation?.price} x {numNights} {numNights === 1 ? "night" : "nights"}</div>
                        <div className="price-value">${rawPrice}</div>
                    </div>
                    <div className="pricing-item-container">
                        <div className="price-text">Cleaning fee</div>
                        <div className="price-value">${reservation?.cleaningFee}</div>
                    </div>
                    <div className="pricing-item-container">
                        <div className="price-text">Clonebnb service fee</div>
                        <div className="price-value">${serviceFee}</div>
                    </div>
                </div>
                <div className="pricing-total-container">
                    <div className="price-total-text">Total before taxes</div>
                    <div className="price-total-value">${totalPrice}</div>
                </div>
            </div>
        </div>
    )
}

export default UpdateReservationForm;