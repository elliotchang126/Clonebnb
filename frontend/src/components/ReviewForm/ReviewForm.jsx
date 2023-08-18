import { useDispatch, useSelector } from "react-redux"
import { useState, useEffect } from "react";
import { useParams } from "react-router-dom/cjs/react-router-dom";
import { createReview } from "../../store/reviewsReducer";
import './ReviewForm.css'
import { IoIosStar } from 'react-icons/io'
import handleMouseover from "../../util/buttonUtil";

const ReviewForm = (props) => {
    const {setShowModal} = props
    const dispatch = useDispatch();
    const { listingId } = useParams();
    const [formData, setFormData] = useState({
        listing_id: listingId,
        // userId: userId,
        cleanliness: null,
        communication: null,
        check_in: null,
        accuracy: null,
        location: null,
        value: null,
        body: ''
    })
    const reviewErrors = useSelector(state => state.errors.reviews)

    const [hoverRating, setHoverRating] = useState({rating: '', num: 0})

    useEffect(() => {
        const button = document.querySelector('.user-button')
         button.addEventListener('mousemove', handleMouseover);

        return () => button.removeEventListener('mousemove', handleMouseover);
    }, [])

    const ratings = ['cleanliness', 'communication', 'check_in', 'accuracy', 'location', 'value']
    const ratingTitles = ['Cleanliness', 'Communication', 'Check-In', 'Accuracy', 'Location', 'Value']

    const handleChange = e => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }))
    }

    const handleSubmit = e => {
        e.preventDefault();
        console.log(formData);
        dispatch(createReview(formData));
        setShowModal(false);
    }

    return(
        // <div className="review-container">
            <form className='review-form' onSubmit={handleSubmit} >
                <h2 className="form-header">Write a New Review</h2>
                <div className="form-radio-container">
                    {ratings.map((rating, idx) =>(
                        <div className= 'form-radio-container' key ={rating}>
                            <fieldset>
                                <legend className='rating-title'>{ratingTitles[idx]}
                                    <br />
                                    {[1, 2, 3, 4, 5].map(num => (
                                        <label 
                                        className='radio-buttons'
                                        htmlFor={`${rating}-${num}`}
                                        key={`radio-${rating}-${num}`}
                                        onMouseEnter={() => setHoverRating({rating, num})}
                                        onMouseLeave={() => setHoverRating({rating: '', num: 0})}
                                        >
                                        <input type="radio"
                                            id={`${rating}-${num}`}
                                            className='rating-input'
                                            name={`${rating}`}
                                            value={num}
                                            onChange={handleChange}
                                            />
                                        <IoIosStar className={hoverRating.rating === rating ?
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
                    {/* { reviewErrors ? (reviewErrors.map(error => (<div>{error}</div>))) : <></> } */}
                </div>
                <h2 className='body-header'>Write a Public Review</h2>
                <h3 className='body-instructions'>Tell the next guests what you loved and anything else they should know about this place.</h3>
                <textarea
                    type='text'
                    className="input-body"
                    name='body'
                    value={formData.body}
                    onChange={handleChange}
                    placeholder="Write a public review"
                    />
                <button className='user-button'>Submit Your Review</button>
            </form>
        // </div>
    )
}

export default ReviewForm;