import React, { Component } from 'react';
import Moment from 'react-moment';
import 'moment-timezone';

const API = 'https://api.warframestat.us/pc/cetusCycle';

export class WarframeCetus extends Component {

    constructor(props) {

        super(props);
        this.state = {
            cetusCycle: {},
            isLoading: false,
            error: null,
        };
    }

    componentDidMount() {
        this.setState({ isLoading: true });
        this.timer = setInterval(()=> this.getCetusCycle(), 10000)
    }

    async getCetusCycle(){
        fetch(API)
            .then(response => {
                if (response.ok) {
                    return response.json();
                } else {
                    throw new Error('Something went wrong ...');
                }
            })
            .then(data => this.setState({ cetusCycle: data, isLoading: false  }))
            .catch(error => this.setState({ error, isLoading: false }));
    }


    render() {
        const { cetusCycle, isLoading, error } = this.state;

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
                        <p>Zmiana pory <Moment locale="pl" interval={1000}  to={cetusCycle.expiry}/> </p>
                        <p>(<Moment locale='pl' format='DD-MM-YY HH:mm' date={cetusCycle.expiry}/>)</p>
                    </div>
                </div>
            </div>
        );
    }
}

