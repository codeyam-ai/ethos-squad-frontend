module ethos::ethos_squad {
    use std::string::{Self, utf8, String};
    use std::vector;

    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::tx_context::{Self, TxContext};

    use sui::sui::SUI;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::pay;
    use sui::transfer;

    use sui::package;
    use sui::display;

    #[test_only]
    friend ethos::ethos_squad_tests;

    const DEFAULT_FEE: u64 = 200_000_000;

    const ENotMaintainer: u64 = 1;
    const ENoBalance: u64 = 2;

    struct ETHOS_SQUAD has drop {}

    struct EthosSquad<phantom T> has key, store {
        id: UID,
        nft: u64
    }

    struct EthosSquad1 has drop {}
    struct EthosSquad2 has drop {}
    struct EthosSquad3 has drop {}
    struct EthosSquad4 has drop {}
    struct EthosSquad5 has drop {}
    struct EthosSquad6 has drop {}
    struct EthosSquad7 has drop {}
    struct EthosSquad8 has drop {}
    struct EthosSquad9 has drop {}
    struct EthosSquad10 has drop {}
    struct EthosSquad11 has drop {}
    struct EthosSquad12 has drop {}
    struct EthosSquad13 has drop {}
    struct EthosSquad14 has drop {}
    struct EthosSquad15 has drop {}
    struct EthosSquad16 has drop {}
    struct EthosSquad17 has drop {}
    struct EthosSquad18 has drop {}
    struct EthosSquad19 has drop {}
    struct EthosSquad20 has drop {}

    struct EthosSquadMaintainer has key {
        id: UID,
        maintainer_address: address,
        nft_count: u64,
        fee: u64,
        balance: Balance<SUI>
    }

    // ===== Events =====

    struct NFTMinted has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: String,
    }

    fun init(otw: ETHOS_SQUAD, ctx: &mut TxContext) {
        let nft = utf8(b"{nft}");
        let project_name = utf8(b"Ethos Squad");
        let project_url = utf8(b"https://ethoswallet.xyz/dashboard");
        let project_image_url = utf8(b"https://ethos-nft.s3.us-east-2.amazonaws.com/Mint_an_NFT.jpg");
        let project_description = utf8(b"A collection of friends to accompany you on the Ethos and SUI adventure!");
        let creator = utf8(b"Ethos");

        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"project_url"),
            utf8(b"project_name"),
            utf8(b"project_image_url"),
            utf8(b"project_description"),
            utf8(b"nft"),
            utf8(b"creator"),
        ];

        let publisher = package::claim(otw, ctx);
        
        let display1 = display::new_with_fields<EthosSquad<EthosSquad1>>(
            &publisher, 
            keys, 
            vector[
                get_name(1),
                get_image_url(1),
                get_description(1),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display1);

        let display2 = display::new_with_fields<EthosSquad<EthosSquad2>>(
            &publisher, 
            keys, 
            vector[
                get_name(2),
                get_image_url(2),
                get_description(2),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display2);

        let display3 = display::new_with_fields<EthosSquad<EthosSquad3>>(
            &publisher, 
            keys, 
            vector[
                get_name(3),
                get_image_url(3),
                get_description(3),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display3);

        let display4 = display::new_with_fields<EthosSquad<EthosSquad4>>(
            &publisher, 
            keys, 
            vector[
                get_name(4),
                get_image_url(4),
                get_description(4),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display4);

        let display5 = display::new_with_fields<EthosSquad<EthosSquad5>>(
            &publisher, 
            keys, 
            vector[
                get_name(5),
                get_image_url(5),
                get_description(5),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display5);

        let display6 = display::new_with_fields<EthosSquad<EthosSquad6>>(
            &publisher, 
            keys, 
            vector[
                get_name(6),
                get_image_url(6),
                get_description(6),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display6);

        let display7 = display::new_with_fields<EthosSquad<EthosSquad7>>(
            &publisher, 
            keys, 
            vector[
                get_name(7),
                get_image_url(7),
                get_description(7),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display7);

        let display8 = display::new_with_fields<EthosSquad<EthosSquad8>>(
            &publisher, 
            keys, 
            vector[
                get_name(8),
                get_image_url(8),
                get_description(8),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display8);

        let display9 = display::new_with_fields<EthosSquad<EthosSquad9>>(
            &publisher, 
            keys, 
            vector[
                get_name(9),
                get_image_url(9),
                get_description(9),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display9);

        let display10 = display::new_with_fields<EthosSquad<EthosSquad10>>(
            &publisher, 
            keys, 
            vector[
                get_name(10),
                get_image_url(10),
                get_description(10),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display10);

        let display11 = display::new_with_fields<EthosSquad<EthosSquad11>>(
            &publisher, 
            keys, 
            vector[
                get_name(11),
                get_image_url(11),
                get_description(11),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display11);

        let display12 = display::new_with_fields<EthosSquad<EthosSquad12>>(
            &publisher, 
            keys, 
            vector[
                get_name(12),
                get_image_url(12),
                get_description(12),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display12);

        let display13 = display::new_with_fields<EthosSquad<EthosSquad13>>(
            &publisher, 
            keys, 
            vector[
                get_name(13),
                get_image_url(13),
                get_description(13),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display13);

        let display14 = display::new_with_fields<EthosSquad<EthosSquad14>>(
            &publisher, 
            keys, 
            vector[
                get_name(14),
                get_image_url(14),
                get_description(14),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display14);

        let display15 = display::new_with_fields<EthosSquad<EthosSquad15>>(
            &publisher, 
            keys, 
            vector[
                get_name(15),
                get_image_url(15),
                get_description(15),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display15);

        let display16 = display::new_with_fields<EthosSquad<EthosSquad16>>(
            &publisher, 
            keys, 
            vector[
                get_name(16),
                get_image_url(16),
                get_description(16),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display16);

        let display17 = display::new_with_fields<EthosSquad<EthosSquad17>>(
            &publisher, 
            keys, 
            vector[
                get_name(17),
                get_image_url(17),
                get_description(17),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display17);

        let display18 = display::new_with_fields<EthosSquad<EthosSquad18>>(
            &publisher, 
            keys, 
            vector[
                get_name(18),
                get_image_url(18),
                get_description(18),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display18);

        let display19 = display::new_with_fields<EthosSquad<EthosSquad19>>(
            &publisher, 
            keys, 
            vector[
                get_name(19),
                get_image_url(19),
                get_description(19),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display19);

        let display20 = display::new_with_fields<EthosSquad<EthosSquad20>>(
            &publisher, 
            keys, 
            vector[
                get_name(20),
                get_image_url(20),
                get_description(20),
                project_url,
                project_name,
                project_image_url,
                project_description,
                nft,
                creator
            ],
            ctx
        );
        display::update_version(&mut display20);

        let maintainer = create_maintainer(ctx);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display1, tx_context::sender(ctx));
        transfer::public_transfer(display2, tx_context::sender(ctx));
        transfer::public_transfer(display3, tx_context::sender(ctx));
        transfer::public_transfer(display4, tx_context::sender(ctx));
        transfer::public_transfer(display5, tx_context::sender(ctx));
        transfer::public_transfer(display6, tx_context::sender(ctx));
        transfer::public_transfer(display7, tx_context::sender(ctx));
        transfer::public_transfer(display8, tx_context::sender(ctx));
        transfer::public_transfer(display9, tx_context::sender(ctx));
        transfer::public_transfer(display10, tx_context::sender(ctx));
        transfer::public_transfer(display11, tx_context::sender(ctx));
        transfer::public_transfer(display12, tx_context::sender(ctx));
        transfer::public_transfer(display13, tx_context::sender(ctx));
        transfer::public_transfer(display14, tx_context::sender(ctx));
        transfer::public_transfer(display15, tx_context::sender(ctx));
        transfer::public_transfer(display16, tx_context::sender(ctx));
        transfer::public_transfer(display17, tx_context::sender(ctx));
        transfer::public_transfer(display18, tx_context::sender(ctx));
        transfer::public_transfer(display19, tx_context::sender(ctx));
        transfer::public_transfer(display20, tx_context::sender(ctx));

        transfer::share_object(maintainer);
    }

    // ===== Entrypoints =====

    /// Create a new ethos nft
    public entry fun mint_to_sender(
        maintainer: &mut EthosSquadMaintainer, 
        fee: vector<Coin<SUI>>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);

        let (paid, remainder) = merge_and_split(fee, maintainer.fee, ctx);

        coin::put(&mut maintainer.balance, paid);
        transfer::public_transfer(remainder, sender);

        let id = object::new(ctx);
        let random = object::uid_to_bytes(&id);
        let digit1 = *vector::borrow(&random, 0) % (10 as u8);
        let digit2 = *vector::borrow(&random, 1) % (2 as u8);
        let index = (((digit2 * 10) + digit1) % 18) + 1;
        let nft = maintainer.nft_count + 1;

        if (index == 1) {
            let ethos_nft = EthosSquad<EthosSquad1> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(1),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 2) {
            let ethos_nft = EthosSquad<EthosSquad2> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(2),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 3) {
            let ethos_nft = EthosSquad<EthosSquad3> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(3),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 4) {
            let ethos_nft = EthosSquad<EthosSquad4> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(4),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 5) {
            let ethos_nft = EthosSquad<EthosSquad5> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(5),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 6) {
            let ethos_nft = EthosSquad<EthosSquad6> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(6),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 7) {
            let ethos_nft = EthosSquad<EthosSquad7> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(7),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 8) {
            let ethos_nft = EthosSquad<EthosSquad8> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(8),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 9) {
            let ethos_nft = EthosSquad<EthosSquad9> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(9),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 10) {
            let ethos_nft = EthosSquad<EthosSquad10> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(10),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 11) {
            let ethos_nft = EthosSquad<EthosSquad11> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(11),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 12) {
            let ethos_nft = EthosSquad<EthosSquad12> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(12),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 13) {
            let ethos_nft = EthosSquad<EthosSquad13> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(13),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 14) {
            let ethos_nft = EthosSquad<EthosSquad14> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(14),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 15) {
            let ethos_nft = EthosSquad<EthosSquad15> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(15),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 16) {
            let ethos_nft = EthosSquad<EthosSquad16> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(16),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 17) {
            let ethos_nft = EthosSquad<EthosSquad17> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(17),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 18) {
            let ethos_nft = EthosSquad<EthosSquad18> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(18),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else if (index == 19) {
            let ethos_nft = EthosSquad<EthosSquad19> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(19),
            });

            transfer::public_transfer(ethos_nft, sender);
        } else {
            let ethos_nft = EthosSquad<EthosSquad20> { id, nft };

            event::emit(NFTMinted {
                object_id: object::id(&ethos_nft),
                creator: sender,
                name: get_name(20),
            });

            transfer::public_transfer(ethos_nft, sender);
        };

        maintainer.nft_count = maintainer.nft_count + 1;
    }

    public entry fun pay_maintainer(maintainer: &mut EthosSquadMaintainer, ctx: &mut TxContext) {
        assert!(tx_context::sender(ctx) == maintainer.maintainer_address, ENotMaintainer);
        let amount = balance::value<SUI>(&maintainer.balance);
        assert!(amount > 0, ENoBalance);
        let payment = coin::take(&mut maintainer.balance, amount, ctx);
        transfer::public_transfer(payment, tx_context::sender(ctx));
    }

    public entry fun change_maintainer(maintainer: &mut EthosSquadMaintainer, new_maintainer: address, ctx: &mut TxContext) {
        assert!(tx_context::sender(ctx) == maintainer.maintainer_address, ENotMaintainer);
        maintainer.maintainer_address = new_maintainer;
    }

    public entry fun change_fee(maintainer: &mut EthosSquadMaintainer, new_fee: u64, ctx: &mut TxContext) {
        assert!(tx_context::sender(ctx) == maintainer.maintainer_address, ENotMaintainer);
        maintainer.fee = new_fee;
    }

    public fun count<T>(nft: &EthosSquad<T>): &u64 {
        &nft.nft
    }

    fun get_name(index: u8): String {
        if (index == 1) {
            return utf8(b"Bonezy")
        } else if (index == 2) {
            return utf8(b"Chirp")
        } else if (index == 3) {
            return utf8(b"Ethmaus")
        } else if (index == 4) {
            return utf8(b"Fred")
        } else if (index == 5) {
            return utf8(b"Loupe The Flower")
        } else if (index == 6) {
            return utf8(b"Mimi The Cat")
        } else if (index == 7) {
            return utf8(b"Mystie OK")
        } else if (index == 8) {
            return utf8(b"Nano The Mars")
        } else if (index == 9) {
            return utf8(b"Suive")
        } else if (index == 10) {
            return utf8(b"Ethos Bonezy")
        } else if (index == 11) {
            return utf8(b"Ethos Chirp")
        } else if (index == 12) {
            return utf8(b"Ethos Ethmaus")
        } else if (index == 13) {
            return utf8(b"Ethos Fred")
        } else if (index == 14) {
            return utf8(b"Ethos Loupe The Flower")
        } else if (index == 15) {
            return utf8(b"Ethos Mimi The Cat")
        } else if (index == 16) {
            return utf8(b"Ethos Mystie OK")
        } else if (index == 17) {
            return utf8(b"Ethos Nano The Mars")
        } else if (index == 18) {
            return utf8(b"Ethos Suive")
        } else {
            return utf8(b"Squad")
        }
    }

    fun get_image_url(index: u8): String {
        let base = utf8(b"https://ethos-nft.s3.us-east-2.amazonaws.com/");
        let extension = utf8(b".gif");
        string::append(&mut base, get_name(index));
        string::append(&mut base, extension);
        base
    }

    fun get_description(index: u8): String {
        if (index == 1 || index == 10) {
            return utf8(b"Bonezy, the mischievous skull with a toothy grin and an insatiable appetite for puns.")
        } else if (index == 2 || index == 11) {
            return utf8(b"Chirp, the plucky one-eyed bird who always keeps a lookout for the tastiest worms and never misses a beat with her cheerful chirping.")
        } else if (index == 3 || index == 12) {
            return utf8(b"Ethmaus, a playful pup whose wagging tail and whimsical expressions bring joy to all who meet him!")
        } else if (index == 4 || index == 13) {
            return utf8(b"Fred, the zany inventor who always has a new gadget up his sleeve and a mischievous twinkle in his eye.")
        } else if (index == 5 || index == 14) {
            return utf8(b"Loupe, the carefree sunflower who always turns her face towards the light.")
        } else if (index == 6 || index == 15) {
            return utf8(b"Mimi, the mischievous feline who loves to play hide and seek, especially when it involves stealing socks.")
        } else if (index == 7 || index == 16) {
            return utf8(b"Mystie OK, the whimsical mouse with a flair for the mysterious, who loves to set out on adventures in search of hidden treasures.")
        } else if (index == 8 || index == 17) {
            return utf8(b"Nano, the curious and adventurous Martian who loves to explore new planets, gather samples, and solve mysteries about the universe.")
        } else if (index == 9 || index == 18) {
            return utf8(b"Suive, the lovable bovine with a heart of gold, who enjoys nothing more than grazing in the fields and singing her favorite songs to the moo-n.")
        };

        utf8(b"The forgotten member of the Ethos Squad.")
    }

    public(friend) fun create_maintainer(ctx: &mut TxContext): EthosSquadMaintainer {
        EthosSquadMaintainer {
            id: object::new(ctx),
            maintainer_address: tx_context::sender(ctx),
            nft_count: 0,
            fee: DEFAULT_FEE,
            balance: balance::zero<SUI>()
        }
    }

    fun merge_and_split(
        coins: vector<Coin<SUI>>, amount: u64, ctx: &mut TxContext
    ): (Coin<SUI>, Coin<SUI>) {
        let base = vector::pop_back(&mut coins);
        pay::join_vec(&mut base, coins);
        let coin_value = coin::value(&base);
        assert!(coin_value >= amount, coin_value);
        (coin::split(&mut base, amount, ctx), base)
    }
}
