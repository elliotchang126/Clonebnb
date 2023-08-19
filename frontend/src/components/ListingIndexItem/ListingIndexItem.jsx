import { useHistory } from 'react-router-dom/cjs/react-router-dom'
import './ListingIndexItem.css'

const ListingIndexItem = ({ listing }) => {
        const history = useHistory()

    const handleClick = () => {
        history.push(`listings/${listing?.id}`)
    }

    return (
        <div className='listing-index-item' onClick={handleClick}>
            <div className='listing-item-images'>
                {listing?.photoUrls.map( (photo, i) => 
                    <img className='listing-image'
                        key={`listing-${listing?.id}-${i + 1}`}
                        src={photo} 
                        alt ={`listing-${listing?.id}-${i + 1}`}/>
                    )}
            </div>
            <div className='listing-item-main'>
                <div className='listing-item-location'>{listing?.city}, {listing?.state}</div>
                <div className='listing-item-rating'>&#9733; {listing?.overallRating}</div>
            </div>
            <div className='listing-item-title'>{listing?.title}</div>
            <div className='listing-item-price'><span>${listing?.price} </span>night</div>
        </div>
    )
}

export default ListingIndexItem;
