import './ReviewProgressBar.css'

const ProgressBar = ({ label, averageValue }) => {
    return (
        <div className="progress-bar-container">
            <label htmlFor="">{label}</label>
            <div className="progress-bar-background">
                <div className="progress-bar" style={{width: `${averageValue * 20}%`}}></div>
            </div>
            <div className='rating-text'>{averageValue}</div>
        </div>
    )
}

const ReviewProgressbar = ({ listing }) => {
    return (
        <div className="ratings-container">
            <ProgressBar label='Cleanliness' averageValue={listing?.averageCleanliness} />
            <ProgressBar label='Communication' averageValue={listing?.averageCommunication} />
            <ProgressBar label='Check-in' averageValue={listing?.averageCheckIn} />
            <ProgressBar label='Accuracy' averageValue={listing?.averageAccuracy} />
            <ProgressBar label='Location' averageValue={listing?.averageLocation} />
            <ProgressBar label='Value' averageValue={listing?.averageValue} />
        </div>
    )
}

export default ReviewProgressbar