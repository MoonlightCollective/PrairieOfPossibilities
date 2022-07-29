import React, { useEffect, useState } from "react";
import ReactDOM from "react-dom";
import logo from './logo.svg';
import './App.css';


var jsonVar = {
  text: "example",
  number: 1
};

function App() {

  const [topicFeed, setTopicFeed] = useState();

  // Function to collect data
  const getApiData = async () => {
    const response = await fetch(
      "/mqtt/topic/portal"
    ).then((response) => response.json());

    setTopicFeed(response);
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
                <button className="MqttButton" type="submit">Portal1 trigger forward</button>
              </form>
            </td>
          </tr><tr>
            <td></td>
            <td>
              <form action="/mqtt/topic/portal" method="post" className="form">
                <button className="MqttButton" type="submit">Portal1 trigger backward</button>
              </form>
            </td>
          </tr>
          </table>
        </td><td>
          <p>Portal MQQT feed:</p>
          <table className="FeedTable">
          <tr>
            <th>name</th>
            <th>fields</th>
            <th>tags</th>
            <th>timestamp</th>
          </tr>          
            {topicFeed &&
              topicFeed.map((feedItem) => (
              <tr>
                <td>{feedItem.name}</td>
                <td>{JSON.stringify(feedItem.fields)}</td>
                <td>{JSON.stringify(feedItem.tags)}</td>
                <td>{feedItem.timestamp}</td>
              </tr>
            ))}
          </table>
        </td></tr>
        </table>

    </div>
  );
}

//const rootElement = document.getElementById("root");
//ReactDOM.render(<App />, rootElement);
export default App;
