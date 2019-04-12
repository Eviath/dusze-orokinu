import React, { Component } from 'react';
import axios from 'axios';
import ReactDOM from "react-dom";

// WFCD API
// const API = 'https://api.warframestat.us/pc/sortie';

export class TwitchViews extends Component {

    constructor(props) {
        super(props);
        this.state = {
            stream: {},
        };
    }

    async componentDidMount() {
     this.apiRequest();
    this.timer = setInterval(() => this.apiRequest(), 15000);
    }

    apiRequest () {
        axios.get("https://api.twitch.tv/kraken/streams/" + this.props.user +"?&client_id=ycitz602bqv6ivmuaafm5ngtr6ad1l")
            .then(response => {
                console.log(response)
                this.setState({
                    stream: response.data.stream,
                });
            })
            .catch(e => {
                console.log(error);
            });
    }



    render() {
         const { stream } = this.state;

        return (
            <span>
                {stream.viewers}
            </span>
        );
    }
}

document.addEventListener('turbolinks:load', () => {
    const node = document.getElementById('twitch-embed');
    const data = JSON.parse(node.getAttribute('data'));
    TwitchViews.defaultProps = {
        user: data
    };
})