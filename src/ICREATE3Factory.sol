// SPDX-License-Identifier: AGPL-3.0
pragma solidity >=0.6.0;

/// @dev The CREATE3 factory's address, deployed using CREATE2.
address constant CREATE3_FACTORY_ADDRESS = 0x6aA3D87e99286946161dCA02B97C5806fC5eD46F;

/// @dev The CREATE3 factory's instance.
ICREATE3Factory constant CREATE3_FACTORY = ICREATE3Factory(CREATE3_FACTORY_ADDRESS);

/// @title Factory for deploying contracts to deterministic addresses via CREATE3
/// @author zefram.eth
/// @notice Enables deploying contracts using CREATE3. Each deployer (msg.sender) has
/// its own namespace for deployed addresses.
interface ICREATE3Factory {
    /// @notice Deploys a contract using CREATE3
    /// @dev The provided salt is hashed together with msg.sender to generate the final salt
    /// @param salt The deployer-specific salt for determining the deployed contract's address
    /// @param creationCode The creation code of the contract to deploy
    /// @return deployed The address of the deployed contract
    function deploy(bytes32 salt, bytes memory creationCode)
        external
        payable
        returns (address deployed);

    /// @notice Predicts the address of a deployed contract
    /// @dev The provided salt is hashed together with the deployer address to generate the final salt
    /// @param deployer The deployer account that will call deploy()
    /// @param salt The deployer-specific salt for determining the deployed contract's address
    /// @return deployed The address of the contract that will be deployed
    function getDeployed(address deployer, bytes32 salt)
        external
        view
        returns (address deployed);
}
