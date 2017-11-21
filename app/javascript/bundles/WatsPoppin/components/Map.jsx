import React from 'react';
import PropTypes from 'prop-types';
import ReactMapGL, { Marker, Popup } from 'react-map-gl';

import Pin from './Pin';

export default class Map extends React.Component {
  static propTypes = {
    initialLat: PropTypes.number.isRequired,
    initialLng: PropTypes.number.isRequired
  };

  constructor(props) {
    super(props);

    this.state = {
      viewport: {
        width: window.innerWidth,
        height: window.innerHeight,
        latitude: props.initialLat,
        longitude: props.initialLng,
        zoom: 8
      },
      currentPosition: {
        latitude: props.initialLat,
        longitude: props.initialLng
      }
    };

    // Needed because initial marker(using geocoder position) wasnt showing until scroll
    setTimeout(() => {
      this.setState({});
    }, 50);
  }

  getCurrentPosition = () => {
    window.navigator.geolocation.getCurrentPosition(position => {
      this.setState({
        currentPosition: {
          latitude: position.coords.latitude,
          longitude: position.coords.longitude
        }
      });
    });
  };

  renderCurrentPosition = () => {
    if (!this.state.currentPosition) return false;

    return (
      <Marker
        latitude={this.state.currentPosition.latitude}
        longitude={this.state.currentPosition.longitude}
      >
        <Pin onClick={() => {}} />
      </Marker>
    );
  };

  componentWillMount() {
    this.getCurrentPosition();
  }

  render() {
    return (
      <ReactMapGL
        {...this.state.viewport}
        mapboxApiAccessToken="pk.eyJ1IjoibWFyaWFuc2VybmEiLCJhIjoiY2phOGtrcW43MDg5MTJxbGl1Nzg3aDA3ZCJ9.xKp2gqw1gEz0d1fmutdUpw"
        mapStyle="mapbox://styles/marianserna/cj9niotu73i7t2rs1mt2t14sy"
        onViewportChange={viewport => {
          this.setState({ viewport });
        }}
      >
        {this.renderCurrentPosition()}
      </ReactMapGL>
    );
  }
}
