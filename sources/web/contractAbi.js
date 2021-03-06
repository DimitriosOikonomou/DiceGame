var abi = 
	[
		{
			"inputs": [],
			"stateMutability": "payable",
			"type": "constructor"
		},
		{
			"anonymous": false,
			"inputs": [
				{
					"indexed": false,
					"internalType": "bool",
					"name": "won",
					"type": "bool"
				},
				{
					"indexed": false,
					"internalType": "uint256",
					"name": "mysteryNumber",
					"type": "uint256"
				}
			],
			"name": "Bet",
			"type": "event"
		},
		{
			"inputs": [],
			"name": "fundGame",
			"outputs": [],
			"stateMutability": "payable",
			"type": "function"
		},
		{
			"inputs": [
				{
					"internalType": "bool",
					"name": "guess",
					"type": "bool"
				}
			],
			"name": "winOrLose",
			"outputs": [
				{
					"internalType": "bool",
					"name": "",
					"type": "bool"
				},
				{
					"internalType": "uint256",
					"name": "",
					"type": "uint256"
				}
			],
			"stateMutability": "payable",
			"type": "function"
		},
		{
			"inputs": [],
			"name": "withdrawFunds",
			"outputs": [],
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"inputs": [
				{
					"internalType": "uint256",
					"name": "number",
					"type": "uint256"
				},
				{
					"internalType": "bool",
					"name": "guess",
					"type": "bool"
				}
			],
			"name": "determineWinner",
			"outputs": [
				{
					"internalType": "bool",
					"name": "",
					"type": "bool"
				}
			],
			"stateMutability": "pure",
			"type": "function"
		}
];