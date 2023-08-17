import { useDispatch } from "react-redux"
import { useParams } from "react-router-dom/cjs/react-router-dom";


const ReviewForm = () => {
    const dispatch = useDispatch();
    const { listingId } = useParams();
    const [formData, setFormData] = useState({
        cleanliness: null,
        communication: null,
        check_in: null,
        accuracy: null,
        location: null,
        value: null,
        body: ''
    })

    return(
        <form className='review-form'>
            
        </form>
    )
}

export default ReviewForm