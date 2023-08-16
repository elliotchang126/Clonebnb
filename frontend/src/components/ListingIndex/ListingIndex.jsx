import { useDispatch, useSelector } from 'react-redux';
import ListingIndexItem from '../ListingIndexItem/ListingIndexItem';
import ListingTypes from '../ListingTypes/ListingType';
import './ListingIndex.css'
import { fetchListings, getListings } from '../../store/listingsReducer';
import { useEffect } from 'react';

const ListingIndex = () => {
    const dispatch = useDispatch();
    const listings = useSelector(getListings);

    useEffect(() => {
        dispatch(fetchListings())
    }, [dispatch])

    return (
        <div>
            <div>
                <ListingTypes />
            </div>
            <div className='listing-index'>
            {listings.map(listing =>
                <ListingIndexItem key={listing.id} listing={listing}/>
            )}
                {/* <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem />
                <ListingIndexItem /> */}
            </div>
        </div>
    )
}

export default ListingIndex;