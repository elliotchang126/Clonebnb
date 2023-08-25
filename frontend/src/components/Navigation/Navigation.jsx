import { useDispatch, useSelector } from "react-redux"
import { NavLink } from "react-router-dom";
import ProfileButton from "./ProfileButton";
import logo from '../../assets/airbnb_logo.svg'
import clonebnb from '../../assets/Clonebnb.png'
import UserFormModal from "../UserForm";
import './Navigation.css'
import { useMemo, useState } from "react";
import { fetchListings } from "../../store/listingsReducer";
import { useLocation } from "react-router-dom/cjs/react-router-dom";

const Navigation = () => {
    let location = useLocation();
    const dispatch = useDispatch();
    const user = useSelector(state => state.session.user);
    // const [search, setSearch] = useState({})
    const [searchParams, setSearchParams] = useState({
        search: ''
    })

    const handleHome = (e) => {
        e.preventDefault();
        window.location.href = '/';
    }

    let sessionLinks = (
            <ProfileButton user={user}/>
        )

    const handleSearch = e => {
        e.preventDefault()
    }

    const defineDebounceBehavior = () => {
        let timeout;

        return function fn(params) {
            if (timeout) {clearTimeout(timeout)}

            timeout = setTimeout(() => {
                dispatch(fetchListings(params))
            }, 250)
            return fn
        }
    }

    const debouncedSearch = useMemo(() => defineDebounceBehavior(), [])

    const handleInputChange = field => async e => {
        const newParams = { ...searchParams, [field]: e.target.value}
        debouncedSearch(newParams)
        await setSearchParams(prev => ({ ...prev, [field]: e.target.value }))
    }

    return (
        <div className='navbar'>
            <div className='home-logo'>
                <NavLink exact to='/' onClick={handleHome}><img className='site-logo' src={clonebnb} alt='site-logo'/></NavLink> 
            </div>
            <div className='searchbar-container'>
            {location.pathname === "/" && <form className='search-form' onSubmit={handleSearch}>
                    <input
                        className='searchbar'
                        type='text'
                        value={searchParams.search || ''}
                        placeholder='Search your destination'
                        onChange={handleInputChange('search')}
                    />
                    <button className='search-button'><i className="fa-solid fa-magnifying-glass" style={{color: "#ffffff",}} ></i></button>
                </form>}
            </div>
            <div className='navbar-user'>
                {sessionLinks}
            </div>
        </div>
    )
}

export default Navigation