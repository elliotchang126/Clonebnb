import { useDispatch, useSelector } from "react-redux"
import { NavLink } from "react-router-dom";
import ProfileButton from "./ProfileButton";
import logo from '../../assets/airbnb_logo.svg'
import UserFormModal from "../UserForm";
import './Navigation.css'
import { useMemo, useState } from "react";
import { fetchListings } from "../../store/listingsReducer";

const Navigation = () => {
    const dispatch = useDispatch()
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
    // } else {
    //     sessionLinks = (
    //         <>
    //             <UserFormModal />
    //             {/* <NavLink to='/login'>Login</NavLink>
    //             <NavLink to='/signup'>Signup</NavLink> */}
    //         </>
    //     );
    // }

    const handleSearch = e => {
        e.preventDefault()
        // dispatch(fetchListings(searchParams))
        // setSearchParams({search:''})
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
                {/* <NavLink exact to='/'><i className="fa-solid fa-house-chimney-user" style={{color: "#ff5a5f"}}></i></NavLink>  */}
                <NavLink exact to='/' onClick={handleHome}><img className='site-logo' src={logo} alt='site-logo'/></NavLink> 
                {/* Placeholder Image */}
            </div>
            <div className='searchbar-container'>
                <form className='search-form' onSubmit={handleSearch}>
                    <input
                        className='searchbar'
                        type='text'
                        value={searchParams.search || ''}
                        placeholder='Search your destination'
                        onChange={handleInputChange('search')}
                    />
                    <button className='search-button'><i className="fa-solid fa-magnifying-glass" style={{color: "#ffffff",}} ></i></button>
                </form>
            </div>
            <div className='navbar-user'>
                {sessionLinks}
            </div>
        </div>
    )
}

export default Navigation
// return (
//     <>
//         <ul>
//             <NavLink to='/'>Home</NavLink>{' '}
//             <NavLink to='/login'>Login</NavLink>{' '}
//             <NavLink to='/signup'>Signup</NavLink>
//         </ul>
//     </>
// )