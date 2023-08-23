import { shallowEqual, useDispatch, useSelector } from "react-redux"
import { fetchReservations, getReservations } from "../../store/reservationsReducer";
import { useEffect } from "react";
import './ReservationsIndex.css'
import ReservationsIndexItem from "./ReservationsIndexItem";
import moment from "moment";


const ReservationsIndex = ({ reservations }) => {
    const dispatch = useDispatch();
    // const reservations = useSelector(getReservations, shallowEqual)

    const currentDate = moment()

    const pastTrips = reservations.filter(reservation => (
        moment(reservation.endDate).isBefore(currentDate)
    ))
    const currentTrips = reservations.filter(reservation => {
        return moment(reservation.startDate).isSameOrBefore(currentDate) && moment(reservation.endDate).isSameOrAfter(currentDate);
    });
    const futureTrips = reservations.filter(reservation => (
        moment(reservation.startDate).isAfter(currentDate)
    ));

    return(
        <div>
            {currentTrips &&(
                <div className='current-trip'>
                    <h1 className='trip-title'>Where you are</h1>
                    <div className="reservations-index">
                        {currentTrips.map(reservation => 
                            <ReservationsIndexItem key={reservation.id} reservation={reservation} />                    
                        )}
                    </div>
                </div>
            )}
            <h1 className='trip-title'>Where you're going</h1>
            <div className="reservations-index">
                {futureTrips.map(reservation => 
                    <ReservationsIndexItem key={reservation.id} reservation={reservation} />
                    )}
            </div>
            <h1 className='trip-title'>Where you've been</h1>
            <div className="reservations-index">
                {pastTrips.map(reservation => 
                    <ReservationsIndexItem key={reservation.id} reservation={reservation} />                    
                )}
            </div>
        </div>
    )
}

export default ReservationsIndex;