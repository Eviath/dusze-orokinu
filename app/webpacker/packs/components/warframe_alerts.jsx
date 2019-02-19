import React, { Component } from 'react';
import Moment from 'react-moment';
import 'moment-timezone';

const API = 'https://api.warframestat.us/pc/alerts';

export class Alerts extends Component {

    constructor(props) {

        super(props);
        this.state = {
            alerts: [],
            isLoading: false,
            error: null,
        };
    }

    componentDidMount() {


        this.setState({ isLoading: true });
        fetch(API)


            .then(response => {
                if (response.ok) {
                    return response.json();
                } else {
                    throw new Error('Something went wrong ...');
                }
            })
            .then(data => this.setState({ alerts: data, isLoading: false  }))
            .catch(error => this.setState({ error, isLoading: false }));
    }

    render() {
        const { alerts, isLoading, error } = this.state;

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
                            <p>Wygasa <Moment locale="pl" interval={30000}  to={alert.expiry}/> </p>
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

