import React, {Component} from 'react';
import Moment from 'react-moment';
import 'moment-timezone';
import axios from "axios";
import {faQuestionCircle} from '@fortawesome/free-regular-svg-icons'
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome'

const API = 'https://content.warframe.com/dynamic/worldState.php';
const WorldState = require('warframe-worldstate-parser');

// WFCD API
// const API = 'https://api.warframestat.us/pc/sortie';

export class Sortie extends Component {

    constructor(props) {

        super(props);
        this.state = {
            sortie: {},
            sortieEta: null,
            isLoading: false,
            error: null,
            isHidden: [true, true, true]
        };
    }

    showHide(num){
        this.setState((prevState) => {
            const newItems = [...prevState.isHidden];
            newItems[num] = !newItems[num];
            return {isHidden: newItems};
        });
    }

    async componentDidMount() {
        this.setState({isLoading: true});

        await this.getSortieStatus();
        this.timer = setInterval(() => this.getSortieStatus(), 60000);
    }

    componentWillUnmount() {
        this.timer = null;
    }

    async getSortieStatus() {
        // fetch api
        try {
            const result = await axios(API, {
                method: 'GET',
                mode: 'cors',
                headers: {
                    'Access-Control-Allow-Origin': '*',
                    'Content-Type': 'application/json',
                }});

            const ws = new WorldState(JSON.stringify(result.data));
            this.setState({
                sortie: ws.sortie,
                isLoading: false
            });


            // set state of ETA time sortie, refresh every second
            this.interval = setInterval(() => {
                this.setState({
                    sortieEta: ws.sortie.getETAString(),
                    isLoading: false
                });
            }, 1000);


        } catch (error) {
            this.setState({
                error,
                isLoading: false
            });
        }
    }


    render() {
        const {sortie, sortieEta, isLoading, error, isHidden} = this.state;

        const variants = sortie.variants;

        const sortieVariants = (

            variants && variants.map((mission, key) =>
                <div key={key} className="variants-container">
                    {!isHidden[key] && (
                        <div className="sortie-variant-header row text-center">
                            <div className="col-lg-2 variant-item type">
                                <p>Mission Type</p>
                            </div>
                            <div className="col-lg-4 variant-item node">
                                <p>Planet & Node</p>
                            </div>
                            <div className="col-lg-5 variant-item modifier">
                                <p>Modifier</p>
                                <p>{mission.modifierDescription}</p>
                            </div>
                            <div className="col-lg-1 variant-item help">
                            </div>
                        </div>
                    )}
                    <div className={'row text-center sortie-variant-box'}>
                        <div className="col-lg-2 variant-item type">
                            <p>{mission.missionType}</p>
                        </div>
                        <div className="col-lg-4 variant-item node">
                            <p>{mission.node}</p>
                        </div>
                        <div className="col-lg-5 variant-item modifier">
                            <p>{mission.modifier}</p>
                        </div>
                        <div className="col-lg-1 variant-item help">
                            <span  onClick={()=>this.showHide(key)}> <FontAwesomeIcon icon={faQuestionCircle} /> </span>
                        </div>
                    </div>
                </div>

            )
        );


        if (error) {
            return <p>{error.message}</p>;
        }

        if (isLoading) {
            return <p>Loading ...</p>;
        }

        return (
            <div className={'sortie-container'}>
                <h2>Sortie</h2>

                <div className={'sortie-box row'}>
                    <div className={'sortie-header mx-auto mt-5 pb-5'}>
                        <h5>{sortie.boss}</h5>
                        <p>{sortie.faction}</p>
                        <p>{sortieEta}</p>
                        <p>(<Moment locale='pl' format='DD-MM-YY HH:mm' date={sortie.expiry}/>)</p>
                    </div>

                    <div className="container sortie-variants">
                        {sortieVariants}
                    </div>

                </div>
            </div>
        );
    }
}

