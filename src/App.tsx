import { Chain, EthosConnectProvider } from 'ethos-connect';
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import Home from "./components/Home";

function App() {
  return (<EthosConnectProvider
    ethosConfiguration={{
      chain: Chain.SUI_TESTNET
    }}
    dappName='Ethos Squad'
    dappIcon={<SquadDappIcon />}
    connectMessage="Sign in to join the Squad!"
  >
    <ToastContainer />
    <Home />
  </EthosConnectProvider>);
}

export default App;

const SquadDappIcon = () => {
  return (
    <img
      src="/mimi-card-stack.png"
      alt=""
      className="w-48 h-48"
    />
  )
}