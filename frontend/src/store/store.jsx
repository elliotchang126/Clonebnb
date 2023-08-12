import { createStore, combineReducers, applyMiddleware } from 'redux'
import thunk from 'redux-thunk'
import logger from 'redux-logger'
import uiReducer from './uiReducer'



const rootReducer = combineReducers({
    ui: uiReducer
})



const configureStore = (preloadedState={}) => (
    
    createStore(rootReducer, preloadedState, applyMiddleware(thunk))
)

export default configureStore;