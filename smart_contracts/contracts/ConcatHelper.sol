pragma solidity >=0.4.0 <0.6.0;

library ConcatHelper {
    function concat(bytes memory a, bytes memory b, bytes memory c)
            internal pure returns (bytes memory) {
        return abi.encodePacked(a, b, c);
    }
}