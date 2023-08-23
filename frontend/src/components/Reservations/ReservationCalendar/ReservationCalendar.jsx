import 'react-dates/initialize'
import { DateRangePicker } from 'react-dates'
import 'react-dates/lib/css/_datepicker.css'
import { useState } from 'react'
import './ReservationCalendar.css'

const ReservationCalendar = ({ startDate, setStartDate, endDate, setEndDate }) => {
    // const [startDate, setStartDate] = useState(null)
    // const [endDate, setEndDate] = useState(null)
    const [focusedInput, setFocusedInput] = useState(null)

    return(
        <DateRangePicker
            startDate = {startDate}
            startDateId = 'check-in-date'
            endDate = {endDate}
            endDateId = 'check-out-date'
            onDatesChange={ ({ startDate, endDate }) => {
                setStartDate(startDate)
                setEndDate(endDate)
                }}
            // isDayBlocked
            focusedInput={focusedInput}
            onFocusChange={focusedInput => setFocusedInput(focusedInput)}
            numberOfMonths={2}
        />
    )
}

export default ReservationCalendar;