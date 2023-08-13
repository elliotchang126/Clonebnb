import React from 'react';
import ReactDOM from 'react-dom/client';
import { Provider } from 'react-redux'
import { BrowserRouter } from 'react-router-dom'
import './reset.css';
import './index.css';
import App from './App';
import configureStore from './store/store';
import * as sessionActions from './store/sessionReducer'
import {activateSessionModal, deactivateSessionModal} from './store/uiReducer'
import csrfFetch from './store/csrf';
import { ModalProvider } from './context/Modal';

// ReactDOM.render(
// );

const store = configureStore();
  window.store = store;
  window.csrfFetch = csrfFetch;
  window.sessionActions = sessionActions;
  window.activate = activateSessionModal;
  window.deactivate = deactivateSessionModal;


function Root() {
  return (
    <ModalProvider>
      <Provider store={store}>
        <BrowserRouter>
          <App />
        </BrowserRouter>
      </Provider>
    </ModalProvider>
  )
}
const renderApplication = () => {
  ReactDOM.createRoot(document.getElementById('root'))
    .render(
      <React.StrictMode>
        <Root />
      </React.StrictMode>
    )
}

if (
  sessionStorage.getItem('currentUser') === null || sessionStorage.getItem('X-CSRF-Token') === null) {
    store.dispatch(sessionActions.restoreSession())
      .then(renderApplication);
  } else {
    renderApplication()
  }