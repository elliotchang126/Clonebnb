import { useEffect, useRef, useState } from 'react';
import { Wrapper } from '@googlemaps/react-wrapper';
import './ListingMap.css'
import houseIcon from '../../assets/house-solid.svg'

const ListingMap = ({ listing }) => {
    const [map, setMap] = useState(null);
    const [marker, setMarker] = useState(null);
    const mapRef = useRef(null);
    const lat = parseFloat(listing?.latitude)
    const lng = parseFloat(listing?.longitude)

    useEffect(() => {
        if (!map) {
            const mapOptions = {
                zoom: 15,
                center: {lat: lat, lng: lng}
            }
            
            const newMap = new window.google.maps.Map(mapRef.current, mapOptions);
            setMap(newMap);
        }
    }, [map, listing])
    
    const icon = {
        url: houseIcon,
        scaledSize: new window.google.maps.Size(80, 80),
        anchor: new window.google.maps.Point(40, 40)

    }

    useEffect(() => {
        if (map && !marker) {
            const newMarker = new window.google.maps.Marker({
                position: new window.google.maps.LatLng(lat, lng),
                map: map,
                // zIndex: 10
                icon: icon
            })

            const circle = new window.google.maps.Circle({
                center: newMarker.getPosition(),
                radius: 500,
                map: map,
                fillColor: '#FF5A5F',
                fillOpacity: 0.4,
                strokeWeight: 0
            })
            setMarker(newMarker)
        }
    }, [marker, map, lat, lng])
    

    return(
        <div className='map' ref={mapRef} >
            Map
        </div>
    )
}

const ListingMapWrapper = ({ listing }) => {
    return (
        <Wrapper apiKey={process.env.REACT_APP_MAPS_API_KEY}>
            <ListingMap listing={listing} />
        </Wrapper>
    )
}

export default ListingMapWrapper;