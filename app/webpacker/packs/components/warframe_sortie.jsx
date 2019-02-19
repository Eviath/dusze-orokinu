import React, { Component } from 'react';
import Moment from 'react-moment';
import 'moment-timezone';

const API = 'https://api.warframestat.us/pc/sortie';

export class Sortie extends Component {

    constructor(props) {

        super(props);
        this.state = {
            sortie: {},
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
            .then(data => this.setState({ sortie: data, isLoading: false  }))
            .catch(error => this.setState({ error, isLoading: false }));
    }

    render() {
        const { sortie, isLoading, error } = this.state;
        const variants = sortie.variants;

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
                        <p>Wygasa <Moment locale="pl" interval={30000}  to={sortie.expiry}/> </p>
                        <p>(<Moment locale='pl' format='DD-MM-YY HH:mm' date={sortie.expiry}/>)</p>
                    </div>
                    <div className={'row'}>
                        {variants &&
                        variants.map((mission, key) =>
                            <div key={key} className={'col-md-4'}>
                                <p>{mission.missionType}</p>
                                <p>{mission.node}</p>
                                <p>{mission.modifier}</p>
                                <p>{mission.modifierDescription}</p>
                            </div>
                        )
                        }
                  </div>
                </div>
            </div>
        );
    }
}

