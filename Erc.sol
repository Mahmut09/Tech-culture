// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MyToken {
    uint public totalAmount = 1000000e18;

    address payable public owner;

    mapping (address => uint) public balances;
    mapping(address => mapping(address => uint)) allowances;
    mapping (address => bool) public blackList;

    string public _name = "Kazakh";
    string public _symbol = "KZ";

    function addToBlackList(address bannedAccount) external {
        require(msg.sender == owner, "You are not onwer");
        require(!blackList[bannedAccount], "You are banned");

        blackList[bannedAccount] = true;
    }

    function name() external view returns(string memory) {
        return _name;
    }

    function symbol() external view returns(string memory) {
        return _symbol;
    }

    function decimals() external pure returns(uint) {
        return 18; // 1 token == 1 wei
    }

    function totalSupply() external view returns(uint) {
        return totalAmount;
    }

    function balanceOf(address account) external view returns(uint) {
        return balances[account];
    }

    function transfer(address to, uint amount) external {
        require(!blackList[msg.sender], "You are banned");
        require(!blackList[to], "He is banned");

        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Approve(msg.sender, to, amount);
    }

    function mint() public {
        require(!blackList[msg.sender], "You are banned");
        balances[msg.sender] += 500e18;
    }

    function allowance(address _owner, address spender) external view returns(uint) {
        return allowances[_owner][spender];
    }

    function approve(address spender, uint amount) external {
        allowances[msg.sender][spender] = amount;
        emit Approve(msg.sender, spender, amount);
    }

    function transferFrom(address sender, address recipient, uint amount) external{
        allowances[sender][recipient] -= amount;
        balances[sender] -= amount;
        balances[recipient] += amount;
    }

    constructor() {
        owner = payable(msg.sender);
    }

    event Transfer(address indexed from, address indexed to, uint amount);

    event Approve(address indexed owner, address indexed to, uint amount);
}