// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react';
import ReactDOM from 'react-dom'

import { Alerts } from "./components/warframe_alerts";
import { Sortie } from "./components/warframe_sortie";
import { VoidTrader } from "./components/warframe_baro";
import { WarframeCetus } from "./components/warframe_cetus";
import { Widget } from "./components/discord_widget";


export class WarframeMissions extends React.Component{
  render(){
    return(
        <div className='warframe-missions row'>
          <Sortie />
          <Alerts/>
        </div>
  );
  }
}



export class Cetus extends React.Component{
    render(){
        return(
            <div className='warframe-news'>
                <WarframeCetus />
            </div>
        );
    }
}

export class News extends React.Component{
    render(){
        return(
            <div className='warframe-news'>
                <VoidTrader />
            </div>
        );
    }
}

if (!Turbolinks) {
    location.reload();
}

Turbolinks.dispatch("turbolinks:load");


document.addEventListener('turbolinks:load', () => {
    if (document.getElementById('warframe-missions')) {
        ReactDOM.render(
            <WarframeMissions/>,
            document.getElementById('warframe-missions'),
        );
    }
});

document.addEventListener('turbolinks:load', () => {
    if (document.getElementById('warframe-poe')) {
        ReactDOM.render(
            <Cetus/>,
            document.getElementById('warframe-poe'),
        );
    }
});


document.addEventListener('turbolinks:load', () => {
    if (document.getElementById('discord')) {
        ReactDOM.render(
            <Widget/>,
            document.getElementById('discord'),
        );
    }
});

document.addEventListener('turbolinks:load', () => {

    if (document.getElementById('warframe-news')) {
    ReactDOM.render(
        <News/>,
        document.getElementById('warframe-news'),
    );
    }

});
