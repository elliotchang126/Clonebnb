import React from 'react';
import { Route, Switch, Redirect } from 'react-router-dom'
import Navigation from './components/Navigation/Navigation';
import PageNotFound from './components/PageNotFound/PageNotFound';
import ListingIndex from './components/ListingIndex/ListingIndex';
import ListingShow from './components/ListingShow/ListingShow';

function App() {
  return (
    <>
      <Navigation />
      <Switch>
        <Route exact path='/' component={ListingIndex}/>
        <Route exact path='/404' component={PageNotFound}/>
        <Route path={`/listings/:listingId`} component={ListingShow} />
        <Redirect to='/404' />
      </Switch>
    </>
  );
}

export default App;
