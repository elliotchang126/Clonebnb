import { createStore, combineReducers, applyMiddleware, compose } from 'redux'
import thunk from 'redux-thunk'
import uiReducer from './uiReducer'
import sessionReducer from './sessionReducer'
import listingsReducer from './listingsReducer'
import usersReducer from './usersReducer'
import errorsReducer from './errorsReducer'
import reviewsReducer from './reviewsReducer'
import reservationsReducer from './reservationsReducer'



const rootReducer = combineReducers({
    session: sessionReducer,
    listings: listingsReducer,
    users: usersReducer,
    reviews: reviewsReducer,
    reservations: reservationsReducer;
    errors: errorsReducer,
    ui: uiReducer
})

let enhancer;

if (process.env.NODE_ENV === 'production') {
    enhancer = applyMiddleware(thunk);
} else {
    const logger = require('redux-logger').default;
    const composeEnhancers =
    window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
    enhancer = composeEnhancers(applyMiddleware(thunk, logger));
}

const configureStore = (preloadedState={}) => (
    
    createStore(
        rootReducer, 
        preloadedState, 
        enhancer
    )
)

export default configureStore;