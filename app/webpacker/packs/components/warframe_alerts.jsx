import React, { Component } from 'react';
import Moment from 'react-moment';
import 'moment-timezone';
import axios from "axios";

const API = 'http://content.warframe.com/dynamic/worldState.php';
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
            const result = await axios({
                method: 'get',
                url: 'https://cors-anywhere.herokuapp.com/http://content.warframe.com/dynamic/worldState.php',
                crossDomain: true
            });
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
            <div className={'alerts-container col-lg-6'}>
                <h2 className={'alerts-header'}>Alerts</h2>
            <div className={'alerts-list row'}>
                {alerts.map(alert =>
                    <div className={'list-item col-md-6'} key={alert.id}>
                        <div className={'item-body'}>
                            <p>{alert.mission.description}</p>
                            <p>{alert.mission.node} - {alert.mission.faction} {alert.mission.type}</p>
                            <p className={'alert-timer'}>{alert.getETAString() }</p>
                            <p className={'alert-timer'}> <Moment locale='pl' format='DD-MM-YY HH:mm' date={alert.expiry}/> </p>
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

