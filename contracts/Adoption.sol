pragma solidity ^0.4.23;

contract Adoption {
    
    address[16] public Adopters;

    // Adopting a Pet
    function adopt(uint petId) public returns (uint) {

        require(petId >= 0 && petId <= 15, "The Pet ID is outside the range.");

        Adopters[petId] = msg.sender;

        return petId;
    }

    function getAdopters() public view returns (address[16]) {
        return Adopters;
    }
}