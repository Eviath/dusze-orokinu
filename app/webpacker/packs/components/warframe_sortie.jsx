import React, {Component} from 'react';
import Moment from 'react-moment';
import 'moment-timezone';
import axios from "axios";
import {faQuestionCircle} from '@fortawesome/free-regular-svg-icons'
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome'

const API = 'http://content.warframe.com/dynamic/worldState.php';
const WorldState = require('warframe-worldstate-parser');

// const API = 'https://api.warframestat.us/pc/sortie';

export class Sortie extends Component {

    constructor(props) {

        super(props);
        this.state = {
            sortie: {},
            isLoading: false,
            error: null,
            isHidden: [true, true, true]
        };
    }


    async componentDidMount() {
        this.setState({isLoading: true});
        await this.getSortieStatus();
        this.timer = setInterval(() => this.getSortieStatus(), 60000);
    }

    async getSortieStatus() {
        try {
            const result = await axios.get(API);
            const ws = new WorldState(result);
            this.setState({
                sortie: ws.sortie,
                isLoading: false
            });
        } catch (error) {
            this.setState({
                error,
                isLoading: false
            });
        }
    }


    render() {
        const {sortie, isLoading, error} = this.state;

        if (error) {
            return <p>{error.message}</p>;
        }

        if (isLoading) {
            return <p>Loading ...</p>;
        }

        return (
            <div className={'sortie-container'}>
                <h2>Sortie</h2>
                {console.log(sortie)}
            </div>
        );
    }
}

