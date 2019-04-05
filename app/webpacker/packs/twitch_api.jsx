
import React from 'react';
import ReactDOM from 'react-dom'

import { TwitchViews } from "./components/twitch_views";

const EMBED_URL = 'https://embed.twitch.tv/embed/v1.js';

export class Twitch extends React.Component{
    render(){
        return(
            <span className='twitch-views'>
                <TwitchViews />
            </span>
        );
    }
}

class Hello extends React.Component {
    componentDidMount() {
        let embed;
        const script = document.createElement('script');
        script.setAttribute(
            'src',
            EMBED_URL
        );
        script.addEventListener('load', () => {
            embed = new window.Twitch.Embed(this.props.targetID, { ...this.props });
        });
        document.body.appendChild(script);


    }

    render() {
        return (
            <div>
                <div id={this.props.targetID}></div>
            </div>
        )
    }
}

document.addEventListener('turbolinks:load', () => {
    if (document.getElementById('twitch-views')) {
        ReactDOM.render(
            <Twitch/>,
            document.getElementById('twitch-views'),
        );
    }
});

document.addEventListener('turbolinks:load', () => {
    const node = document.getElementById('twitch-embed');
    const data = JSON.parse(node.getAttribute('data'));
    Hello.defaultProps = {
        targetID: 'twitch-embed',
        channel: data,
    };
    TwitchViews.defaultProps = {
        user: data
    };
    ReactDOM.render(
        <Hello data={data} />,
        document.getElementById('twitch-embed')
    )
})


