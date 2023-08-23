import './ListingType.css'
import amazingPools from '../../assets/types/amazingpools.jpeg'
import amazingViews from '../../assets/types/amazingviews.jpeg'
import beachfront from '../../assets/types/beachfront.jpeg'
import cabin from '../../assets/types/cabin.jpeg'
import countryside from '../../assets/types/countryside.jpeg'
import design from '../../assets/types/design.jpeg'
import iconicPlaces from '../../assets/types/iconicplaces.jpeg'
import lakeside from '../../assets/types/lakeside.jpeg'
import mansion from '../../assets/types/mansions.jpeg'
import omg from '../../assets/types/omg.jpeg'
import { useDispatch } from 'react-redux'
import { fetchListingsByCategory } from '../../store/listingsReducer'
import { useState } from 'react'

const ListingTypes = () => {
    const dispatch = useDispatch();
    const [activeCategory, setActiveCategory] = useState();
    
    const handleFilter = category => () => {
        dispatch(fetchListingsByCategory(category))
        setActiveCategory(category);
    }

    return (
        <div className='types-bar'>
            <div className={`types-item ${activeCategory === 'amazing pools' ? 'active' : ''}`} 
                onClick={handleFilter('amazing pools')}>
                <img className='types-image' src={amazingPools} alt='amazing-pools' />
                <span className='types-name'>Amazing Pools</span>
            </div>
            <div className={`types-item ${activeCategory === 'amazing views' ? 'active' : ''}`} 
                onClick={handleFilter('amazing views')}>
                <img className='types-image' src={amazingViews} alt='amazing-views' />
                <span className='types-name'>Amazing Views</span>
            </div>
            <div className={`types-item ${activeCategory === 'beachfront' ? 'active' : ''}`} 
                onClick={handleFilter('beachfront')}>
                <img className='types-image' src={beachfront} alt='beachfront' />
                <span className='types-name'>Beachfront</span>
            </div>
            <div className={`types-item ${activeCategory === 'cabin' ? 'active' : ''}`} 
                onClick={handleFilter('cabin')}>
                <img className='types-image' src={cabin} alt='cabin' />
                <span className='types-name'>Cabin</span>
            </div>
            <div className={`types-item ${activeCategory === 'countryside' ? 'active' : ''}`} 
                onClick={handleFilter('countryside')}>
                <img className='types-image' src={countryside} alt='countryside' />
                <span className='types-name'>Countryside</span>
            </div>
            <div className={`types-item ${activeCategory === 'design' ? 'active' : ''}`} 
                onClick={handleFilter('design')}>
                <img className='types-image' src={design} alt='design' />
                <span className='types-name'>Design</span>
            </div>
            <div className={`types-item ${activeCategory === 'iconic cities' ? 'active' : ''}`} 
                onClick={handleFilter('iconic cities')}>
                <img className='types-image' src={iconicPlaces} alt='iconic-places' />
                <span className='types-name'>Iconic Places</span>
            </div>
            <div className={`types-item ${activeCategory === 'lakeside' ? 'active' : ''}`} 
                onClick={handleFilter('lakeside')}>
                <img className='types-image' src={lakeside} alt='lakeside' />
                <span className='types-name'>Lakeside</span>
            </div>
            <div className={`types-item ${activeCategory === 'mansions' ? 'active' : ''}`} 
                onClick={handleFilter('mansions')}>
                <img className='types-image' src={mansion} alt='mansion' />
                <span className='types-name'>Mansion</span>
            </div>
            <div className={`types-item ${activeCategory === 'omg' ? 'active' : ''}`} 
                onClick={handleFilter('omg')}>
                <img className='types-image' src={omg} alt='omg' />
                <span className='types-name'>OMG</span>
            </div>
        </div>
    )
}

export default ListingTypes;