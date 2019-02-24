import React, { Component } from 'react';
import Moment from 'react-moment';
import 'moment-timezone';
import axios from "axios";

const API = 'https://content.warframe.com/dynamic/worldState.php';
const WorldState = require('warframe-worldstate-parser');

// WFCD API
// const API = 'https://api.warframestat.us/pc/sortie';

export class Alerts extends Component {

    constructor(props) {

        super(props);
        this.state = {
            alerts: [],
            isLoading: false,
            error: null,

        };
    }

    async componentDidMount() {
        this.setState({ isLoading: true});
        await this.getAlerts();
        this.timer = setInterval(()=> this.getAlerts(),  1000);
    }

    async getAlerts() {
        // fetch api
        try {
            const result = await axios.get('https://cors-anywhere.herokuapp.com/' + API);
            const ws = new WorldState(JSON.stringify(result.data));

            //set state of all alerts
            this.setState({
                alerts: ws.alerts,
                isLoading: false
            });

        // in case of failed fetch, show error
        } catch (error) {
            this.setState({
                error,
                isLoading: false
            });
        }
    }

    render() {
        const { alerts, isLoading, error  } = this.state;

        if (error) {
            return <p>{error.message}</p>;
        }

        if (isLoading) {
            return <p>Loading ...</p>;
        }

        return (
            <div className={'alerts-container'}>
                <h2>Alarmy</h2>
            <div className={'alerts-list row'}>
                {alerts.map(alert =>
                    <div className={'list-item col-md-3'} key={alert.id}>
                        <div className={'item-body'}>
                            <p>{alert.mission.description}</p>
                            <p>{alert.mission.node}</p>
                            <p>{alert.mission.type}</p>
                            <p>{alert.getETAString() }</p>
                            <p>(<Moment locale='pl' format='DD-MM-YY HH:mm' date={alert.expiry}/>)</p>
                            <p>{alert.mission.faction}</p>
                        </div>
                        <div className={'item-footer'}>
                            {/* reward items */}
                            <p>{alert.mission.reward.asString}</p>
                            {alert.mission.reward.thumbnail.length > 0 &&
                            <img src={alert.mission.reward.thumbnail} className='reward-thumbnail' alt="item-thumb"/>
                            }
                        </div>
                    </div>
                )}
            </div>
            </div>
        );
    }
}

