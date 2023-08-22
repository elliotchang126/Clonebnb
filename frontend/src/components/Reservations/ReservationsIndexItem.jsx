import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux"
import { fetchListing, getListing } from "../../store/listingsReducer";
import { deleteReservation, fetchReservation } from "../../store/reservationsReducer";
import './ReservationsIndexItem.css'
import UpdateReservationForm from "./ReservationForm/UpdateReservationForm";

const ReservationsIndexItem = ({ reservation }) => {
    const dispatch = useDispatch();
    const listingId = reservation?.listingId;
    const listing = useSelector(getListing(listingId))
    const [showUpdate, setShowUpdate] = useState(false)
    const [reservationId, setReservationId] = useState(reservation?.id)
    const [refresh, setRefresh] = useState(false)

    const formatDate = (dateString) => {
        const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        const date = new Date(dateString)
        const month = months[date.getMonth()];
        const day = date.getDate() + 1;
        const year = date.getFullYear();

        return `${month} ${day}, ${year}`
    }

    const toggleUpdate = () => {
        setShowUpdate(!showUpdate)
    }

    const handleCancel = () => {
        dispatch(deleteReservation(reservation?.id))
    }

    useEffect(() => {
        dispatch(fetchReservation(reservation?.id))
    }, [dispatch, refresh])

    return(
        <div className='reservation-container'>
            <div className="reservation-listing-container">
                <div className="res-listing-img-container">
                    <img className='res-listing-img'
                        src={reservation?.photoUrl} 
                        alt ={`res-${reservation?.id}-${1}`}/>
                </div>
                <div className="reservation-info">
                    <div className='reservation-city'>{reservation?.city}, {reservation?.state}</div>
                    <div className='reservation-dates'>{formatDate(reservation?.startDate)} - {formatDate(reservation?.endDate)}</div>
                </div>
            </div>
            <div className="buttons-container">
                <button className="update-res-button" onClick={toggleUpdate}>Update Reservation</button>
                <button className="cancel-res-button"onClick={handleCancel}>Cancel Reservation</button>
            </div>
            {showUpdate && 
                <UpdateReservationForm 
                    reservation={reservation} 
                    listing={listing} 
                    reservationId={reservationId}
                    setShowUpdate={setShowUpdate}
                    setRefresh={setRefresh}
                    />}
        </div>
    )
}

export default ReservationsIndexItem;