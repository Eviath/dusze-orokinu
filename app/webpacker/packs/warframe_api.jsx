// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { Component } from 'react';
import ReactDOM from 'react-dom'

import {  Alerts  } from "./components/warframe_alerts";

export class WarframeApi extends React.Component{
  render(){
    return(
        <Alerts />

  );
  }
}




document.addEventListener('turbolinks:load', () => {
  ReactDOM.render(
    <WarframeApi/>,
    document.getElementById('alerts'),
  )
})
