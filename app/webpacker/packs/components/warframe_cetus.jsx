import React, { Component } from 'react';
import Moment from 'react-moment';
import 'moment-timezone';
import axios from 'axios';

const API = 'https://api.warframestat.us/pc/cetusCycle';

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
        this.setState({ isLoading: true});
        await this.getCetusCycle();
        this.timer = setInterval(()=> this.getCetusCycle(),  10000);
        this.setCetusPresentCycle()
    }

    async getCetusCycle(){
        try {
            const result = await axios.get(API);
            this.setState({
                cetusCycle: result.data,
                isLoading: false
            });
            } catch (error) {
                 this.setState({
                 error,
                 isLoading: false
                 });
            }
    }

    setCetusPresentCycle(){
        {console.log(this.state.cetusCycle.isDay)}
        if (this.state.cetusCycle.isDay) {
            this.setState({ cetusPresentCycle: 'Jest dzień.'});
        } else {
            this.setState({ cetusPresentCycle: 'Jest noc.'});
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
                        {cetusPresentCycle}
                        <p>Zmiana pory <Moment locale="pl" interval={1000} to={cetusCycle.expiry}/></p>
                        <p>(<Moment locale='pl' format='DD-MM-YY HH:mm' date={cetusCycle.expiry}/>)</p>
                    </div>
                </div>
            </div>
        );
    }
}

