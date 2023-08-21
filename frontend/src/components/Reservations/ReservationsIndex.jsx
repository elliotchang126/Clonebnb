import { useDispatch, useSelector } from "react-redux"
import { fetchReservations, getReservations } from "../../store/reservationsReducer";
import { useEffect } from "react";
import ReservationsIndexItem from "./ReservationsIndexItem";


const ReservationsIndex = () => {
    const dispatch = useDispatch();
    const reservations = useSelector(getReservations)

    useEffect(() => {
        dispatch(fetchReservations())
    }, [dispatch])

    return(

        <div className="reservations-index">
            {reservations.map(reservation => 
                <ReservationsIndexItem key={reservation.id} reservation={reservation} />
                )}
        </div>
    )
}

export default ReservationsIndex;