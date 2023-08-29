import React, { useEffect, useState } from "react";
//import ReactDOM from "react-dom";
import logo from './logo.svg';
import './App.css';


function App() {

  const [mqttFeed, setMqttFeed] = useState();

  // Function to collect data
  const getApiData = async () => {
    const responseFeed = await fetch(
      "/mqtt/topics"
    ).then((mqttFeed) => mqttFeed.json());

    setMqttFeed(responseFeed);
  };

  useEffect(() => {
    getApiData();
  }, []);

  return (
    <div className="App">

      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          MQTT toolbox for the prairie
        </p>
      </header>
      <table className="MasterTable">
        <tr><td>          
          <table className="ButtonTable">
          <tr>
            <td></td>
            <td>
              <form action="/mqtt/topic/portal" method="post" className="form">
                <table className="FormTable"><tr><td><table><tr>
                <select name="sender">
                  <option value="portal1">portal1</option>
                  <option value="portal2">portal2</option>
                </select>
                </tr><tr>
                <select name="direction">
                  <option value="forward">forward</option>
                  <option value="backward">backward</option>
                </select>
                </tr></table></td><td>
                <button className="MqttButton" type="submit">portal</button>
                </td></tr></table>
              </form>
            </td>
          </tr><tr>
            <td></td>
            <td>
              <form action="/mqtt/topic/booth" method="post" className="form">
              <table className="FormTable"><tr><td><table><tr>
                <select name="sender">
                  <option value="booth1">booth1</option>
                  <option value="booth2">booth2</option>
                </select>
                </tr><tr>
                <select name="state">
                  <option value="1">1</option>
                  <option value="0">0</option>
                </select>
                </tr></table></td><td>
                <button className="MqttButton" type="submit">booth</button>
                </td></tr></table>
              </form>
            </td>
          </tr><tr>
            <td></td>
            <td>
              <form action="/mqtt/topic/booth_session" method="post" className="form">
              <table className="FormTable"><tr><td><table><tr>
                <select name="message">
                  <option value="end_call">end_call</option>
                  <option value="film_toggle">film_toggle</option>
                </select>
                </tr><tr>
                <select name="sender">
                  <option value="booth1">booth1</option>
                  <option value="booth2">booth2</option>
                </select>
                </tr><tr>
                <select name="state">
                  <option value="1">1</option>
                  <option value="0">0</option>
                </select>
                </tr></table></td><td>
                <button className="MqttButton" type="submit">booth_session</button>
                </td></tr></table>
              </form>
            </td>
          </tr><tr>
            <td></td>
            <td>
              <form action="/mqtt/topic/praire_control" method="post" className="form">
              <table className="FormTable"><tr><td><table><tr>
                <select name="message">
                  <option value="stop">stop</option>
                  <option value="play">play</option>
                  <option value="pause">pause</option>
                  <option value="next_song">next_song</option>
                </select>
                </tr></table></td><td>
                <button className="MqttButton" type="submit">praire_control</button>
                </td></tr></table>
              </form>
            </td>
            </tr><tr>
            <td></td>
            <td>
              <form action="/mqtt/topic/prairie_staff" method="post" className="form">
              <table className="FormTable"><tr><td><table><tr>
                <select name="tagId">
                  <option value="04 24 FC 89 78 00 00">04 24 FC 89 78 00 00</option>
                </select>
                </tr></table></td><td>
                <button className="MqttButton" type="submit">prairie_staff</button>
                </td></tr></table>
              </form>
            </td>
          </tr>
          </table>
        </td><td>
          <table><tr>
            <p>MQQT feed:</p>
            <table className="FeedTable">
            <tr>
              <th>topic</th>
              <th>name</th>
              <th>fields</th>
              <th>tags</th>
              <th>timestamp</th>
            </tr>          
              {mqttFeed &&
                mqttFeed.map((feedItem) => (
                <tr>
                  <td>{feedItem.topic}</td>
                  <td>{feedItem.name}</td>
                  <td>{JSON.stringify(feedItem.fields)}</td>
                  <td>{JSON.stringify(feedItem.tags)}</td>
                  <td>{feedItem.timestamp}</td>
                </tr>
              ))}
            </table>
          </tr></table>
        </td></tr>
        </table>
    </div>
  );
}

//const rootElement = document.getElementById("root");
//ReactDOM.render(<App />, rootElement);
export default App;
