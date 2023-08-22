import { Wrapper } from '@googlemaps/react-wrapper';
import ListingMap from './ListingMap';

import './MapWrapper.css'


const MapWrapper = ({ listing }) => {


    return (
        <Wrapper apiKey={process.env.REACT_APP_MAPS_API_KEY} >
            <ListingMap listing={listing} />
        </Wrapper>
    )
}

export default MapWrapper;