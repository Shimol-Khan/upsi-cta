import React from 'react';

import { Cards, CountryPicker, Chart ,Footer} from './components';
import { fetchData } from './api/';
import styles from './App.module.css';
import image from './images/covid.png';
import Button from '@material-ui/core/Button';

class App extends React.Component {
  state = {
    data: {},
    country: '',
  }

  async componentDidMount() {
    const data = await fetchData();

    this.setState({ data });
  }

  handleCountryChange = async (country) => {
    const data = await fetchData(country);

    this.setState({ data, country: country });
  }

  render() {
    const { data, country } = this.state;

    return (
      <div className={styles.container}>
        <Cards data={data} />
        <CountryPicker handleCountryChange={this.handleCountryChange} />
        <Chart data={data} country={country} />
        <Footer />
      </div>
    );
  }
}

export default App;