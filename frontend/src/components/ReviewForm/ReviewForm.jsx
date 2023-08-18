import { useDispatch } from "react-redux"
import { useState, useEffect } from "react";
import { useParams } from "react-router-dom/cjs/react-router-dom";
import { createReview } from "../../store/reviewsReducer";
import { FaStar } from 'react-icons/fa'
import './ReviewForm.css'


const ReviewForm = ({ listing }) => {
    const dispatch = useDispatch();
    // const { listingId } = useParams();
    const [formData, setFormData] = useState({
        cleanliness: null,
        communication: null,
        checkIn: null,
        accuracy: null,
        location: null,
        value: null,
        body: ''
    })

    const [hoverRating, setHoverRating] = useState({rating: '', num: 0})

    useEffect(() => {
        const button = document.querySelector('.user-button')

        const handleMouseover = e => {
            const rect = e.target.getBoundingClientRect();
            const x = (e.clientX - rect.left) * 100 / e.target.clientWidth;
            const y = (e.clientY - rect.top) * 100 / e.target.clientHeight;
            
            e.target.style.setProperty('--mouse-x', x)
            e.target.style.setProperty('--mouse-y', y)
        }
         button.addEventListener('mousemove', handleMouseover);

        return () => button.removeEventListener('mousemove', handleMouseover);
    }, [])

    const ratings = ['cleanliness', 'communication', 'checkIn', 'accuracy', 'location', 'value']
    const ratingTitles = ['Cleanliness', 'Communication', 'Check-In', 'Accuracy', 'Location', 'Value']

    const handleChange = e => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }))
    }

    const handleSubmit = e => {
        e.preventDefault();
        dispatch(createReview(formData))
    }

    return(
        <div className="review-container">
            <form className='review-form' onSubmit={handleSubmit}>
                <h2 className="form-header">Write a New Review</h2>
                {ratings.map((rating, idx) =>(
                    <div key ={rating}>
                        <fieldset>
                            <legend>{ratingTitles[idx]}
                                <br />
                                {[1, 2, 3, 4, 5].map(num => (
                                    <label 
                                        htmlFor={`${rating}-${num}`}
                                        key={`radio-${rating}-${num}`}
                                        onMouseEnter={() => setHoverRating({rating, num})}
                                        onMouseLeave={() => setHoverRating({rating: '', num: 0})}
                                    >{num}
                                    <input type="radio"
                                        id={`${rating}-${num}`}
                                        className='rating-input'
                                        name={`${rating}`}
                                        value={num}
                                        onChange={handleChange}
                                    />
                                    <FaStar className={hoverRating.rating === rating ?
                                        (num <= hoverRating.num ? 'hovered' : 'empty') :
                                        (num <= formData[rating] ? 'selected' : 'empty')
                                    }
                                    />
                                    </label>
                                    ))}
                            </legend>
                        </fieldset>
                    </div> 
                ))}
                <h2>Write a Public Review</h2>
                <h3>Tell the next guests what you loved and anything else they should know about this place</h3>
                <input
                    type='text'
                    className="input-body"
                    name='body'
                    value={formData.body}
                    onChange={handleChange}
                    placeholder="Write a public review"
                    />
                <button className='user-button'>Submit Your Review</button>
            </form>
        </div>
    )
}

export default ReviewForm;