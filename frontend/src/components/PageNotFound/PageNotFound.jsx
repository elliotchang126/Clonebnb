import notFound from '../../assets/pageNotFound.gif'
import './PageNotFound.css'

const PageNotFound = () => {
    return(
        <div className='not-found'>
            <div className="not-found-text">
                <h1 className='not-found-title'>404</h1>
                <h2 className='not-found-subtitle'>We can't seem to find the page you're looking for!</h2>
            </div>
            <div className='not-found-image'>
                <img src={notFound} alt='not-found-gif' />
            </div>
        </div>
    )
}

export default PageNotFound;