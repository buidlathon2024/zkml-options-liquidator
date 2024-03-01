// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";
import "./Verifier.sol";

contract MockProtocol {
    Halo2Verifier public verifier;

    function liquidate() public {
        // Check the input before spending the gas to verify the proof
        if (1==2) {
            // revert("Not delinquent!");
            console.log("Not delinquent!");
        } else {
            // Perform liquidation here
            console.log("Liquidating...");
        }
        uint256[] memory instances = new uint256[](1); 
        instances[0] = 0x7b00000000000000000000000000000000000000000000000000000000000000;
        //instances[0] = 0x000000000000000000000000000000000000000000000000000000000000007b; // little endian maybe?
        // uint8[3040] memory proofBytes = [11,28,186,199,151,147,170,187,182,64,122,61,48,93,53,151,166,30,183,157,143,2,205,91,168,184,10,36,188,187,130,54,44,102,147,177,73,34,0,20,243,174,233,37,219,218,189,251,196,119,127,202,62,59,81,45,169,32,60,153,126,24,214,9,34,15,231,94,172,252,182,98,160,215,88,233,174,1,35,207,89,52,162,29,223,151,33,17,215,148,122,45,46,147,221,117,32,148,66,182,0,182,129,200,190,61,17,16,230,157,210,191,86,221,51,176,116,45,190,228,104,142,194,87,2,104,125,247,36,150,184,162,112,153,214,183,177,58,107,114,3,71,92,93,41,253,16,88,165,42,53,130,248,71,94,91,129,4,186,8,2,190,198,120,215,163,164,54,242,30,77,43,143,148,95,208,69,136,23,143,53,216,122,200,187,140,242,60,68,241,59,226,0,252,85,131,0,110,130,73,194,228,157,21,74,11,138,239,118,49,40,174,69,179,240,119,7,186,195,128,101,144,31,133,2,243,57,116,81,229,218,178,136,148,92,6,119,49,86,234,223,155,3,241,152,226,15,133,97,73,206,89,18,121,218,159,28,87,89,131,227,35,63,219,222,144,240,1,6,149,229,38,158,248,177,189,152,250,51,63,129,37,236,248,144,85,196,1,16,100,176,138,41,42,212,97,208,240,125,235,51,51,179,78,114,206,42,221,182,34,197,191,184,238,6,124,78,19,171,163,14,3,239,154,117,212,22,176,63,155,107,80,102,13,155,151,18,209,77,155,121,127,84,101,58,177,169,250,166,9,154,218,10,215,131,202,74,6,5,100,113,66,20,157,56,152,36,201,76,74,116,11,67,180,161,109,196,130,165,90,83,61,37,82,25,24,88,176,150,63,24,166,62,169,249,60,198,134,172,240,98,35,158,71,139,134,118,93,138,187,56,166,208,181,10,18,5,248,188,162,155,95,245,255,145,163,85,241,22,163,36,99,129,31,223,172,128,16,205,23,18,186,25,111,136,246,244,171,44,195,88,195,104,14,79,17,51,157,123,33,174,91,73,244,68,237,254,54,134,56,213,42,232,15,190,56,184,178,242,227,25,201,14,126,168,27,173,32,161,52,59,242,82,172,39,134,93,51,8,163,111,182,93,183,65,80,156,130,201,36,245,128,48,46,237,139,34,57,139,219,126,157,203,50,127,123,137,181,42,207,202,108,160,226,74,179,227,129,69,149,216,70,250,26,13,16,222,13,177,210,132,101,42,16,77,228,36,29,60,2,95,91,233,115,168,73,7,162,175,110,212,163,41,24,56,221,7,126,57,169,130,129,131,183,247,27,55,56,165,229,18,193,125,227,118,15,13,87,13,141,107,97,152,210,0,6,117,218,40,222,234,29,9,176,12,152,169,7,3,127,246,47,239,252,14,55,205,24,53,209,94,31,142,176,193,63,99,125,200,118,45,42,206,5,172,116,10,90,180,103,141,51,180,6,6,1,213,42,167,170,127,154,245,213,98,65,118,82,33,132,180,43,34,119,170,20,35,49,181,43,142,186,156,97,100,161,52,183,87,85,123,104,50,125,248,123,230,115,209,64,19,200,233,147,38,111,188,215,127,63,165,122,138,81,128,99,216,208,39,160,24,187,1,2,171,99,123,42,67,92,76,106,187,53,119,160,36,83,156,23,130,8,149,55,98,99,204,84,73,109,67,163,61,156,158,193,119,134,103,104,213,197,91,141,160,254,179,231,38,88,44,249,153,135,67,251,211,217,216,110,10,161,63,158,151,102,118,171,154,176,36,227,24,32,252,126,42,147,161,65,40,8,162,132,24,65,25,160,42,16,5,101,74,103,222,96,241,88,91,54,180,14,150,26,169,193,2,252,6,238,233,103,38,6,10,135,196,32,10,131,54,129,140,146,10,186,63,63,22,18,164,156,123,211,129,136,231,237,169,185,42,52,159,66,0,94,98,228,79,157,6,162,212,244,152,242,213,163,99,97,93,172,30,151,21,82,55,143,129,222,52,165,82,31,2,136,31,234,159,59,106,212,164,75,187,203,167,250,52,211,198,19,19,15,182,76,28,208,197,215,216,210,14,253,11,138,200,54,17,133,205,57,17,244,116,174,85,177,214,247,199,221,71,190,234,64,83,197,106,171,1,232,33,158,161,249,112,26,227,129,29,189,99,109,122,254,70,17,209,238,70,173,195,90,56,176,70,221,235,148,151,125,107,227,236,169,25,42,186,8,226,46,43,54,74,220,248,188,96,164,230,157,106,17,42,0,241,97,98,147,44,113,17,139,36,199,147,20,2,245,84,64,59,143,45,171,218,61,92,163,159,66,183,28,212,168,104,112,163,60,162,194,90,231,120,243,218,136,145,44,160,76,20,212,236,146,20,247,242,252,171,196,26,8,198,153,148,94,2,190,116,59,94,88,35,243,40,62,69,51,31,182,31,151,118,228,86,78,11,219,155,156,229,253,90,85,53,167,70,5,26,39,114,45,70,153,208,95,225,174,130,218,166,28,193,184,147,198,8,140,13,98,30,224,134,212,14,186,245,96,146,216,146,225,114,227,98,100,133,66,13,62,234,164,111,124,32,50,51,224,98,252,11,3,78,152,13,250,195,109,251,47,24,70,113,84,109,215,100,1,27,204,92,80,215,153,1,115,21,45,3,173,254,124,17,25,124,72,17,70,169,62,54,233,101,155,79,12,171,135,197,45,125,145,164,183,242,147,141,100,12,50,250,135,46,236,15,73,35,222,51,166,30,3,85,200,181,192,185,205,139,134,220,46,232,154,81,234,202,214,161,123,46,86,204,109,23,251,36,87,75,228,219,239,170,24,39,5,98,178,76,115,204,145,139,142,43,42,239,6,215,42,57,192,171,96,34,29,183,55,35,138,96,215,39,23,157,135,76,63,237,151,228,203,105,190,197,172,8,166,57,240,244,132,228,59,6,111,64,229,58,107,1,129,166,7,10,164,127,198,119,143,222,60,226,98,162,10,189,168,231,21,117,250,124,149,183,11,232,130,136,1,141,61,32,175,150,255,223,87,143,53,206,138,180,151,26,77,187,237,161,69,184,71,130,52,96,229,223,126,163,228,126,76,245,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,197,224,227,141,165,130,161,237,70,51,146,143,90,134,244,18,73,116,104,112,95,5,52,171,167,28,196,20,82,86,245,11,110,79,181,206,103,116,133,138,6,202,254,38,105,229,191,163,77,83,188,144,213,201,243,220,56,191,69,29,152,186,181,43,88,230,155,95,64,174,250,240,125,35,252,68,199,100,124,76,14,125,120,78,201,178,103,34,134,192,150,28,181,158,75,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,46,43,245,202,129,246,110,227,248,106,53,239,168,250,179,25,202,67,149,141,236,114,214,239,45,152,246,60,233,66,51,89,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21,154,177,143,250,102,93,234,40,16,78,112,181,148,245,194,12,172,14,196,3,57,24,214,62,30,84,144,28,48,3,193,4,126,236,56,124,124,127,9,231,107,191,42,62,175,42,65,65,195,196,140,211,169,81,107,18,15,1,123,151,135,4,69,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,58,225,208,220,234,134,119,141,218,210,195,143,26,72,40,245,117,77,74,214,37,14,62,215,156,112,114,15,79,28,8,31,58,225,208,220,234,134,119,141,218,210,195,143,26,72,40,245,117,77,74,214,37,14,62,215,156,112,114,15,79,28,8,45,172,67,255,200,32,220,54,22,178,200,50,122,44,166,165,57,7,170,142,80,206,175,112,234,226,210,241,18,241,224,237,15,116,189,39,140,125,9,225,32,10,145,190,120,122,161,65,33,177,169,248,12,109,56,109,122,206,76,251,111,143,27,79,43,65,67,247,91,35,187,66,239,193,134,158,144,65,203,26,186,211,29,181,236,39,38,228,31,44,183,158,192,86,141,160,15,233,117,66,78,245,101,72,7,57,182,36,75,153,34,240,191,146,233,153,64,181,111,88,116,196,242,176,115,43,31,97,22,200,68,40,107,212,204,130,5,186,55,18,153,0,69,33,192,197,169,10,68,134,15,59,80,30,13,25,128,144,246,127,6,226,54,96,96,234,75,87,114,237,230,126,213,134,176,234,86,65,54,107,248,176,227,224,98,229,66,92,105,205,210,248,21,151,237,45,247,224,55,126,251,45,33,89,202,5,220,98,193,212,230,23,2,119,148,27,170,134,19,212,211,120,101,193,32,4,105,135,245,156,145,108,34,196,92,62,178,124,152,6,195,77,31,134,107,71,2,75,139,77,121,17,117,45,252,234,29,86,193,111,51,19,82,140,54,66,159,183,43,78,51,112,253,26,227,37,182,196,131,89,88,194,106,196,54,13,171,164,48,64,253,191,251,27,250,69,246,216,183,67,155,170,40,132,35,128,139,23,165,167,133,202,17,201,26,119,94,217,189,151,39,135,248,97,167,83,245,7,116,131,90,55,229,223,163,131,82,81,64,187,121,43,170,157,53,50,24,12,215,201,233,230,44,41,99,33,149,210,92,218,29,107,146,133,29,53,207,81,121,147,64,220,116,177,223,161,245,204,232,6,37,54,16,85,15,79,89,14,232,164,40,29,89,141,99,116,9,166,199,207,119,71,22,199,69,217,173,40,95,167,88,113,83,143,100,25,44,112,65,61,149,20,75,54,35,251,72,60,84,72,152,82,106,125,37,190,14,111,149,76,247,48,181,109,26,16,97,9,47,178,44,123,127,141,56,60,215,249,211,237,145,158,121,40,254,171,34,66,102,147,133,247,146,13,69,241,197,54,215,81,10,1,157,33,24,239,18,5,176,160,99,153,235,2,15,238,211,6,205,72,180,114,80,99,187,197,52,200,214,92,107,61,31,24,188,58,147,45,184,48,71,185,176,163,218,223,70,208,28,71,241,227,250,229,112,205,105,54,87,123,190,80,136,185,6,94,87,35,37,175,102,11,84,10,210,120,2,188,6,89,214,177,171,149,219,11,165,71,40,23,183,26,155,230,134,70,19,151,204,132,61,113,2,75,150,191,247,50,164,126,167,153,220,32,214,205,181,1,106,11,64,58,52,55,87,226,120,245,22,93,30,46,46,108,6,198,71,47,141,137,59,251,41,64,146,2,89,91,219,198,212,216,114,63,149,123,150,147,33,68,5,207,45,68,237,123,68,128,139,98,85,143,143,119,69,62,133,188,69,112,9,131,226,132,219,76,126,99,35,78,98,137,22,212,232,105,179,122,45,126,44,160,204,25,166,47,143,97,142,83,148,8,123,87,20,137,74,52,45,11,200,65,134,183,42,108,80,74,79,138,200,182,1,14,151,232,9,173,22,61,148,22,121,15,214,118,221,161,117,235,45,92,209,216,19,162,3,165,60,195,5,151,12,54,142,148,69,223,212,132,215,249,22,196,128,162,74,191,200,86,127,74,228,255,83,246,218,180,26,92,127,216,104,131,103,217,118,205,244,125,153,125,36,23,222,154,15,160,225,183,222,202,54,246,56,228,197,89,251,140,5,38,135,119,34,203,222,36,84,58,107,79,210,47,198,55,241,217,114,185,224,209,76,123,201,167,37,87,215,162,23,26,33,152,139,93,7,102,221,227,26,117,194,54,146,165,218,101,53,166,159,178,53,120,151,222,208,92,223,216,184,75,142,242];
        // bytes memory proof = new bytes(proofBytes.length);
        // for (uint i = 0; i < proofBytes.length; i++) {
        //     proof[i] = bytes1(proofBytes[i]);
        // }
        bytes memory proof = "0x0b1cbac79793aabbb6407a3d305d3597a61eb79d8f02cd5ba8b80a24bcbb82362c6693b149220014f3aee925dbdabdfbc4777fca3e3b512da9203c997e18d609220fe75eacfcb662a0d758e9ae0123cf5934a21ddf972111d7947a2d2e93dd75209442b600b681c8be3d1110e69dd2bf56dd33b0742dbee4688ec25702687df72496b8a27099d6b7b13a6b7203475c5d29fd1058a52a3582f8475e5b8104ba0802bec678d7a3a436f21e4d2b8f945fd04588178f35d87ac8bb8cf23c44f13be200fc5583006e8249c2e49d154a0b8aef763128ae45b3f07707bac38065901f8502f3397451e5dab288945c06773156eadf9b03f198e20f856149ce591279da9f1c575983e3233fdbde90f0010695e5269ef8b1bd98fa333f8125ecf89055c4011064b08a292ad461d0f07deb3333b34e72ce2addb622c5bfb8ee067c4e13aba30e03ef9a75d416b03f9b6b50660d9b9712d14d9b797f54653ab1a9faa6099ada0ad783ca4a0605647142149d389824c94c4a740b43b4a16dc482a55a533d2552191858b0963f18a63ea9f93cc686acf062239e478b86765d8abb38a6d0b50a1205f8bca29b5ff5ff91a355f116a32463811fdfac8010cd1712ba196f88f6f4ab2cc358c3680e4f11339d7b21ae5b49f444edfe368638d52ae80fbe38b8b2f2e319c90e7ea81bad20a1343bf252ac27865d3308a36fb65db741509c82c924f580302eed8b22398bdb7e9dcb327f7b89b52acfca6ca0e24ab3e3814595d846fa1a0d10de0db1d284652a104de4241d3c025f5be973a84907a2af6ed4a3291838dd077e39a9828183b7f71b3738a5e512c17de3760f0d570d8d6b6198d2000675da28deea1d09b00c98a907037ff62feffc0e37cd1835d15e1f8eb0c13f637dc8762d2ace05ac740a5ab4678d33b4060601d52aa7aa7f9af5d5624176522184b42b2277aa142331b52b8eba9c6164a134b757557b68327df87be673d14013c8e993266fbcd77f3fa57a8a518063d8d027a018bb0102ab637b2a435c4c6abb3577a024539c17820895376263cc54496d43a33d9c9ec177866768d5c55b8da0feb3e726582cf9998743fbd3d9d86e0aa13f9e976676ab9ab024e31820fc7e2a93a1412808a284184119a02a1005654a67de60f1585b36b40e961aa9c102fc06eee96726060a87c4200a8336818c920aba3f3f1612a49c7bd38188e7eda9b92a349f42005e62e44f9d06a2d4f498f2d5a363615dac1e971552378f81de34a5521f02881fea9f3b6ad4a44bbbcba7fa34d3c613130fb64c1cd0c5d7d8d20efd0b8ac8361185cd3911f474ae55b1d6f7c7dd47beea4053c56aab01e8219ea1f9701ae3811dbd636d7afe4611d1ee46adc35a38b046ddeb94977d6be3eca9192aba08e22e2b364adcf8bc60a4e69d6a112a00f16162932c71118b24c7931402f554403b8f2dabda3d5ca39f42b71cd4a86870a33ca2c25ae778f3da88912ca04c14d4ec9214f7f2fcabc41a08c699945e02be743b5e5823f3283e45331fb61f9776e4564e0bdb9b9ce5fd5a5535a746051a27722d4699d05fe1ae82daa61cc1b893c6088c0d621ee086d40ebaf56092d892e172e3626485420d3eeaa46f7c203233e062fc0b034e980dfac36dfb2f184671546dd764011bcc5c50d7990173152d03adfe7c11197c481146a93e36e9659b4f0cab87c52d7d91a4b7f2938d640c32fa872eec0f4923de33a61e0355c8b5c0b9cd8b86dc2ee89a51eacad6a17b2e56cc6d17fb24574be4dbefaa18270562b24c73cc918b8e2b2aef06d72a39c0ab60221db737238a60d727179d874c3fed97e4cb69bec5ac08a639f0f484e43b066f40e53a6b0181a6070aa47fc6778fde3ce262a20abda8e71575fa7c95b70be88288018d3d20af96ffdf578f35ce8ab4971a4dbbeda145b847823460e5df7ea3e47e4cf50b000000000000000000000000000000000000000000000000000000000000000008c5e0e38da582a1ed4633928f5a86f412497468705f0534aba71cc4145256f50b6e4fb5ce6774858a06cafe2669e5bfa34d53bc90d5c9f3dc38bf451d98bab52b58e69b5f40aefaf07d23fc44c7647c4c0e7d784ec9b2672286c0961cb59e4b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002e2bf5ca81f66ee3f86a35efa8fab319ca43958dec72d6ef2d98f63ce9423359000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000159ab18ffa665dea28104e70b594f5c20cac0ec4033918d63e1e54901c3003c1047eec387c7c7f09e76bbf2a3eaf2a4141c3c48cd3a9516b120f017b9787044500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001f3ae1d0dcea86778ddad2c38f1a4828f5754d4ad6250e3ed79c70720f4f1c081f3ae1d0dcea86778ddad2c38f1a4828f5754d4ad6250e3ed79c70720f4f1c082dac43ffc820dc3616b2c8327a2ca6a53907aa8e50ceaf70eae2d2f112f1e0ed0f74bd278c7d09e1200a91be787aa14121b1a9f80c6d386d7ace4cfb6f8f1b4f2b4143f75b23bb42efc1869e9041cb1abad31db5ec2726e41f2cb79ec0568da00fe975424ef565480739b6244b9922f0bf92e99940b56f5874c4f2b0732b1f6116c844286bd4cc8205ba371299004521c0c5a90a44860f3b501e0d198090f67f06e2366060ea4b5772ede67ed586b0ea5641366bf8b0e3e062e5425c69cdd2f81597ed2df7e0377efb2d2159ca05dc62c1d4e6170277941baa8613d4d37865c120046987f59c916c22c45c3eb27c9806c34d1f866b47024b8b4d7911752dfcea1d56c16f3313528c36429fb72b4e3370fd1ae325b6c4835958c26ac4360daba43040fdbffb1bfa45f6d8b7439baa288423808b17a5a785ca11c91a775ed9bd972787f861a753f50774835a37e5dfa383525140bb792baa9d3532180cd7c9e9e62c29632195d25cda1d6b92851d35cf51799340dc74b1dfa1f5cce806253610550f4f590ee8a4281d598d637409a6c7cf774716c745d9ad285fa75871538f64192c70413d95144b3623fb483c544898526a7d25be0e6f954cf730b56d1a1061092fb22c7b7f8d383cd7f9d3ed919e7928feab2242669385f7920d45f1c536d7510a019d2118ef1205b0a06399eb020feed306cd48b4725063bbc534c8d65c6b3d1f18bc3a932db83047b9b0a3dadf46d01c47f1e3fae570cd6936577bbe5088b9065e572325af660b540ad27802bc0659d6b1ab95db0ba5472817b71a9be686461397cc843d71024b96bff732a47ea799dc20d6cdb5016a0b403a343757e278f5165d1e2e2e6c06c6472f8d893bfb29409202595bdbc6d4d8723f957b9693214405cf2d44ed7b44808b62558f8f77453e85bc45700983e284db4c7e63234e628916d4e869b37a2d7e2ca0cc19a62f8f618e5394087b5714894a342d0bc84186b72a6c504a4f8ac8b6010e97e809ad163d9416790fd676dda175eb2d5cd1d813a203a53cc305970c368e9445dfd484d7f916c480a24abfc8567f4ae4ff53f6dab41a5c7fd8688367d976cdf47d997d2417de9a0fa0e1b7deca36f638e4c559fb8c0526877722cbde24543a6b4fd22fc637f1d972b9e0d14c7bc9a72557d7a2171a21988b5d0766dde31a75c23692a5da6535a69fb2357897ded05cdfd8b84b8ef2";
        bool success = verifier.verifyProof(proof, instances);
        console.log("Proof verified: %s", success);
    }
}
