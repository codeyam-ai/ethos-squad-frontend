import { ethos } from "ethos-connect";
import { BackgroundProvider } from "../components/BackgroundProvider";
import { TESTNET_NFT_CONTRACT } from "../contracts";

const MySquad: React.FC = () => {
    const { wallet } = ethos.useWallet();

    return (
        <BackgroundProvider>
            <div className="mx-auto max-w-7xl px-6 pb-32 pt-36 sm:pt-60 lg:px-8 lg:pt-32">
                <div className="mx-auto max-w-2xl gap-x-14 lg:mx-0 lg:flex lg:max-w-none">
                    <div className="lg:shrink-0 xl:max-w-2xl">
                        <span className='flex gap-2'>
                            <h1 className="text-4xl font-light tracking-tight text-gray-900 sm:text-6xl">
                                Your
                            </h1>
                            <h1 className="text-4xl font-bold tracking-tight text-gray-900 sm:text-6xl">
                                Squad
                            </h1>
                        </span>
                        <p className="relative mt-6 text-lg leading-8 text-gray-600 sm:max-w-md lg:max-w-none">
                            This is your squad. Bask in its glory.
                        </p>
                    </div>
                    <div className="w-full mt-14 flex justify-end gap-8 sm:-mt-44 sm:justify-start sm:pl-20 lg:mt-0 lg:pl-0">
                        <ul role="list" className="grid grid-cols-1 gap-x-4 gap-y-8 sm:grid-cols-2 lg:grid-cols-3 xl:gap-x-8">
                            {
                                wallet?.contents?.nfts?.filter((nft) => nft.packageObjectId === TESTNET_NFT_CONTRACT).map((nft) => {
                                    console.log('nft :>> ', nft);
                                    return (
                                        <li key={nft.objectId} className="relative">
                                            <div className="group aspect-w-10 aspect-h-7 block w-full overflow-hidden rounded-lg bg-gray-100 focus-within:ring-2 focus-within:ring-indigo-500 focus-within:ring-offset-2 focus-within:ring-offset-gray-100">
                                                <img
                                                    className="pointer-events-none object-cover group-hover:opacity-75"
                                                    src={nft.imageUrl}
                                                    alt={nft.name}
                                                />
                                                <button type="button" className="absolute inset-0 focus:outline-none">
                                                    <span className="sr-only">View details for {nft.name}</span>
                                                </button>
                                            </div>
                                            <p className="pointer-events-none mt-2 block truncate text-sm font-medium text-gray-900">{nft.name}</p>
                                            <p className="pointer-events-none block text-sm font-medium text-gray-500">{nft.description}</p>
                                        </li>
                                    )
                                })
                            }
                        </ul>
                    </div>
                </div>
            </div>
        </BackgroundProvider>
    );
}

export default MySquad;
