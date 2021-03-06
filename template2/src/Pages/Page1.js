import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Container from '@material-ui/core/Container';

import Types from '../Components/Types'

const useStyles = makeStyles(theme => ({
  root: {
    flexGrow: 1,
    paddingTop: '20px',
    minHeight: '90vh',
  }
}));



export default () => {
  const classes = useStyles();


  return (
    <Container className={classes.root}>
      <Types/>
     </Container>
   );
}
