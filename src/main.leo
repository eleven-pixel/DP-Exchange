// The 'exchange' program.
program exchange.aleo {

    record Ask {
        owner: address,
        order:Order,
    }

    record Bid {
        owner: address,
        order:Order,
    }

    record Transaction {
        owner: address,
        amount:u64,
        token:u64,//1u64 aleo,2u64 usdt
    }

    struct Order {
        addr: address,
        qty: u64,
        price: u64,
        amount:u64,
        commission:u64,
        deal_amount:u64,
        deal_commission:u64,
        is_success:bool,
        is_cancel:bool,
    }

    struct Account {
        Aleo:Token,
        Usdt:Token,
    }

    struct Token {
        amount: u64,
        lock: u64,
    }

    mapping accounts: address => Account;

    // sell.
    transition sell(qty :u64, price: u64) -> Ask {
        let amount:u64 = qty * price; 
        let commission:u64 = calculate_commission(amount); 
        let order:Order = Order {
            addr: self.caller,
            qty:qty,
            price: price,
            amount:amount,
            commission:commission,
            deal_amount:amount,
            deal_commission:commission,
            is_success:false,
            is_cancel:false,
        };
        return Ask {
            owner: aleo1wzgkaj0tdezlunuh52sc5e65c9n2w7r57sn8h7ph76vrr3mv8grslk9n57,
            order:order,
        } then finalize(order);
    }

    finalize sell(order: Order) {
        let account: Account = Mapping::get(accounts, order.addr); 
        Mapping::set(accounts, order.addr, Account {
            Aleo : Token {
                amount:account.Aleo.amount - order.qty,
                lock:account.Aleo.lock + order.qty
            },
            Usdt:Token {
                amount:account.Usdt.amount,
                lock:account.Usdt.lock,
            }
        }); 
    }

    // buy.
    transition buy(qty :u64, price: u64) -> Bid {
        let amount:u64 = qty * price; 
        let commission:u64 = calculate_commission(amount); 
        let order:Order = Order {
            addr: self.caller,
            qty:qty,
            price: price,
            amount:amount,
            commission:commission,
            deal_amount:amount,
            deal_commission:commission,
            is_success:false,
            is_cancel:false,
        };
        return Bid {
            owner: aleo1wzgkaj0tdezlunuh52sc5e65c9n2w7r57sn8h7ph76vrr3mv8grslk9n57,
            order:order,
        } then finalize(order);
    }

    finalize buy(order: Order) {
        let account: Account = Mapping::get(accounts, order.addr); 
        Mapping::set(accounts, order.addr, Account {
            Aleo : Token {
                amount:account.Aleo.amount,
                lock:account.Aleo.lock,
            },
            Usdt:Token {
                amount:account.Usdt.amount - order.amount - order.commission,
                lock:account.Usdt.lock + order.amount + order.commission,
            }
        }); 
    }

    // cancel a ask
    transition cancel_sell(ask: Ask) -> Ask {
        let order:Order = Order {
            addr: ask.order.addr,
            qty:ask.order.qty,
            price: ask.order.price,
            amount:ask.order.amount,
            commission:ask.order.commission,
            deal_amount:ask.order.amount,
            deal_commission:ask.order.deal_commission,
            is_success:ask.order.is_success,
            is_cancel:true,
        };
        return Ask {
            owner: ask.order.addr,
            order:order,
        } then finalize(order);
   }

   finalize cancel_sell(order:Order) {
        let account: Account = Mapping::get(accounts, order.addr); 
        Mapping::set(accounts, order.addr, Account{
            Aleo:Token{
                amount:account.Aleo.amount + order.qty,
                lock:account.Aleo.lock - order.qty,
            },
            Usdt:Token{
                amount:account.Usdt.amount,
                lock:account.Usdt.lock,
            },
        });
    }

    // cancel a bid
    transition cancel_buy(bid: Bid) -> Bid {
        let order:Order = Order {
            addr: bid.order.addr,
            qty:bid.order.qty,
            price: bid.order.price,
            amount:bid.order.amount,
            commission:bid.order.commission,
            deal_amount:bid.order.amount,
            deal_commission:bid.order.deal_commission,
            is_success:bid.order.is_success,
            is_cancel:true,
        };
        return Bid {
            owner: bid.order.addr,
            order:order,
        } then finalize(order);
    }

    finalize cancel_buy(order:Order) {
        let account: Account = Mapping::get(accounts, order.addr); 
        Mapping::set(accounts, order.addr, Account{
            Aleo:Token{
                amount:account.Aleo.amount,
                lock:account.Aleo.lock ,
            },
            Usdt:Token{
                amount:account.Usdt.amount + order.amount,
                lock:account.Usdt.lock - order.amount,
            },
        });
    }

    // deal.
    transition deal(ask1: Ask,ask2: Ask,ask3: Ask, bid1: Bid, bid2: Bid, bid3: Bid) -> (Ask,Ask,Ask,Bid,Bid,Bid) {
        assert_eq(self.caller, aleo1wzgkaj0tdezlunuh52sc5e65c9n2w7r57sn8h7ph76vrr3mv8grslk9n57);
        
        let ask1_success:bool = ask1.order.is_success;
        let ask2_success:bool = ask2.order.is_success;
        let ask3_success:bool = ask3.order.is_success;

        let bid1_success:bool = bid1.order.is_success;
        let bid2_success:bool = bid2.order.is_success;
        let bid3_success:bool = bid3.order.is_success;

        let bid1_amount:u64 = bid1.order.amount;
        let bid2_amount:u64 = bid2.order.amount;
        let bid3_amount:u64 = bid3.order.amount; 

        //ask1
        if (ask1.order.qty == bid1.order.qty && ask1.order.price <= bid1.order.price && ask1_success == false && bid1_success == false) {
            ask1_success = true;
            bid1_success = true;
            bid1_amount = ask1.order.amount;
        } 
        if (ask1.order.qty == bid2.order.qty && ask1.order.price <= bid2.order.price && ask1_success == false && bid2_success == false) {
            ask1_success = true;
            bid2_success = true;
            bid2_amount = ask1.order.amount;
        } 
        if (ask1.order.qty == bid3.order.qty && ask1.order.price <= bid3.order.price && ask1_success == false && bid3_success == false) {
            ask1_success = true;
            bid3_success = true;
            bid3_amount = ask1.order.amount;
        } 

        //ask2
        if (ask2.order.qty == bid1.order.qty && ask2.order.price <= bid1.order.price && ask2_success == false && bid1_success == false) {
            ask2_success = true;
            bid1_success = true;
            bid1_amount = ask2.order.amount;
        } 
        if (ask2.order.qty == bid2.order.qty && ask2.order.price <= bid2.order.price && ask2_success == false && bid2_success == false) {
            ask2_success = true;
            bid2_success = true;
            bid2_amount = ask2.order.amount;
        } 
        if (ask2.order.qty == bid3.order.qty && ask2.order.price <= bid3.order.price && ask2_success == false && bid3_success == false) {
            ask2_success = true;
            bid3_success = true;
            bid3_amount = ask2.order.amount;
        } 

        //ask3
        if (ask3.order.qty == bid1.order.qty && ask3.order.price <= bid1.order.price && ask3_success == false && bid1_success == false) {
            ask3_success = true;
            bid1_success = true;
            bid1_amount = ask3.order.amount;
        } 
        if (ask3.order.qty == bid2.order.qty && ask3.order.price <= bid2.order.price && ask3_success == false && bid2_success == false) {
            ask3_success = true;
            bid2_success = true;
            bid2_amount = ask3.order.amount;
        } 
        if (ask3.order.qty == bid3.order.qty && ask3.order.price <= bid3.order.price && ask3_success == false && bid3_success == false) {
            ask3_success = true;
            bid3_success = true;
            bid3_amount = ask3.order.amount;
        }  

        let ask1_order :Order = clone(ask1.order,ask1.order.amount,ask1.order.amount,ask1_success);
        let ask2_order :Order = clone(ask2.order,ask1.order.amount,ask2.order.amount,ask2_success);
        let ask3_order :Order = clone(ask3.order,ask1.order.amount,ask3.order.amount,ask3_success);

        let bid1_order :Order = clone(bid1.order,bid1_amount,calculate_commission(bid1_amount),bid1_success);
        let bid2_order :Order = clone(bid2.order,bid2_amount,calculate_commission(bid2_amount),bid2_success);
        let bid3_order :Order = clone(bid3.order,bid3_amount,calculate_commission(bid3_amount),bid3_success);

        return (
            Ask {
                owner:ask1.owner,
                order:ask1_order,
            },
            Ask {
                owner:ask2.owner,
                order:ask2_order,
            },
            Ask {
                owner:ask3.owner,
                order:ask3_order,
            },
            Bid {
                owner:bid1.owner,
                order:bid1_order,
            },
            Bid {
                owner:bid2.owner,
                order:bid2_order,
            },
            Bid {
                owner:bid3.owner,
                order:bid3_order,
            }
        ) then finalize(ask1_order,ask2_order,ask3_order,bid1_order,bid2_order,bid3_order);
    }

    finalize deal(ask1: Order,ask2: Order,ask3: Order, bid1: Order, bid2: Order, bid3: Order) {
        let commission:u64 = 0u64;
        if (ask1.is_success == true) {
            let account: Account = Mapping::get(accounts, ask1.addr); 
            Mapping::set(accounts,  ask1.addr, Account {
                Aleo:Token{
                    amount:account.Aleo.amount,
                    lock:account.Aleo.lock - ask1.qty,
                },
                Usdt:Token{
                    amount:account.Usdt.amount + ask1.amount - ask1.commission,
                    lock:account.Usdt.lock,
                },
            });
            commission = commission + ask1.commission;
        }

        if (ask2.is_success == true) {
            let account: Account = Mapping::get(accounts, ask2.addr); 
            Mapping::set(accounts,  ask2.addr, Account {
                Aleo:Token{
                    amount:account.Aleo.amount,
                    lock:account.Aleo.lock - ask2.qty,
                },
                Usdt:Token{
                    amount:account.Usdt.amount,
                    lock:account.Usdt.lock + ask2.amount - ask2.commission,
                },
            });
            commission = commission + ask2.commission;
        }

        if (ask3.is_success == true) {
            let account: Account = Mapping::get(accounts, ask3.addr); 
            Mapping::set(accounts,  ask3.addr, Account {
                Aleo:Token{
                    amount:account.Aleo.amount,
                    lock:account.Aleo.lock - ask3.qty,
                },
                Usdt:Token{
                    amount:account.Usdt.amount + ask3.amount - ask3.commission,
                    lock:account.Usdt.lock,
                },
            });
            commission = commission + ask3.commission;
        }

        if (bid1.is_success == true) {
            let account: Account = Mapping::get(accounts, bid1.addr); 
            Mapping::set(accounts,  bid1.addr, Account {
                Aleo:Token{
                    amount:account.Aleo.amount + bid1.qty,
                    lock:account.Aleo.lock,
                },
                Usdt:Token{
                    amount:account.Usdt.amount + (bid1.amount - bid1.deal_amount) + (bid1.commission - bid1.deal_commission),
                    lock:account.Usdt.lock - bid1.amount - bid1.commission,
                },
            });
            commission = commission + bid1.deal_commission;
        } 

        if (bid2.is_success == true) {
            let account: Account = Mapping::get(accounts, bid2.addr); 
            Mapping::set(accounts,  bid2.addr, Account {
                Aleo:Token{
                    amount:account.Aleo.amount + bid2.qty,
                    lock:account.Aleo.lock,
                },
                Usdt:Token{
                    amount:account.Usdt.amount + (bid2.amount - bid2.deal_amount) + (bid2.commission - bid2.deal_commission),
                    lock:account.Usdt.lock - bid2.amount - bid2.commission,
                },
            });
            commission = commission + bid2.deal_commission;
        } 

        if (bid3.is_success == true) {
            let account: Account = Mapping::get(accounts, bid3.addr); 
            Mapping::set(accounts,  bid3.addr, Account {
                Aleo:Token{
                    amount:account.Aleo.amount + bid3.qty,
                    lock:account.Aleo.lock,
                },
                Usdt:Token{
                    amount:account.Usdt.amount + (bid3.amount - bid3.deal_amount) + (bid3.commission - bid3.deal_commission),
                    lock:account.Usdt.lock - bid3.amount - bid3.commission,
                },
            });
            commission = commission + bid3.deal_commission;
        }
        let addr:address = aleo1wzgkaj0tdezlunuh52sc5e65c9n2w7r57sn8h7ph76vrr3mv8grslk9n57;

        let act: Account = Mapping::get(accounts, addr);
        Mapping::set(accounts,  addr, Account {
            Aleo:Token{
                amount:act.Aleo.amount,
                lock:act.Aleo.lock,
            },
            Usdt:Token{
                amount:act.Usdt.amount,
                lock:act.Usdt.lock + commission,
            },
        });
    }

    // recharge.
    transition recharge(amount: u64,token: u64) -> Transaction {
        let addr :address = self.caller;
        return Transaction {
            owner: addr,
            amount:amount,
            token: token,
        } then finalize(addr, amount,token);
    }

    finalize recharge(addr: address, amount: u64,token: u64) {
        let account: Account = Mapping::get_or_init(accounts, addr, Account{
            Aleo:Token{
                amount:0u64,
                lock:0u64,
            },
            Usdt:Token{
                amount:0u64,
                lock:0u64,
            },
        });
        let aleo_amount:u64 = account.Aleo.amount;
        let usdt_amount:u64 = account.Usdt.amount;
        if(token == 1u64) {
            aleo_amount = aleo_amount + amount;
        } else if(token == 2u64) {
            usdt_amount = usdt_amount + amount;
        }

        Mapping::set(accounts, addr, Account{
            Aleo:Token{
                amount:aleo_amount,
                lock:account.Aleo.lock,
            },
            Usdt:Token{
                amount:usdt_amount,
                lock:account.Usdt.lock,
            },
        });
    }

    // withdraw 
    transition withdraw(amount: u64,token: u64) -> Transaction {
        let addr :address = self.caller;
        return Transaction {
            owner: addr,
            amount:amount,
            token: token,
        } then finalize(addr, amount,token);
    }

    finalize withdraw(addr: address, amount: u64,token: u64) {
        let account: Account = Mapping::get(accounts, addr);
        let aleo_amount:u64 = account.Aleo.amount;
        let usdt_amount:u64 = account.Usdt.amount;

        if(token == 1u64) {
            aleo_amount = aleo_amount - amount;
        } else if(token == 2u64) {
            usdt_amount = usdt_amount - amount;
        }

        Mapping::set(accounts, addr, Account{
            Aleo:Token{
                amount:aleo_amount,
                lock:account.Aleo.lock,
            },
            Usdt:Token{
                amount:usdt_amount,
                lock:account.Usdt.lock,
            },
        });
    }

    // clone a order and reset deal_amount,deal_commission,is_success
    function clone(order: Order,amount:u64,commission:u64,is_success: bool) -> Order {
        return Order {
            addr: order.addr,
            qty:order.qty,
            price: order.price,
            amount:order.amount,
            commission:order.commission,
            deal_amount:amount,
            deal_commission:commission,
            is_success:is_success,
            is_cancel:order.is_cancel,
        };
    }

    // commission
    function calculate_commission(amount: u64) -> u64 {
        let rate: u64 = 3u64; 
        return (amount * rate) / 10000u64;
    }
}
