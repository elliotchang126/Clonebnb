import React from 'react';
import { Route, Switch, Redirect } from 'react-router-dom'
import Navigation from './components/Navigation/Navigation';
import PageNotFound from './components/PageNotFound/PageNotFound';
import ListingIndex from './components/ListingIndex/ListingIndex';

function App() {
  return (
    <>
      <Navigation />
      <Switch>
        <Route exact path='/' component={ListingIndex}/>
        <Route exact path='/404' component={PageNotFound}/>
        <Redirect to='/404' />
      </Switch>
    </>
  );
}

export default App;
