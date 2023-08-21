import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux"
import { fetchListing, getListing } from "../../store/listingsReducer";
import { deleteReservation } from "../../store/reservationsReducer";

const ReservationsIndexItem = ({ reservation }) => {
    const dispatch = useDispatch();
    const listingId = reservation.listingId;
    const listing = useSelector(getListing(listingId))
    const [showUpdate, setShowUpdate] = useState(false)

    const toggleUpdate = () => {
        setShowUpdate(!showUpdate)
    }

    const handleDelete = () => {
        dispatch(deleteReservation(reservation.id))
    }

    useEffect(() => {
        dispatch(fetchListing(listingId))
    }, [dispatch, listingId])

    return(
        <></>
    )
}

export default ReservationsIndexItem;