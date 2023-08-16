import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom'
import './ListingShow.css'
import { fetchListing, getListing } from '../../store/listingsReducer';
import { useEffect } from 'react';

const ListingShow = () => {
    const dispatch = useDispatch();
    const { listingId } = useParams();

    const listing = useSelector(getListing(listingId))

    useEffect(() => {
        dispatch(fetchListing(listingId))
    }, [dispatch, listingId])

    return(
        <div className='show-container'>
            <div className='show-header'>
                <div className="show-title">{listing?.title}</div>
                <div className="show-subtitle">
                    <span className="show-rating">&#9733; 5.0 · </span>
                    <span className="show-reviews-total">20 reviews · </span>
                    <span className='show-location'>
                        {listing?.city}, {listing?.state}, {listing?.country}
                    </span>
                </div>
            </div>
            <div className="show-images-container">
                <div className="show-images-left">
                    <div className="image-wrapper-left">
                        <img className='listing-image-left'
                            key={`show-${listing?.id}-${1}`}
                            src={listing?.photoUrls[0]} 
                            alt ={`show-${listing?.id}-${1}`}/>
                    </div>
                </div>
                <div className="show-images-right">
                    {listing?.photoUrls.slice(1).map( (photo, i) => 
                    <div className="image-wrapper-right">
                        <img className='listing-image-right'
                            key={`show-${listing?.id}-${i + 1}`}
                            src={photo} 
                            alt ={`show-${listing?.id}-${i + 1}`}/>
                    </div>
                    )}
                </div>
            </div>
            <div className="show-details">
                <p className="show-description">
                    {listing?.description}
                </p>
            </div>
            <div className="show-reviews">

            </div>
            <div className="show-map">

            </div>
        </div>
    )
}

export default ListingShow;