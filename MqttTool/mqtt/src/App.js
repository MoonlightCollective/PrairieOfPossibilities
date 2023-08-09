import React, { useEffect, useState } from "react";
//import ReactDOM from "react-dom";
import logo from './logo.svg';
import './App.css';


function App() {

  const [topicFeedPortal, setTopicFeedPortal] = useState();
  const [topicFeedBooth, setTopicFeedBooth] = useState();
  const [topicFeedBoothSession, setTopicFeedBoothSession] = useState();
  const [topicFeedPraireControl, setTopicFeedPraireControl] = useState();

  // Function to collect data
  const getApiData = async () => {
    const responsePortal = await fetch(
      "/mqtt/topic/portal"
    ).then((responsePortal) => responsePortal.json());

    setTopicFeedPortal(responsePortal);

    const responseBooth = await fetch(
      "/mqtt/topic/booth"
    ).then((responseBooth) => responseBooth.json());

    setTopicFeedBooth(responseBooth);

    const responseBoothSession = await fetch(
      "/mqtt/topic/booth_session"
    ).then((responseBoothSession) => responseBoothSession.json());

    setTopicFeedBoothSession(responseBoothSession);

    const responseBoothPraireControl = await fetch(
      "/mqtt/topic/praire_control"
    ).then((responseBoothPraireControl) => responseBoothPraireControl.json());

    setTopicFeedPraireControl(responseBoothPraireControl);

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
          </tr>
          </table>
        </td><td>
          <table><tr>
            <p>portal MQQT feed:</p>
            <table className="FeedTable">
            <tr>
              <th>name</th>
              <th>fields</th>
              <th>tags</th>
              <th>timestamp</th>
            </tr>          
              {topicFeedPortal &&
                topicFeedPortal.map((feedItem) => (
                <tr>
                  <td>{feedItem.name}</td>
                  <td>{JSON.stringify(feedItem.fields)}</td>
                  <td>{JSON.stringify(feedItem.tags)}</td>
                  <td>{feedItem.timestamp}</td>
                </tr>
              ))}
            </table>
          </tr><tr>
            <p>booth MQQT feed:</p>
            <table className="FeedTable">
            <tr>
              <th>name</th>
              <th>fields</th>
              <th>tags</th>
              <th>timestamp</th>
            </tr>          
              {topicFeedBooth &&
                topicFeedBooth.map((feedItem) => (
                <tr>
                  <td>{feedItem.name}</td>
                  <td>{JSON.stringify(feedItem.fields)}</td>
                  <td>{JSON.stringify(feedItem.tags)}</td>
                  <td>{feedItem.timestamp}</td>
                </tr>
              ))}
            </table>
          </tr><tr>
            <p>booth_session MQQT feed:</p>
            <table className="FeedTable">
            <tr>
              <th>name</th>
              <th>fields</th>
              <th>tags</th>
              <th>timestamp</th>
            </tr>          
              {topicFeedBoothSession &&
                topicFeedBoothSession.map((feedItem) => (
                <tr>
                  <td>{feedItem.name}</td>
                  <td>{JSON.stringify(feedItem.fields)}</td>
                  <td>{JSON.stringify(feedItem.tags)}</td>
                  <td>{feedItem.timestamp}</td>
                </tr>
              ))}
            </table>
          </tr><tr>
            <p>praire_control MQQT feed:</p>
            <table className="FeedTable">
            <tr>
              <th>name</th>
              <th>fields</th>
              <th>tags</th>
              <th>timestamp</th>
            </tr>          
              {topicFeedPraireControl &&
                topicFeedPraireControl.map((feedItem) => (
                <tr>
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
