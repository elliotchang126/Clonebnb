import React from 'react';
import { Route, Switch, Redirect } from 'react-router-dom'
import Navigation from './components/Navigation/Navigation';
import PageNotFound from './components/PageNotFound/PageNotFound';
import ListingIndex from './components/ListingIndex/ListingIndex';
import ListingShow from './components/ListingShow/ListingShow';
import ReviewForm from './components/ReviewForm/ReviewForm';
import ProfileShow from './components/ProflieShow/ProfileShow';
import Footer from './components/Footer/Footer';

function App() {
  return (
    <>
      <Navigation />
      <Switch>
        <Route path ='/users/:userId' component={ProfileShow}/>
        <Route exact path='/' component={ListingIndex}/>
        <Route exact path='/404' component={PageNotFound}/>
        <Route path ='/reviews/new' component={ReviewForm}/>
        <Route path={`/listings/:listingId`} component={ListingShow} />
        <Redirect to='/404' />
      </Switch>
      <Footer />
    </>
  );
}

export default App;
