pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {

    uint _petId = 8;
    Adoption _adoption = Adoption(DeployedAddresses.Adoption());

    function testUserCanAdoptPet() public {
        uint returnedId = _adoption.adopt(_petId);
        Assert.equal(returnedId, _petId, "Adoption of pet failed");
    }

    function testGetAdopterAddressByPetId() public {
        // Expected owner in this contract
        address ownerAddress = this;

        address adopterAddress = _adoption.Adopters(_petId);

        Assert.equal(adopterAddress, ownerAddress, "Owner of pet ID 8 should be recorded.");
    }

    function testGetAdopterAddressByPetIdInArray() public {
        // Expected owner in this contract
        address ownerAddress = this;

        address[16] memory adopters = _adoption.getAdopters();

        Assert.equal(adopters[_petId], ownerAddress, "Owner of pet ID 8 should be recorded.");
    }
}