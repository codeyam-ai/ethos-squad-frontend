import { EthosConnectStatus, ethos } from 'ethos-connect';
import { useCallback, useState } from 'react';
import { toast } from 'react-toastify';
import mintNft from '../lib/mintNft';
import { BackgroundProvider } from '../components/BackgroundProvider';

export default function Home() {
    const [loading, setLoading] = useState(false);
    const { status, wallet } = ethos.useWallet();

    const mint = useCallback(async () => {
        if (!wallet) {
            return;
        }
        setLoading(true);
        const mintResult = await mintNft(wallet);
        setLoading(false);
        if (mintResult.error) {
            console.error('ERROR:', mintResult.error);
            toast('Oops! There was an error minting your Squad member.', { type: 'error' })
        } else {
            console.log(mintResult);
            const mintResultData = mintResult.result.data.display.data
            toast(
                `Congrats, you just minted ${mintResultData.name}!`,
                {
                    type: 'success',
                    icon: <img src={mintResultData.image_url} alt={mintResultData.description} />,
                }
            )
        }
    }, [wallet])

    return (
        <BackgroundProvider>
            <div className="mx-auto max-w-7xl px-6 pb-32 pt-36 sm:pt-60 lg:px-8 lg:pt-32">
                <div className="mx-auto max-w-2xl gap-x-14 lg:mx-0 lg:flex lg:max-w-none lg:items-center">
                    <div className="w-full max-w-xl lg:shrink-0 xl:max-w-2xl">
                        <span className='flex gap-2'>
                            <h1 className="text-4xl font-light tracking-tight text-gray-900 sm:text-6xl">
                                Join the
                            </h1>
                            <h1 className="text-4xl font-bold tracking-tight text-gray-900 sm:text-6xl">
                                Squad
                            </h1>
                        </span>
                        <p className="relative mt-6 text-lg leading-8 text-gray-600 sm:max-w-md lg:max-w-none">
                            Mint your Squad NFTs only on Sui. Join the community and get access to exclusive benefits.
                        </p>
                        {
                            status === EthosConnectStatus.Connected ? (
                                <div className="mt-10 flex items-center gap-x-6">
                                    <button
                                        className="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                                        onClick={mint}
                                        disabled={loading}
                                    >
                                        {loading ? 'Minting...' : 'Mint a Squad Member'}
                                    </button>

                                    <a href="/my-squad" className="text-sm font-semibold leading-6 text-gray-900">
                                        See your Squad <span aria-hidden="true">→</span>
                                    </a>
                                </div>
                            ) : (
                                <button
                                    className="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                                    onClick={ethos.showSignInModal}
                                >
                                    Connect Wallet to Mint
                                </button>
                            )
                        }
                    </div>
                    <div className="mt-14 flex justify-end gap-8 sm:-mt-44 sm:justify-start sm:pl-20 lg:mt-0 lg:pl-0">
                        <div className="ml-auto w-44 flex-none space-y-8 pt-32 sm:ml-0 sm:pt-80 lg:order-last lg:pt-36 xl:order-none xl:pt-80">
                            <div className="relative">
                                <img
                                    src="https://ethos-nft.s3.us-east-2.amazonaws.com/Mimi%20The%20Cat.gif"
                                    alt=""
                                    className="aspect-[2/3] w-full rounded-xl bg-gray-900/5 object-cover shadow-lg"
                                />
                                <div className="pointer-events-none absolute inset-0 rounded-xl ring-1 ring-inset ring-gray-900/10" />
                            </div>
                        </div>
                        <div className="mr-auto w-44 flex-none space-y-8 sm:mr-0 sm:pt-52 lg:pt-36">
                            <div className="relative">
                                <img
                                    src="https://ethos-nft.s3.us-east-2.amazonaws.com/Ethos%20Bonezy.gif"
                                    alt=""
                                    className="aspect-[2/3] w-full rounded-xl bg-gray-900/5 object-cover shadow-lg"
                                />
                                <div className="pointer-events-none absolute inset-0 rounded-xl ring-1 ring-inset ring-gray-900/10" />
                            </div>
                            <div className="relative">
                                <img
                                    src="https://ethos-nft.s3.us-east-2.amazonaws.com/Ethmaus.gif"
                                    alt=""
                                    className="aspect-[2/3] w-full rounded-xl bg-gray-900/5 object-cover shadow-lg"
                                />
                                <div className="pointer-events-none absolute inset-0 rounded-xl ring-1 ring-inset ring-gray-900/10" />
                            </div>
                        </div>
                        <div className="w-44 flex-none space-y-8 pt-32 sm:pt-0">
                            <div className="relative">
                                <img
                                    src="https://ethos-nft.s3.us-east-2.amazonaws.com/Mystie%20OK.gif"
                                    alt=""
                                    className="aspect-[2/3] w-full rounded-xl bg-gray-900/5 object-cover shadow-lg"
                                />
                                <div className="pointer-events-none absolute inset-0 rounded-xl ring-1 ring-inset ring-gray-900/10" />
                            </div>
                            <div className="relative">
                                <img
                                    src="https://ethos-nft.s3.us-east-2.amazonaws.com/Ethos%20Fred.gif"
                                    alt=""
                                    className="aspect-[2/3] w-full rounded-xl bg-gray-900/5 object-cover shadow-lg"
                                />
                                <div className="pointer-events-none absolute inset-0 rounded-xl ring-1 ring-inset ring-gray-900/10" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </BackgroundProvider>
    )
}
