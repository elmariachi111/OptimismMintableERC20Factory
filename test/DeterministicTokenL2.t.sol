// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import { IOptimismMintableERC20 } from "src/universal/IOptimismMintableERC20.sol";
import { OptimismMintableERC20 } from "src/universal/OptimismMintableERC20.sol";
import {OptimismMintableERC20Factory} from "src/universal/OptimismMintableERC20Factory.sol";
contract DeterministicTokenL2 is Test {
    uint256 bsFork;
    //sepolia, precompiled proxy
    //bytecode_hash none
    //bytes creationCode = hex"6101406040523480156200001257600080fd5b5060405162001ad838038062001ad8833981016040819052620000359162000178565b600160026000858560036200004b8382620002b3565b5060046200005a8282620002b3565b50505060809290925260a05260c0526001600160a01b0393841660e0529390921661010052505060ff16610120526200037f565b80516001600160a01b0381168114620000a657600080fd5b919050565b634e487b7160e01b600052604160045260246000fd5b600082601f830112620000d357600080fd5b81516001600160401b0380821115620000f057620000f0620000ab565b604051601f8301601f19908116603f011681019082821181831017156200011b576200011b620000ab565b816040528381526020925086838588010111156200013857600080fd5b600091505b838210156200015c57858201830151818301840152908201906200013d565b838211156200016e5760008385830101525b9695505050505050565b600080600080600060a086880312156200019157600080fd5b6200019c866200008e565b9450620001ac602087016200008e565b60408701519094506001600160401b0380821115620001ca57600080fd5b620001d889838a01620000c1565b94506060880151915080821115620001ef57600080fd5b50620001fe88828901620000c1565b925050608086015160ff811681146200021657600080fd5b809150509295509295909350565b600181811c908216806200023957607f821691505b6020821081036200025a57634e487b7160e01b600052602260045260246000fd5b50919050565b601f821115620002ae57600081815260208120601f850160051c81016020861015620002895750805b601f850160051c820191505b81811015620002aa5782815560010162000295565b5050505b505050565b81516001600160401b03811115620002cf57620002cf620000ab565b620002e781620002e0845462000224565b8462000260565b602080601f8311600181146200031f5760008415620003065750858301515b600019600386901b1c1916600185901b178555620002aa565b600085815260208120601f198616915b8281101562000350578886015182559484019460019091019084016200032f565b50858210156200036f5787850151600019600388901b60f8161c191681555b5050505050600190811b01905550565b60805160a05160c05160e05161010051610120516116ed620003eb6000396000610244015260008181610317015281816103ac015281816105f101526107cb0152600081816101a9015261033d0152600061075a015260006107310152600061070801526116ed6000f3fe608060405234801561001057600080fd5b50600436106101775760003560e01c806370a08231116100d8578063ae1f6aaf1161008c578063dd62ed3e11610066578063dd62ed3e14610361578063e78cea9214610315578063ee9a31a2146103a757600080fd5b8063ae1f6aaf14610315578063c01e1bd61461033b578063d6c0b2c41461033b57600080fd5b80639dc29fac116100bd5780639dc29fac146102dc578063a457c2d7146102ef578063a9059cbb1461030257600080fd5b806370a082311461029e57806395d89b41146102d457600080fd5b806323b872dd1161012f5780633950935111610114578063395093511461026e57806340c10f191461028157806354fd4d501461029657600080fd5b806323b872dd1461022a578063313ce5671461023d57600080fd5b806306fdde031161016057806306fdde03146101f0578063095ea7b31461020557806318160ddd1461021857600080fd5b806301ffc9a71461017c578063033964be146101a4575b600080fd5b61018f61018a366004611329565b6103ce565b60405190151581526020015b60405180910390f35b6101cb7f000000000000000000000000000000000000000000000000000000000000000081565b60405173ffffffffffffffffffffffffffffffffffffffff909116815260200161019b565b6101f86104bf565b60405161019b919061139e565b61018f610213366004611418565b610551565b6002545b60405190815260200161019b565b61018f610238366004611442565b610569565b60405160ff7f000000000000000000000000000000000000000000000000000000000000000016815260200161019b565b61018f61027c366004611418565b61058d565b61029461028f366004611418565b6105d9565b005b6101f8610701565b61021c6102ac36600461147e565b73ffffffffffffffffffffffffffffffffffffffff1660009081526020819052604090205490565b6101f86107a4565b6102946102ea366004611418565b6107b3565b61018f6102fd366004611418565b6108ca565b61018f610310366004611418565b61099b565b7f00000000000000000000000000000000000000000000000000000000000000006101cb565b7f00000000000000000000000000000000000000000000000000000000000000006101cb565b61021c61036f366004611499565b73ffffffffffffffffffffffffffffffffffffffff918216600090815260016020908152604080832093909416825291909152205490565b6101cb7f000000000000000000000000000000000000000000000000000000000000000081565b60007f01ffc9a7000000000000000000000000000000000000000000000000000000007f1d1d8b63000000000000000000000000000000000000000000000000000000007fec4fc8e3000000000000000000000000000000000000000000000000000000007fffffffff00000000000000000000000000000000000000000000000000000000851683148061048757507fffffffff00000000000000000000000000000000000000000000000000000000858116908316145b806104b657507fffffffff00000000000000000000000000000000000000000000000000000000858116908216145b95945050505050565b6060600380546104ce906114cc565b80601f01602080910402602001604051908101604052809291908181526020018280546104fa906114cc565b80156105475780601f1061051c57610100808354040283529160200191610547565b820191906000526020600020905b81548152906001019060200180831161052a57829003601f168201915b5050505050905090565b60003361055f8185856109a9565b5060019392505050565b600033610577858285610b5d565b610582858585610c34565b506001949350505050565b33600081815260016020908152604080832073ffffffffffffffffffffffffffffffffffffffff8716845290915281205490919061055f90829086906105d490879061154e565b6109a9565b3373ffffffffffffffffffffffffffffffffffffffff7f000000000000000000000000000000000000000000000000000000000000000016146106a3576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152603460248201527f4f7074696d69736d4d696e7461626c6545524332303a206f6e6c79206272696460448201527f67652063616e206d696e7420616e64206275726e00000000000000000000000060648201526084015b60405180910390fd5b6106ad8282610ee7565b8173ffffffffffffffffffffffffffffffffffffffff167f0f6798a560793a54c3bcfe86a93cde1e73087d944c0ea20544137d4121396885826040516106f591815260200190565b60405180910390a25050565b606061072c7f0000000000000000000000000000000000000000000000000000000000000000611007565b6107557f0000000000000000000000000000000000000000000000000000000000000000611007565b61077e7f0000000000000000000000000000000000000000000000000000000000000000611007565b60405160200161079093929190611566565b604051602081830303815290604052905090565b6060600480546104ce906114cc565b3373ffffffffffffffffffffffffffffffffffffffff7f00000000000000000000000000000000000000000000000000000000000000001614610878576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152603460248201527f4f7074696d69736d4d696e7461626c6545524332303a206f6e6c79206272696460448201527f67652063616e206d696e7420616e64206275726e000000000000000000000000606482015260840161069a565b6108828282611144565b8173ffffffffffffffffffffffffffffffffffffffff167fcc16f5dbb4873280815c1ee09dbd06736cffcc184412cf7a71a0fdb75d397ca5826040516106f591815260200190565b33600081815260016020908152604080832073ffffffffffffffffffffffffffffffffffffffff871684529091528120549091908381101561098e576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602560248201527f45524332303a2064656372656173656420616c6c6f77616e63652062656c6f7760448201527f207a65726f000000000000000000000000000000000000000000000000000000606482015260840161069a565b61058282868684036109a9565b60003361055f818585610c34565b73ffffffffffffffffffffffffffffffffffffffff8316610a4b576040517f08c379a0000000000000000000000000000000000000000000000000000000008152602060048201526024808201527f45524332303a20617070726f76652066726f6d20746865207a65726f2061646460448201527f7265737300000000000000000000000000000000000000000000000000000000606482015260840161069a565b73ffffffffffffffffffffffffffffffffffffffff8216610aee576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602260248201527f45524332303a20617070726f766520746f20746865207a65726f20616464726560448201527f7373000000000000000000000000000000000000000000000000000000000000606482015260840161069a565b73ffffffffffffffffffffffffffffffffffffffff83811660008181526001602090815260408083209487168084529482529182902085905590518481527f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b92591015b60405180910390a3505050565b73ffffffffffffffffffffffffffffffffffffffff8381166000908152600160209081526040808320938616835292905220547fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8114610c2e5781811015610c21576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601d60248201527f45524332303a20696e73756666696369656e7420616c6c6f77616e6365000000604482015260640161069a565b610c2e84848484036109a9565b50505050565b73ffffffffffffffffffffffffffffffffffffffff8316610cd7576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602560248201527f45524332303a207472616e736665722066726f6d20746865207a65726f20616460448201527f6472657373000000000000000000000000000000000000000000000000000000606482015260840161069a565b73ffffffffffffffffffffffffffffffffffffffff8216610d7a576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602360248201527f45524332303a207472616e7366657220746f20746865207a65726f206164647260448201527f6573730000000000000000000000000000000000000000000000000000000000606482015260840161069a565b73ffffffffffffffffffffffffffffffffffffffff831660009081526020819052604090205481811015610e30576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602660248201527f45524332303a207472616e7366657220616d6f756e742065786365656473206260448201527f616c616e63650000000000000000000000000000000000000000000000000000606482015260840161069a565b73ffffffffffffffffffffffffffffffffffffffff808516600090815260208190526040808220858503905591851681529081208054849290610e7490849061154e565b925050819055508273ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef84604051610eda91815260200190565b60405180910390a3610c2e565b73ffffffffffffffffffffffffffffffffffffffff8216610f64576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601f60248201527f45524332303a206d696e7420746f20746865207a65726f206164647265737300604482015260640161069a565b8060026000828254610f76919061154e565b909155505073ffffffffffffffffffffffffffffffffffffffff821660009081526020819052604081208054839290610fb090849061154e565b909155505060405181815273ffffffffffffffffffffffffffffffffffffffff8316906000907fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9060200160405180910390a35050565b60608160000361104a57505060408051808201909152600181527f3000000000000000000000000000000000000000000000000000000000000000602082015290565b8160005b8115611074578061105e816115dc565b915061106d9050600a83611643565b915061104e565b60008167ffffffffffffffff81111561108f5761108f611657565b6040519080825280601f01601f1916602001820160405280156110b9576020820181803683370190505b5090505b841561113c576110ce600183611686565b91506110db600a8661169d565b6110e690603061154e565b60f81b8183815181106110fb576110fb6116b1565b60200101907effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1916908160001a905350611135600a86611643565b94506110bd565b949350505050565b73ffffffffffffffffffffffffffffffffffffffff82166111e7576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602160248201527f45524332303a206275726e2066726f6d20746865207a65726f2061646472657360448201527f7300000000000000000000000000000000000000000000000000000000000000606482015260840161069a565b73ffffffffffffffffffffffffffffffffffffffff82166000908152602081905260409020548181101561129d576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602260248201527f45524332303a206275726e20616d6f756e7420657863656564732062616c616e60448201527f6365000000000000000000000000000000000000000000000000000000000000606482015260840161069a565b73ffffffffffffffffffffffffffffffffffffffff831660009081526020819052604081208383039055600280548492906112d9908490611686565b909155505060405182815260009073ffffffffffffffffffffffffffffffffffffffff8516907fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef90602001610b50565b60006020828403121561133b57600080fd5b81357fffffffff000000000000000000000000000000000000000000000000000000008116811461136b57600080fd5b9392505050565b60005b8381101561138d578181015183820152602001611375565b83811115610c2e5750506000910152565b60208152600082518060208401526113bd816040850160208701611372565b601f017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0169190910160400192915050565b803573ffffffffffffffffffffffffffffffffffffffff8116811461141357600080fd5b919050565b6000806040838503121561142b57600080fd5b611434836113ef565b946020939093013593505050565b60008060006060848603121561145757600080fd5b611460846113ef565b925061146e602085016113ef565b9150604084013590509250925092565b60006020828403121561149057600080fd5b61136b826113ef565b600080604083850312156114ac57600080fd5b6114b5836113ef565b91506114c3602084016113ef565b90509250929050565b600181811c908216806114e057607f821691505b602082108103611519577f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b50919050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601160045260246000fd5b600082198211156115615761156161151f565b500190565b60008451611578818460208901611372565b80830190507f2e0000000000000000000000000000000000000000000000000000000000000080825285516115b4816001850160208a01611372565b600192019182015283516115cf816002840160208801611372565b0160020195945050505050565b60007fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff820361160d5761160d61151f565b5060010190565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601260045260246000fd5b60008261165257611652611614565b500490565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b6000828210156116985761169861151f565b500390565b6000826116ac576116ac611614565b500690565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052603260045260246000fdfea164736f6c634300080f000a";

    //base mainnet, upgraded precompile, bedrock-contracts
    //bytecode_hash ipfs
    bytes creationCode = hex"60e06040523480156200001157600080fd5b50604051620016fa380380620016fa833981016040819052620000349162000163565b828260036200004483826200029e565b5060046200005382826200029e565b5050506001600160a01b039384166080529390921660a052505060ff1660c0526200036a565b80516001600160a01b03811681146200009157600080fd5b919050565b634e487b7160e01b600052604160045260246000fd5b600082601f830112620000be57600080fd5b81516001600160401b0380821115620000db57620000db62000096565b604051601f8301601f19908116603f0116810190828211818310171562000106576200010662000096565b816040528381526020925086838588010111156200012357600080fd5b600091505b8382101562000147578582018301518183018401529082019062000128565b83821115620001595760008385830101525b9695505050505050565b600080600080600060a086880312156200017c57600080fd5b620001878662000079565b9450620001976020870162000079565b60408701519094506001600160401b0380821115620001b557600080fd5b620001c389838a01620000ac565b94506060880151915080821115620001da57600080fd5b50620001e988828901620000ac565b925050608086015160ff811681146200020157600080fd5b809150509295509295909350565b600181811c908216806200022457607f821691505b6020821081036200024557634e487b7160e01b600052602260045260246000fd5b50919050565b601f8211156200029957600081815260208120601f850160051c81016020861015620002745750805b601f850160051c820191505b81811015620002955782815560010162000280565b5050505b505050565b81516001600160401b03811115620002ba57620002ba62000096565b620002d281620002cb84546200020f565b846200024b565b602080601f8311600181146200030a5760008415620002f15750858301515b600019600386901b1c1916600185901b17855562000295565b600085815260208120601f198616915b828110156200033b578886015182559484019460019091019084016200031a565b50858210156200035a5787850151600019600388901b60f8161c191681555b5050505050600190811b01905550565b60805160a05160c051611344620003b6600039600061024401526000818161034b015281816103e001528181610625015261075c0152600081816101a9015261037101526113446000f3fe608060405234801561001057600080fd5b50600436106101775760003560e01c806370a08231116100d8578063ae1f6aaf1161008c578063dd62ed3e11610066578063dd62ed3e14610395578063e78cea9214610349578063ee9a31a2146103db57600080fd5b8063ae1f6aaf14610349578063c01e1bd61461036f578063d6c0b2c41461036f57600080fd5b80639dc29fac116100bd5780639dc29fac14610310578063a457c2d714610323578063a9059cbb1461033657600080fd5b806370a08231146102d257806395d89b411461030857600080fd5b806323b872dd1161012f5780633950935111610114578063395093511461026e57806340c10f191461028157806354fd4d501461029657600080fd5b806323b872dd1461022a578063313ce5671461023d57600080fd5b806306fdde031161016057806306fdde03146101f0578063095ea7b31461020557806318160ddd1461021857600080fd5b806301ffc9a71461017c578063033964be146101a4575b600080fd5b61018f61018a3660046110e3565b610402565b60405190151581526020015b60405180910390f35b6101cb7f000000000000000000000000000000000000000000000000000000000000000081565b60405173ffffffffffffffffffffffffffffffffffffffff909116815260200161019b565b6101f86104f3565b60405161019b919061112c565b61018f6102133660046111c8565b610585565b6002545b60405190815260200161019b565b61018f6102383660046111f2565b61059d565b60405160ff7f000000000000000000000000000000000000000000000000000000000000000016815260200161019b565b61018f61027c3660046111c8565b6105c1565b61029461028f3660046111c8565b61060d565b005b6101f86040518060400160405280600581526020017f312e332e3000000000000000000000000000000000000000000000000000000081525081565b61021c6102e036600461122e565b73ffffffffffffffffffffffffffffffffffffffff1660009081526020819052604090205490565b6101f8610735565b61029461031e3660046111c8565b610744565b61018f6103313660046111c8565b61085b565b61018f6103443660046111c8565b61092c565b7f00000000000000000000000000000000000000000000000000000000000000006101cb565b7f00000000000000000000000000000000000000000000000000000000000000006101cb565b61021c6103a3366004611249565b73ffffffffffffffffffffffffffffffffffffffff918216600090815260016020908152604080832093909416825291909152205490565b6101cb7f000000000000000000000000000000000000000000000000000000000000000081565b60007f01ffc9a7000000000000000000000000000000000000000000000000000000007f1d1d8b63000000000000000000000000000000000000000000000000000000007fec4fc8e3000000000000000000000000000000000000000000000000000000007fffffffff0000000000000000000000000000000000000000000000000000000085168314806104bb57507fffffffff00000000000000000000000000000000000000000000000000000000858116908316145b806104ea57507fffffffff00000000000000000000000000000000000000000000000000000000858116908216145b95945050505050565b6060600380546105029061127c565b80601f016020809104026020016040519081016040528092919081815260200182805461052e9061127c565b801561057b5780601f106105505761010080835404028352916020019161057b565b820191906000526020600020905b81548152906001019060200180831161055e57829003601f168201915b5050505050905090565b60003361059381858561093a565b5060019392505050565b6000336105ab858285610aee565b6105b6858585610bc5565b506001949350505050565b33600081815260016020908152604080832073ffffffffffffffffffffffffffffffffffffffff8716845290915281205490919061059390829086906106089087906112cf565b61093a565b3373ffffffffffffffffffffffffffffffffffffffff7f000000000000000000000000000000000000000000000000000000000000000016146106d7576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152603460248201527f4f7074696d69736d4d696e7461626c6545524332303a206f6e6c79206272696460448201527f67652063616e206d696e7420616e64206275726e00000000000000000000000060648201526084015b60405180910390fd5b6106e18282610e34565b8173ffffffffffffffffffffffffffffffffffffffff167f0f6798a560793a54c3bcfe86a93cde1e73087d944c0ea20544137d41213968858260405161072991815260200190565b60405180910390a25050565b6060600480546105029061127c565b3373ffffffffffffffffffffffffffffffffffffffff7f00000000000000000000000000000000000000000000000000000000000000001614610809576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152603460248201527f4f7074696d69736d4d696e7461626c6545524332303a206f6e6c79206272696460448201527f67652063616e206d696e7420616e64206275726e00000000000000000000000060648201526084016106ce565b6108138282610f27565b8173ffffffffffffffffffffffffffffffffffffffff167fcc16f5dbb4873280815c1ee09dbd06736cffcc184412cf7a71a0fdb75d397ca58260405161072991815260200190565b33600081815260016020908152604080832073ffffffffffffffffffffffffffffffffffffffff871684529091528120549091908381101561091f576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602560248201527f45524332303a2064656372656173656420616c6c6f77616e63652062656c6f7760448201527f207a65726f00000000000000000000000000000000000000000000000000000060648201526084016106ce565b6105b6828686840361093a565b600033610593818585610bc5565b73ffffffffffffffffffffffffffffffffffffffff83166109dc576040517f08c379a0000000000000000000000000000000000000000000000000000000008152602060048201526024808201527f45524332303a20617070726f76652066726f6d20746865207a65726f2061646460448201527f726573730000000000000000000000000000000000000000000000000000000060648201526084016106ce565b73ffffffffffffffffffffffffffffffffffffffff8216610a7f576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602260248201527f45524332303a20617070726f766520746f20746865207a65726f20616464726560448201527f737300000000000000000000000000000000000000000000000000000000000060648201526084016106ce565b73ffffffffffffffffffffffffffffffffffffffff83811660008181526001602090815260408083209487168084529482529182902085905590518481527f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b92591015b60405180910390a3505050565b73ffffffffffffffffffffffffffffffffffffffff8381166000908152600160209081526040808320938616835292905220547fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8114610bbf5781811015610bb2576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601d60248201527f45524332303a20696e73756666696369656e7420616c6c6f77616e636500000060448201526064016106ce565b610bbf848484840361093a565b50505050565b73ffffffffffffffffffffffffffffffffffffffff8316610c68576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602560248201527f45524332303a207472616e736665722066726f6d20746865207a65726f20616460448201527f647265737300000000000000000000000000000000000000000000000000000060648201526084016106ce565b73ffffffffffffffffffffffffffffffffffffffff8216610d0b576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602360248201527f45524332303a207472616e7366657220746f20746865207a65726f206164647260448201527f657373000000000000000000000000000000000000000000000000000000000060648201526084016106ce565b73ffffffffffffffffffffffffffffffffffffffff831660009081526020819052604090205481811015610dc1576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602660248201527f45524332303a207472616e7366657220616d6f756e742065786365656473206260448201527f616c616e6365000000000000000000000000000000000000000000000000000060648201526084016106ce565b73ffffffffffffffffffffffffffffffffffffffff848116600081815260208181526040808320878703905593871680835291849020805487019055925185815290927fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef910160405180910390a3610bbf565b73ffffffffffffffffffffffffffffffffffffffff8216610eb1576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601f60248201527f45524332303a206d696e7420746f20746865207a65726f20616464726573730060448201526064016106ce565b8060026000828254610ec391906112cf565b909155505073ffffffffffffffffffffffffffffffffffffffff8216600081815260208181526040808320805486019055518481527fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef910160405180910390a35050565b73ffffffffffffffffffffffffffffffffffffffff8216610fca576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602160248201527f45524332303a206275726e2066726f6d20746865207a65726f2061646472657360448201527f730000000000000000000000000000000000000000000000000000000000000060648201526084016106ce565b73ffffffffffffffffffffffffffffffffffffffff821660009081526020819052604090205481811015611080576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602260248201527f45524332303a206275726e20616d6f756e7420657863656564732062616c616e60448201527f636500000000000000000000000000000000000000000000000000000000000060648201526084016106ce565b73ffffffffffffffffffffffffffffffffffffffff83166000818152602081815260408083208686039055600280548790039055518581529192917fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9101610ae1565b6000602082840312156110f557600080fd5b81357fffffffff000000000000000000000000000000000000000000000000000000008116811461112557600080fd5b9392505050565b600060208083528351808285015260005b818110156111595785810183015185820160400152820161113d565b8181111561116b576000604083870101525b50601f017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe016929092016040019392505050565b803573ffffffffffffffffffffffffffffffffffffffff811681146111c357600080fd5b919050565b600080604083850312156111db57600080fd5b6111e48361119f565b946020939093013593505050565b60008060006060848603121561120757600080fd5b6112108461119f565b925061121e6020850161119f565b9150604084013590509250925092565b60006020828403121561124057600080fd5b6111258261119f565b6000806040838503121561125c57600080fd5b6112658361119f565b91506112736020840161119f565b90509250929050565b600181811c9082168061129057607f821691505b6020821081036112c9577f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b50919050565b60008219821115611309577f4e487b7100000000000000000000000000000000000000000000000000000000600052601160045260246000fd5b50019056fea26469706673582212209d6a73773a8b3ada7d4c6d75345f8313289c1253717e855c8b5987154ecfb2b164736f6c634300080f0033";

    OptimismMintableERC20Factory tokenFactory = OptimismMintableERC20Factory(0x4200000000000000000000000000000000000012);
    address bridge = 0x4200000000000000000000000000000000000010;
    
    // base mainnet
    address remoteToken = 0x7b66E84Be78772a3afAF5ba8c1993a1B5D05F9C2;
    address expectedAddress = 0xEF083309Fe6321B40c87Ab95836Fd2Cb0fc5C1Ea;
    string name = "IP Tokens of IPNFT #28";
    string symbol = "VITARNA";

    // base sepolia
    // address remoteToken = 0x16cb616e782E626e12931c434d856a000b35eB64;
    // address expectedAddress = 0xDa8Df672aCfa4Ee1be95FBC1c2e0FA97d49F7BDe;
    // string name = "IP Tokens of IPNFT #42";
    // string symbol = "CYCL-01";
    uint8 decimals = 18;

    function setUp() public {}

    //https://github.com/ethereum-optimism/optimism/blob/develop/packages/contracts-bedrock/src/libraries/Preinstalls.sol#L12
    //https://sepolia.basescan.org/address/0x13b0D85CcB8bf860b6b79AF3029fCA081AE9beF2#code
    function computeAddress(bytes32 salt, bytes32 bytecodeHash, address deployer) internal pure returns (address addr) {
        /// @solidity memory-safe-assembly
        assembly {
            let ptr := mload(0x40) // Get free memory pointer
            // |                   | ↓ ptr ...  ↓ ptr + 0x0B (start) ...  ↓ ptr + 0x20 ...  ↓ ptr + 0x40 ...   |
            // |-------------------|---------------------------------------------------------------------------|
            // | bytecodeHash      |                                                        CCCCCCCCCCCCC...CC |
            // | salt              |                                      BBBBBBBBBBBBB...BB                   |
            // | deployer          | 000000...0000AAAAAAAAAAAAAAAAAAA...AA                                     |
            // | 0xFF              |            FF                                                             |
            // |-------------------|---------------------------------------------------------------------------|
            // | memory            | 000000...00FFAAAAAAAAAAAAAAAAAAA...AABBBBBBBBBBBBB...BBCCCCCCCCCCCCC...CC |
            // | keccak(start, 85) |            ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ |

            mstore(add(ptr, 0x40), bytecodeHash)
            mstore(add(ptr, 0x20), salt)
            mstore(ptr, deployer) // Right-aligned with 12 preceding garbage bytes
            let start := add(ptr, 0x0b) // The hashed data starts at the final garbage byte which we will set to 0xff
            mstore8(start, 0xff)
            addr := keccak256(start, 85)
        }
    }

    
    function testInitCode() public {
        bytes32 salt = keccak256(abi.encode(remoteToken, name, symbol, decimals));
        console.logBytes32(salt);

        assertEq(creationCode, type(OptimismMintableERC20).creationCode);
        
        address compAddress = computeAddress(salt, keccak256(abi.encodePacked(type(OptimismMintableERC20).creationCode, abi.encode(bridge, remoteToken, name, symbol, decimals))), address(tokenFactory));
        address compAddress2 = computeAddress(salt, keccak256(abi.encodePacked(creationCode, abi.encode(bridge, remoteToken, name, symbol, decimals))), address(tokenFactory));
        address predictedAddress = address(
            uint160(
                uint256(
                    keccak256(
                        abi.encodePacked(
                            bytes1(0xff),
                            address(tokenFactory),
                            salt,
                            keccak256(abi.encodePacked(type(OptimismMintableERC20).creationCode, abi.encode(bridge, remoteToken, name, symbol, decimals)))
                        )
                    )
                )
            )
        );
        assertEq(compAddress, compAddress2);
        assertEq(compAddress, predictedAddress);

        console.log("Expected", expectedAddress);
        console.log("Predicted", compAddress, compAddress2, predictedAddress);

        vm.startPrank(address(tokenFactory));
        IOptimismMintableERC20 token = new OptimismMintableERC20{ salt: salt }(bridge, remoteToken, name, symbol, decimals);
        assertEq(address(token), expectedAddress);
        vm.stopPrank();
    }

    // function testForkDeploy() public {
    //     bsFork = vm.createFork("https://mainnet.base.org", 12481636);
    //     vm.selectFork(bsFork);

    //     vm.startPrank(0x8FeEAAae1DB031E5F980F5E63fDbb277731e500e);
    //     address forkToken = tokenFactory.createOptimismMintableERC20(remoteToken, name, symbol);
    //     console.log("Deployed", address(forkToken));
    //     assertEq(address(forkToken), expectedAddress);
    // }
}

