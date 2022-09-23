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
