import React, { Component } from 'react';
import Moment from 'react-moment';
import 'moment-timezone';
import axios from 'axios';


const API = 'https://content.warframe.com/dynamic/worldState.php';
const WorldState = require('warframe-worldstate-parser');

// WFCD API
// const API = 'https://api.warframestat.us/pc/sortie';

export class WarframeCetus extends Component {

    constructor(props) {

        super(props);
        this.state = {
            cetusCycle: {},
            isLoading: false,
            error: null,
            cetusPresentCycle: "",
        };
    }

    async componentDidMount() {
        this.setState({isLoading: true});
        await this.getCetusCycle();
        this.timer = setInterval(() => this.getCetusCycle(), 1000);
        this.setCetusPresentCycle();
        this.timer = setInterval(() => this.setCetusPresentCycle(), 1000);
    }

    async getCetusCycle() {
        // fetch api
        try {
            const result = await axios({
                method: 'get',
                url: API,
                headers: {'Origin': 'https://dusze-orokinu.pl'}
            });
            const ws = new WorldState(JSON.stringify(result.data));

            //set state of all alerts
            this.setState({
                cetusCycle: ws.cetusCycle,
                isLoading: false
            });

            // set state of ETA time of every alert, refresh every second
            // this.setState({
            //     voidTraderStartETA: ws.voidTrader.getStartString(),
            //     voidTraderEndETA: ws.voidTrader.getEndString()
            // })

            // in case of failed fetch, show error
        } catch (error) {
            this.setState({
                error,
                isLoading: false
            });
        }
    }

    setCetusPresentCycle(){
        if (this.state.cetusCycle.isDay) {
            this.setState({ cetusPresentCycle: 'Jest dzień.'});
            const x = document.getElementById('eidolons-page');
            x.classList.add("is-day");
            x.classList.remove("is-night")
        } else {
            this.setState({ cetusPresentCycle: 'Jest noc.'});
            const x = document.getElementById('eidolons-page');
            x.classList.add("is-night");
            x.classList.remove("is-day");
        }
    }



    render() {
        const { cetusCycle, isLoading, error, cetusPresentCycle } = this.state;

        if (error) {
            return <p>{error.message}</p>;
        }

        if (isLoading) {
            return <p>Loading ...</p>;
        }

        return (
            <div className={'cetusCycle-container container'}>
                <h2>Plains of Eidolon</h2>
                <div className={'cetusCycle-box row'}>
                    <div className={'cetusCycle-header mx-auto mt-5'}>
                        <p>{cetusPresentCycle}</p>
                       <p>Zmiana pory za: {cetusCycle.timeLeft}</p>
                        <p>(<Moment locale='pl' format='DD-MM-YY HH:mm' date={cetusCycle.expiry}/>)</p>
                    </div>
                </div>
            </div>
        );
    }
}

