import ListingIndexItem from '../ListingIndexItem/ListingIndexItem';
import ListingTypes from '../ListingTypes/ListingType';
import './ListingIndex.css'

const ListingIndex = () => {
    return (
        <div>
            <div>
                <ListingTypes />
            </div>
            <div className='listing-index'>
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
            </div>
        </div>
    )
}

export default ListingIndex;