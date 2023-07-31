import { getTotalGasUsed } from '@mysten/sui.js';
import BigNumber from 'bignumber.js';
import { Chain, TransactionBlock, Wallet, WalletAccount } from 'ethos-connect';
import { DEVNET_NFT_CONTRACT, DEVNET_NFT_MAINTAINER, TESTNET_NFT_CONTRACT, TESTNET_NFT_MAINTAINER } from '../contracts';

export interface MintResult {
  result: any;
  error?: any;
}

const mintNft = async (
  wallet: Wallet,
  altAccount?: WalletAccount
): Promise<MintResult> => {
  const contract = TESTNET_NFT_CONTRACT;
  // const contract = DEVNET_NFT_CONTRACT;
  const maintainer = TESTNET_NFT_MAINTAINER;
  // const maintainer = DEVNET_NFT_MAINTAINER;
  const chain = Chain.SUI_TESTNET;
  // const chain = Chain.SUI_DEVNET;
  const transactionBlock = new TransactionBlock();
  const fee = new BigNumber(200000000);
  const payment = transactionBlock.splitCoins(transactionBlock.gas, [
    transactionBlock.pure(fee),
  ]);
  const coinVec = transactionBlock.makeMoveVec({ objects: [payment] });
  transactionBlock.moveCall({
    target: `${contract}::ethos_squad::mint_to_sender`,
    arguments: [transactionBlock.object(maintainer), coinVec],
  });

  try {
    const dryRun = await wallet.provider.devInspectTransactionBlock({
      transactionBlock,
      sender: wallet.address,
    });

    const gas = BigNumber(getTotalGasUsed(dryRun.effects)?.toString() ?? 0);

    const totalSuiRequired = gas.plus(fee);

    if (wallet.contents?.suiBalance?.lt(totalSuiRequired)) {
      return {
        error: `Insufficient SUI balance. You need at least ${totalSuiRequired
          .shiftedBy(-9)
          .toFixed()} SUI.`,
        result: null,
      };
    }

    const signInfo = await wallet.signTransactionBlock({
      transactionBlock,
      account: altAccount,
      chain,
    });

    const res = await wallet.executeTransactionBlock({
      transactionBlock: signInfo.transactionBlockBytes,
      signature: signInfo.signature,
      options: {
        showEffects: true,
        showEvents: true,
        showObjectChanges: true,
      },
      requestType: 'WaitForLocalExecution',
    });

    if (!res.objectChanges) return { error: 'No object changes', result: null };

    const change = res.objectChanges.find(
      (oc) => oc.type === 'created' && oc.objectType.indexOf(contract) > -1
    );

    if (change?.type === 'created') {
      const nftId = change.objectId;
      const nft = await wallet.provider.getObject({
        id: nftId,
        options: {
          showDisplay: true,
        },
      });
      return { result: nft };
    }

    return { error: 'No NFT ID', result: null };
  } catch (error) {
    // eslint-disable-next-line no-console
    console.error(`Error minting: ${error}`);
    return { result: null, error };
  }
};

export default mintNft;
