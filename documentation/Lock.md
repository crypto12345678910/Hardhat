# Solidity API

### unlockTime

```solidity
uint256 unlockTime
```

### owner

```solidity
address payable owner
```

### Withdrawal

```solidity
event Withdrawal(uint256 amount, uint256 when)
```

### timeLockInThePast

```solidity
error timeLockInThePast()
```

### lockTimeNotElapesedYet

```solidity
error lockTimeNotElapesedYet()
```

### notOwner

```solidity
error notOwner()
```

### constructor

```solidity
constructor(uint256 _unlockTime) public payable
```

contstructor

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _unlockTime | uint256 | unlock time for this contract |

### withdraw

```solidity
function withdraw() public
```

allow owner to withdraw balance after time lock elapsed

