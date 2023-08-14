import React from 'react';
import { Route, Switch, Redirect } from 'react-router-dom'
import Navigation from './components/Navigation/Navigation';
import PageNotFound from './components/PageNotFound/PageNotFound';

function App() {
  return (
    <>
      <Navigation />
      <h1>Hello world!</h1>
      <Switch>
        <Route exact path='/404' component={PageNotFound}/>
        <Route path='/' />
        <Redirect to='/404' />
      </Switch>
    </>
  );
}

export default App;
