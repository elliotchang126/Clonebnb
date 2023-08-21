import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux"
import { fetchListing, getListing } from "../../store/listingsReducer";
import { deleteReservation } from "../../store/reservationsReducer";

const ReservationsIndexItem = ({ reservation }) => {
    const dispatch = useDispatch();
    const listingId = reservation?.listingId;
    const listing = useSelector(getListing(listingId))
    const [showUpdate, setShowUpdate] = useState(false)

    const toggleUpdate = () => {
        setShowUpdate(!showUpdate)
    }

    const handleCancel = () => {
        dispatch(deleteReservation(reservation?.id))
    }

    useEffect(() => {
        dispatch(fetchListing(listingId))
    }, [dispatch, listingId])

    return(
        <div className='reservation-container'>
            <div className="reservation-listing-container">
                <div className="res-listing-img-container">
                    <img className='listing-image-left'
                        src={listing?.photoUrls[0]} 
                        alt ={`res-${listing?.id}-${1}`}/>
                </div>
                <div className="reservation-info">
                    <div>{listing?.city}</div>
                    <div>{reservation?.startDate} - {reservation?.endDate}</div>
                </div>
            </div>
            <div className="buttons-container">
                <button className="update-res-button" onClick={toggleUpdate}>Update</button>
                <button className="cancel-res-button"onClick={handleCancel}>Cancel</button>
            </div>
            {/* {setShowUpdate && } */}
        </div>
    )
}

export default ReservationsIndexItem;