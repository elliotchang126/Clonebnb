import { useEffect, useState } from 'react'
import moment from 'moment'
import './ReservationForm.css'
import ReservationCalendar from '../ReservationCalendar/ReservationCalendar'
import { useDispatch, useSelector } from 'react-redux'
import { createReservation } from '../../../store/reservationsReducer'

const ReservationForm = ({ listing, reviews }) => {
    const dispatch = useDispatch();
    const user = useSelector(state => state.session.user)
    const [startDate, setStartDate] = useState(null);
    const [endDate, setEndDate] = useState(null);
    // const [focusedInput, setFocusedInput] = useState(null);
    const [numGuests, setNumGuests] = useState(1);
    const [numNights, setNumNights] = useState(0);
    const [rawPrice, setRawPrice] = useState(0);
    const [totalPrice, setTotalPrice] = useState(0);
    const [serviceFee, setServiceFee] = useState(0)
    const [showLogin, setShowLogin] = useState(false);

    const blockedDates = [];

    listing?.reservations?.forEach(reservation => {
        let resDate = moment(reservation?.startDate);
        let resEndDate = moment(reservation?.endDate)

        while (resDate <= resEndDate) {
            blockedDates.push(resDate.format('YYYY-MM-DD'))
            resDate = resDate.add(1, 'days')
        }
    })

    const isDateBlocked = date => {
        const dateToCheck = moment(date).format('YYYY-MM-DD')
        return blockedDates.includes(dateToCheck)
    }

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
            
            const price = listing?.price * nights
            const fee = Math.round(((price + listing?.cleaningFee) * 0.08))
            setRawPrice(price)
            setServiceFee(fee)
            setTotalPrice(price + listing?.cleaningFee + fee)
        }
    }, [startDate, endDate, listing?.cleaningFee, listing?.price])

    const handleSubmit = () => {
        if (!user) {
            setShowLogin(true);
            return;
        }
        setShowLogin(false)

        const reservation = {
            listing_id: listing.id,
            start_date: startDate.format("YYYY-MM-DD"),
            end_date: endDate.format("YYYY-MM-DD"),
            num_guests: numGuests
        }
        dispatch(createReservation(reservation))
    }

    return (
        <div className='reservation-container'>
            <div className='listing-info'>
                <div className="reservation-price">
                    <span className="reservation-price-night">${listing?.price}</span> night
                </div>
                <div className="reservation-listing-info">
                    <div>
                        <span className="reserve-reviews-avg">&#9733; {listing?.overallRating} · </span>
                        <span className="reserve-reviews">{reviews?.length} reviews</span>
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
                    isDateBlocked={isDateBlocked}
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
            <button className='user-button' onClick={handleSubmit}>Reserve</button>
            {showLogin && <p className='login-text'>You must be logged in to reserve</p>}
            <p className='button-text'>You won't be charged yet</p>
            <div className="pricing-container">
                <div className='price-calculator'>
                    <div className="pricing-item-container">
                        <div className="price-text">${listing?.price} x {numNights} {numNights === 1 ? "night" : "nights"}</div>
                        <div className="price-value">${rawPrice}</div>
                    </div>
                    <div className="pricing-item-container">
                        <div className="price-text">Cleaning fee</div>
                        <div className="price-value">${listing?.cleaningFee}</div>
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

export default ReservationForm