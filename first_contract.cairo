//1. Declare this file as a StarkNet contract.

%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin


//2. Declare storage variable to store contract's state
@storage_var
func balance() -> (res: felt) {
}


//3. Define functions to query or modify contract's state
@external
func increase_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(amount: felt) {
    let (res) = balance.read(); //Read value of the balance
    balance.write(res + amount); //Increase value of the balance by given amount
    return();    
}

@view
func get_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (res: felt){
    let (res) = balance.read(); //Read value of the balance
    return (res = res);         // return value of the balance
}


//export STARKNET_NETWORK=alpha-goerli
//export STARKNET_WALLET=starkware.starknet.wallets.open_zeppelin.OpenZeppelinAccount

//Contract class hash: 0x68704d18de8ccf71da7c9761ee53efd44dcfcfd512eddfac9c396e7d175e234
//Transaction hash: 0x256667f92838cb298b968d2b4b50d28c7c9a7328276cba19956d9a6f8a26e2

// Invoke transaction for contract deployment was sent.
// Contract address: 0x065d72ea4a35809636a9734d7db7447ef3d68e08bcc63c9448f2294c6279d294
// Transaction hash: 0x6c41b53373497c177ce9f927f16c8678ca5ea91e6fecf82c460135244db9f88


starknet call --address ${CONTRACT_ADDRESS} --abi first_contract_abi.json --function get_balance