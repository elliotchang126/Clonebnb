import { shallowEqual, useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom'
import './ListingShow.css'
import { fetchListing, getListing } from '../../store/listingsReducer';
import { useEffect, useState } from 'react';
import { fetchUser, getUser } from '../../store/usersReducer';
import { BsPersonCircle } from 'react-icons/bs'
import { Modal } from "../../context/Modal";
import ReviewForm from '../ReviewForm/ReviewForm';
import ReviewsIndex from '../ReviewsIndex/ReviewsIndex'
import handleMouseover from '../../util/buttonUtil';
import { fetchReviews, getReviews } from '../../store/reviewsReducer';
import ReservationForm from '../Reservations/ReservationForm/ReservationForm';
// import MapWrapper from '../GoogleMaps/MapWrapper';
import ListingMapWrapper from '../GoogleMaps/ListingMap';

const ListingShow = (props) => {
    const dispatch = useDispatch();
    const { listingId } = useParams();
    const listing = useSelector(getListing(listingId))
    const reviews = useSelector(getReviews, shallowEqual);
    const user = useSelector(state => state.session.user)
    const userId = listing?.userId
    const host = useSelector(getUser(userId))
    const [showModal, setShowModal] = useState(false)
    
    useEffect(() => {
        if (listingId) {
            dispatch(fetchListing(listingId))
        }
    }, [dispatch, listingId])
    
    useEffect(() => {
        if (listing) {
            dispatch(fetchReviews)
        }
    }, [dispatch, listing])
    
    // useEffect(() => {
    //     if (userId) {
    //         dispatch(fetchUser(userId))
    //     }
    // }, [dispatch, userId])
    

    useEffect(() => {
        const button = document.querySelector('.user-button')
        button.addEventListener('mousemove', handleMouseover);

        return () => button.removeEventListener('mousemove', handleMouseover);
    }, [])

    const openModal = e => {
        if (showModal) return;
        e.stopPropagation();
        setShowModal(true) 
    }
 
    useEffect(() => {
        if (showModal) return;

        const closeModal = () => {
            setShowModal(false)
        }
        document.addEventListener('click', closeModal)
        return () => document.removeEventListener('click', closeModal)
    }, [showModal])

    return(
        <div className='show-container'>
            <div className='show-header'>
                <div className="show-title">{listing?.title}</div>
                <div className="show-subtitle">
                    <span className="show-rating">&#9733; {listing?.overallRating}</span>{' · '}
                    <span className="show-reviews-total">{reviews.length} reviews</span>{' · '}
                    <span className='show-location'>
                        {listing?.city}, {listing?.state}, {listing?.country}
                    </span>
                </div>
            </div>
            <div className="show-images-container">
                <div className="show-image-left"
                    key={`show-${listing?.id}-${1}`}>
                        <img className='listing-image-left'
                            src={listing?.photoUrls[0]} 
                            alt ={`show-${listing?.id}-${1}`}/>
                </div>
                <div className="show-images-right">
                    {listing?.photoUrls.slice(1).map( (photo, i) => 
                    <div className="image-wrapper-right"
                        key={`show-${listing?.id}-${i + 1}`}>
                        <img className='listing-image-right'
                            src={photo} 
                            alt ={`show-${listing?.id}-${i + 1}`}/>
                    </div>
                    )}
                </div>
            </div>
            <div className="show-details">
                <div>
                    <div className="show-details-header">
                        <div className='house-info'>
                            <div className='house-host'>
                                Entire home hosted by {listing?.host}
                            </div>
                            <div className='bed-bath-info'>
                                <span>
                                    {listing?.bedrooms > 1 ? `${listing?.bedrooms} bedrooms` : `${listing?.bedrooms} bedroom`}
                                </span>{' · '}
                                <span>
                                    {listing?.bathrooms > 1 ? `${listing?.bathrooms} baths` : `${listing?.bathrooms} bath`}
                                </span>
                            </div>
                        </div>
                        <BsPersonCircle className='profile-icon' />
                    </div>
                    <div className="show-description">
                        {listing?.description}
                    </div>
                </div>
                <div className='show-calendar-container'>
                    <div className="calendar-wrapper">
                        <div className="show-calendar">
                            <ReservationForm listing={listing} />
                        </div>
                    </div>
                        <div className="new-review-container">
                            <button className='user-button' onClick={e => openModal(e)}>
                                Review Listing
                            </button>
                        </div>
                    {showModal && (
                        user ? (
                            <Modal onClose={() => setShowModal(false)}>
                                <ReviewForm setShowModal={setShowModal}/>
                            </Modal>
                            ) :
                            <div className='must-login'>Sorry, must be logged in to leave a review.</div>
                    )}
                </div>
            </div>
            <div className="show-reviews">
                <ReviewsIndex listing={listing} />
            </div>
            <div className="show-map">
                <h1 className='show-map-title'>Where you'll be</h1>
                <ListingMapWrapper listing={listing}/>
                <div className="show-map-location">{listing?.city}, {listing?.state}, {listing?.country}</div>
            </div>
        </div>
    )
}

export default ListingShow;