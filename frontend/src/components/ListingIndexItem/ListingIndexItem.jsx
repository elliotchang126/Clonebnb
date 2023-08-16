import './ListingIndexItem.css'

const ListingIndexItem = ({ listing }) => {
    return (
        <div className='listing-index-item'>
            <div className='listing-item-images'>
                {listing.photoUrls.map( (photo, i) => 
                    <img className='listing-image'
                        key={`listing-${listing.id}-${i + 1}`}
                        src={photo} 
                        alt ={`listing-${listing.id}-${i + 1}`}/>
                    )}
            </div>
            <div className='listing-item-main'>
                <div className='listing-item-location'>{listing.city}, {listing.state}</div>
                <div className='listing-item-rating'>&#9733; 5.0</div>
            </div>
            <div className='listing-item-title'>{listing.title}</div>
            <div className='listing-item-price'><span>${listing.price} </span>night</div>
        </div>
    )
}

export default ListingIndexItem;
