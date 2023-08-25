import { shallowEqual, useDispatch, useSelector } from 'react-redux';
import ListingIndexItem from '../ListingIndexItem/ListingIndexItem';
import ListingTypes from '../ListingTypes/ListingType';
import './ListingIndex.css'
import { fetchListings, getListings } from '../../store/listingsReducer';
import { useEffect } from 'react';

const ListingIndex = () => {
    const dispatch = useDispatch();
    const listings = useSelector(getListings,shallowEqual);
    const listingErrors = useSelector(state => state.errors.listings)

    useEffect(() => {
        dispatch(fetchListings())
    }, [dispatch])

    // const handleRender = () => {

    //     if(listingErrors){
    //         return listingErrors
    //     }else{
    //         return listings.map(listing => {

    //            return <ListingIndexItem key={listing.id} listing={listing}/>
    //         })
            
    //     }
        // const test =  listingErrors ? listingErrors : listings.map(listing =>
        //     <ListingIndexItem key={listing.id} listing={listing}/>)
        //     return test
    // }

    return (
        <div>
            <div>
                <ListingTypes />
            </div>
            <div className='listing-index'>
                {listingErrors && ( 
                    <div className='listing-errors' >{listingErrors}</div>
                )}
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