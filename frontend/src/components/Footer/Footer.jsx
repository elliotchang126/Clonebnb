import github from '../../assets/github-mark.png';
import linkedin from '../../assets/linkedin.png';
import './Footer.css'


const Footer = () => {
    return (
        <div className='footer-container'>
            <div className='footer-text'>
                &copy; 2023 Clonebnb, Inc.
            </div>
            <div className="social-links">
                <a href="https://github.com/elliotchang126/Clonebnb" target='_blank' >
                    <img src={github} alt="github" className='social-icon'/>
                </a>
                <a href="https://www.linkedin.com/in/elliotchang126/" target='_blank' >
                    <img src={linkedin} alt="linkedin" className='social-icon'/>
                </a>
            </div>
        </div>
    )
}

export default Footer;