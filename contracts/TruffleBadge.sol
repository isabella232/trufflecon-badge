pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract TruffleBadge is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _badgeIds;

    constructor() ERC721("TruffleBadge", "TRFL") public {
    }

    function claimBadge(string memory attendenceBadgeURI)
        public
        returns (uint256)
    {
        _badgeIds.increment();

        uint256 newBadgeId = _badgeIds.current();
        _mint(msg.sender, newBadgeId);
        _setTokenURI(newBadgeId, "https://ipfs.infura-ipfs.io/ipfs/QmQcqMmMx1vn8FoN2RtPubsSpKWTFAWsE1p6hdvwv7ofo8/badge1.png");

        return newBadgeId;
    }
}