import { useEffect, useState } from 'react'
import './ReservationForm.css'
import ReservationCalendar from '../ReservationCalendar/ReservationCalendar'
import { useDispatch, useSelector } from 'react-redux'

const ReservationForm = ({ listing, reviews }) => {
    const dispatch = useDispatch();
    const user = useSelector(state => state.session.user)
    const [startDate, setStartDate] = useState(null);
    const [endDate, setEndDate] = useState(null);
    const [focusedInput, setFocusedInput] = useState(null);
    const [numGuests, setNumGuests] = useState(1);
    const [numNights, setNumNights] = useState(0);
    const [rawPrice, setRawPrice] = useState(0);
    const [totalPrice, setTotalPrice] = useState(0);
    const [serviceFee, setServiceFee] = useState(0)

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


    return (
        <div className='reservation-container'>
            <div className='listing-info'>
                <div className="reservation-price">
                    <span className="reservation-price-night">{listing?.price}</span> night
                </div>
                <div className="reservation-listing-info">
                    <div>
                        <span className="reserve-reviews-avg">{listing?.overallRating}</span>{' · '}
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
            <button className='user-button'>Reserve</button>
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