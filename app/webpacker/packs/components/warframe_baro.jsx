import React, {Component} from 'react';
import Moment from 'react-moment';
import 'moment-timezone';
import axios from "axios";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faQuestionCircle} from "@fortawesome/free-regular-svg-icons";

const API = 'https://content.warframe.com/dynamic/worldState.php';
const WorldState = require('warframe-worldstate-parser');

// WFCD API
// const API = 'https://api.warframestat.us/pc/sortie';

export class VoidTrader extends Component {

    constructor(props) {

        super(props);
        this.state = {
            voidTrader: {},
            isLoading: false,
            error: null,
        };
    }

    async componentDidMount() {
        this.setState({isLoading: true});
        await this.getVoidTrader();
        this.timer = setInterval(() => this.getVoidTrader(), 1000);
        this.timer = setInterval(() => this.voidTraderETAStatus(), 1000);
    }

    async getVoidTrader() {
        // fetch api
        try {
            const result = await axios.get(API);
            const ws = new WorldState(JSON.stringify(result.data));

            //set state of all alerts
            this.setState({
                voidTrader: ws.voidTrader,
                isLoading: false
            });
            // set state of ETA time of every alert, refresh every second

            this.setState({
                voidTraderStartETA: ws.voidTrader.getStartString(),
                voidTraderEndETA: ws.voidTrader.getEndString()
            })

            // in case of failed fetch, show error
        } catch (error) {
            this.setState({
                error,
                isLoading: false
            });
        }
    }

    ifExpired() {
        if (this.state.voidTrader.expiration > Date.now()) {
            return <p> Void Trader Expired, waiting for update...</p>
        } else  {
            return (
                <div>
                    <p>Czas do odlotu: {this.state.voidTraderEndETA}</p>
                    <p> Data odlotu: (<Moment locale='pl' format='DD-MM-YYYY HH:mm' date={this.state.voidTrader.expiry}/>)</p>
                </div>
            )
        }
    }

    voidTraderETAStatus() {
        if (!this.state.voidTrader.active) {
            return (
                <div>
                <p>Czas do przylotu: {this.state.voidTraderStartETA}</p>
                <p> Data przylotu: (<Moment locale='pl' format='DD-MM-YYYY HH:mm' date={this.state.voidTrader.activation}/>)</p>
                </div>
            )
        } else {
            this.ifExpired();
        }
    };


    render() {
        const {voidTrader, isLoading, error} = this.state;

        const inventory = voidTrader.inventory

        const inventoryItems = (

            inventory && inventory.map((item, key) =>
                <li key={key}>
                    <p>{item.item}</p>
                    <p>Credits: {item.credits}</p>
                    <p>Ducats: {item.ducats}</p>
                </li>
            )
        );



        if (error) {
            return <p>{error.message}</p>;
        }

        if (isLoading) {
            return <p>Loading ...</p>;
        }


        return (
            <div className={'voidTrader-container container'}>
                <h2>Void Trader - {voidTrader.character}</h2>
                <div className={'voidTrader-box row'}>
                    <div className={'voidTrader-header mx-auto mt-5'}>
                        <h5>{voidTrader.location}</h5>
                        {this.voidTraderETAStatus()}
                        <ul className={'w-100 d-flex'}>
                            {inventoryItems}
                        </ul>
                    </div>
                </div>
            </div>
        );
    }
}

