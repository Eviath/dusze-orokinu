import React from 'react';
const Items = require('warframe-items');


export class WarframeItems extends React.Component {

    constructor(props) {

        super(props);
        this.state = {
            warframeItems: [],
            isLoading: false,
        };
    }

    async componentDidMount() {
        this.setState({ isLoading: true});
        await this.setItems();
    }

    async setItems(){

        const items = new Items(["Arcanes"], Items);
        try {
            this.setState({
                warframeItems: items,
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
        const { warframeItems, isLoading, } = this.state;

        if (isLoading) {
            return <p>Loading ...</p>;
        }

        return (
            <div className={'alerts-container'}>
                <h2>Alarmy</h2>
                {warframeItems.length}
                {warframeItems.category}
                <ul className={'alerts-list'}>
                    {warframeItems.map(item =>
                        <li className={'list-item '} >
                            {item.name}
                        </li>
                    )}
                </ul>
            </div>
        );
    }
}

