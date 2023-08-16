import './ListingIndexItem.css'

const ListingIndexItem = () => {
    return (
        <div className='listing-index-item'>
            <div className='listing-item-images'></div>
            <div className='listing-item-main'>
                <div className='listing-item-location'>City, State</div>
                <div className='listing-item-rating'>&#9733; 5.0</div>
            </div>
            <div className='listing-item-title'>listing.title</div>
            <div className='listing-item-price'><span>$495 </span>night</div>
        </div>
    )
}

export default ListingIndexItem;
