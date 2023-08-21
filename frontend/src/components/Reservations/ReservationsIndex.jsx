import { shallowEqual, useDispatch, useSelector } from "react-redux"
import { fetchReservations, getReservations } from "../../store/reservationsReducer";
import { useEffect } from "react";
import './ReservationsIndex.css'
import ReservationsIndexItem from "./ReservationsIndexItem";


const ReservationsIndex = ({ reservations }) => {
    const dispatch = useDispatch();
    // const reservations = useSelector(getReservations, shallowEqual)

    return(
        <div className="reservations-index">
            {reservations.map(reservation => 
                <ReservationsIndexItem key={reservation.id} reservation={reservation} />
                )}
        </div>
    )
}

export default ReservationsIndex;