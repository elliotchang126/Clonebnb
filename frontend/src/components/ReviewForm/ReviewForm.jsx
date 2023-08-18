import { useDispatch } from "react-redux"
import { useState } from "react";
import { useParams } from "react-router-dom/cjs/react-router-dom";
import { createReview } from "../../store/reviewsReducer";
import { FaStar } from 'react-icons/fa'
import './ReviewForm.css'


const ReviewForm = () => {
    const dispatch = useDispatch();
    const { listingId } = useParams();
    const [formData, setFormData] = useState({
        cleanliness: null,
        communication: null,
        checkIn: null,
        accuracy: null,
        location: null,
        value: null,
        body: ''
    })

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
        <form className='review-form' onSubmit={handleSubmit}>
            <h2 className="form-header">Write a New Review</h2>
            {ratings.map((rating, idx) =>(
                <div>
                    <fieldset>
                        <legend>{ratingTitles[idx]}
                            <br />
                            <label htmlFor={`${rating}-1`}>1
                                <input type="radio"
                                    id={`${rating}-1`}
                                    className='rating-input'
                                    name={`${rating}`}
                                    value={1}
                                    onChange={handleChange}
                                />
                                <FaStar />
                            </label>
                            <label htmlFor={`${rating}-1`}>2
                                <input type="radio"
                                    id={`${rating}-1`}
                                    className='rating-input'
                                    name={`${rating}`}
                                    value={2}
                                    onChange={handleChange}
                                />
                                <FaStar />
                            </label>
                            <label htmlFor={`${rating}-1`}>3
                                <input type="radio"
                                    id={`${rating}-1`}
                                    className='rating-input'
                                    name={`${rating}`}
                                    value={3}
                                    onChange={handleChange}
                                />
                                <FaStar />
                            </label>
                            <label htmlFor={`${rating}-1`}>4
                                <input type="radio"
                                    id={`${rating}-1`}
                                    className='rating-input'
                                    name={`${rating}`}
                                    value={4}
                                    onChange={handleChange}
                                />
                                <FaStar />
                            </label>
                            <label htmlFor={`${rating}-1`}>5
                                <input type="radio"
                                    id={`${rating}-1`}
                                    className='rating-input'
                                    name={`${rating}`}
                                    value={5}
                                    onChange={handleChange}
                                />
                                <FaStar className='input-star' />
                            </label>
                        </legend>
                    </fieldset>
                </div> 
            ))}
            <h2>Write a Public Review</h2>
            <h3>Tell the next guests what you loved and anything else they should know about this place</h3>
            <input
                type='text'
                className="input-body"
                value={formData.body}
                onChange={handleChange}
                placeholder="Write a public review"
            />
        </form>
    )
}

export default ReviewForm