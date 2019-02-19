import React, { Component } from 'react';
import Moment from 'react-moment';
import 'moment-timezone';

const API = 'https://api.warframestat.us/pc/voidTrader';

export class VoidTrader extends Component {

    constructor(props) {

        super(props);
        this.state = {
            voidTrader: {},
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
            .then(data => this.setState({ voidTrader: data, isLoading: false  }))
            .catch(error => this.setState({ error, isLoading: false }));
    }

    render() {
        const { voidTrader, isLoading, error } = this.state;

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
                        <p>Nadejdzie <Moment locale="pl" interval={30000}  to={voidTrader.activation}/> </p>
                        <p>(<Moment locale='pl' format='DD-MM-YY HH:mm' date={voidTrader.activation}/>)</p>
                    </div>
                </div>
            </div>
        );
    }
}

