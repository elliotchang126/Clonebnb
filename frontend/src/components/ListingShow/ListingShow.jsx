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

const ListingShow = (props) => {
    const dispatch = useDispatch();
    const { listingId } = useParams();
    const user = useSelector(state => state.session.user)
    const listing = useSelector(getListing(listingId))
    const userId = listing?.userId
    const host = useSelector(getUser(userId))
    const [showModal, setShowModal] = useState(false)


    const openModal = e => {
        // debugger
        if (showModal) return;
        e.stopPropagation();
        setShowModal(true)
    }

    useEffect(() => {
        // debugger
        if (showModal) return;

        const closeModal = () => {
            setShowModal(false)
        }
        document.addEventListener('click', closeModal)
        return () => document.removeEventListener('click', closeModal)
    }, [showModal])

    useEffect(() => {
        if (listingId) {
            dispatch(fetchListing(listingId))
        }
    }, [dispatch, listingId])

    useEffect(() => {
        if (userId) {
            dispatch(fetchUser(userId))
        }
    }, [dispatch, userId])

    return(
        <div className='show-container'>
            <div className='show-header'>
                <div className="show-title">{listing?.title}</div>
                <div className="show-subtitle">
                    <span className="show-rating">&#9733; 5.0</span>{' · '}
                    <span className="show-reviews-total">20 reviews</span>{' · '}
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
                <div className="show-details-header">
                    <div className='house-info'>
                        <div className='house-host'>
                            House hosted by {host?.firstName}
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
                <div className='show-calendar-container'>
                    <div className="show-calendar"></div>
                    <div className="new-review-container">
                        <button onClick={e => openModal(e)}>
                            Review Listing
                        </button>
                    </div>
                </div>
            </div>
            <div className="show-reviews">
                <ReviewsIndex />
            </div>
            <div className="show-map">

            </div>
            {showModal && (
                user ? (
                    <Modal onClose={() => setShowModal(false)}>
                        <ReviewForm setShowModal={setShowModal}/>
                    </Modal>
                ) :
                <div>Sorry, must be logged in to leave a review.</div>
            )}
        </div>
    )
}

export default ListingShow;