import * as React from 'react'
import WidgetBot, { API } from '@widgetbot/react-embed'

export class Widget extends React.Component {

    render() {
        return (
            <div>
                <WidgetBot
                    server="144454098748571648"
                    channel="410850825380823040"
                    shard="https://cl3.widgetbot.io"
                    className="discord-widget"
                />
            </div>
        )
    }
}


