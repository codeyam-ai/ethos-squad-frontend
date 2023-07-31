#[test_only]
module ethos::ethos_squad_tests {
    use std::option;

    use sui::test_scenario::{Self, Scenario};
    use sui::sui::SUI;
    use sui::coin::{Self};

    use ethos::ethos_squad::{Self, EthosSquad, EthosSquad7, EthosSquadMaintainer};

    const MINTER: address = @0xCAFE;

    fun mint(scenario: &mut Scenario) {
        let ctx = test_scenario::ctx(scenario);

        let maintainer = ethos_squad::create_maintainer(ctx);

        let coins = vector[
            coin::mint_for_testing<SUI>(150_000_000, ctx),
            coin::mint_for_testing<SUI>(30_000_000, ctx),
            coin::mint_for_testing<SUI>(40_000_000, ctx)
        ];

        ethos_squad::mint_to_sender(&mut maintainer, coins, ctx);

        sui::test_utils::destroy<EthosSquadMaintainer>(maintainer);
    }

    #[test]
    fun test_mint() {
        let scenario = test_scenario::begin(MINTER);
        {
            let index = 0;
            while (index < 50) {
                mint(&mut scenario);
                index = index + 1;
            }
        };

        test_scenario::next_tx(&mut scenario, MINTER);
        {
            let nft_id = test_scenario::most_recent_id_for_sender<EthosSquad<EthosSquad7>>(&mut scenario);
            let nft = test_scenario::take_from_sender_by_id<EthosSquad<EthosSquad7>>(&mut scenario, option::destroy_some((nft_id)));

            assert!(ethos_squad::count(&nft) == &1, *ethos_squad::count(&nft));

            test_scenario::return_to_sender(&mut scenario, nft)
        };

        test_scenario::end(scenario);
    }
}