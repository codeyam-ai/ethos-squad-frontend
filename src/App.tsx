import { Chain, EthosConnectProvider } from 'ethos-connect';
import Home from "./components/Home";

function App() {
  return (<EthosConnectProvider
    ethosConfiguration={{
      chain: Chain.SUI_TESTNET // Optional. Defaults to sui:devnet - An enum containing acceptable chain identifier strings can be imported from the ethos-connect package 
    }}
  >
    <Home />
  </EthosConnectProvider>);
}

export default App;
