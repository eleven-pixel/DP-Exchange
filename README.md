# An simple exchange in Leo.

## How to Build

To compile this Leo program, run:
```bash
leo build
```
ask1
aleo1d937cyk52y9zjdveu342hy8epqd6lj3dgrregerxweer09a0zurqez8h4f

leo run recharge 100u64 1u64

{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  from: aleo1d937cyk52y9zjdveu342hy8epqd6lj3dgrregerxweer09a0zurqez8h4f.private,
  amount: 100u64.private,
  token: 1u64.private,
  _nonce: 378989960020779658265135821111662091293488669676620605889199201338288419070group.public
}

leo run sell 10u64 8000u64

{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  order: {
    addr: aleo1d937cyk52y9zjdveu342hy8epqd6lj3dgrregerxweer09a0zurqez8h4f.private,
    qty: 10u64.private,
    price: 8000u64.private,
    amount: 80000u64.private,
    commission: 24u64.private,
    lock_amount: 0u64.private,
    lock_commission: 0u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 8025945051726748785443184839556329052313081507950230053430467825425349799494group.public
}

ask2
aleo1pd4cjynclvdggxssen4mtkq3k5n05yjzheq4znymm6fpww8dtyyq4x2g2y

leo run recharge 100u64 1u64

{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  from: aleo1pd4cjynclvdggxssen4mtkq3k5n05yjzheq4znymm6fpww8dtyyq4x2g2y.private,
  amount: 100u64.private,
  token: 1u64.private,
  _nonce: 3800332007030594478763503223664734023003143826541351793609558284828806359604group.public
}

leo run sell 10u64 9000u64

{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  order: {
    addr: aleo1pd4cjynclvdggxssen4mtkq3k5n05yjzheq4znymm6fpww8dtyyq4x2g2y.private,
    qty: 10u64.private,
    price: 9000u64.private,
    amount: 90000u64.private,
    commission: 27u64.private,
    lock_amount: 0u64.private,
    lock_commission: 0u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 2839946431037416880466008217093611151634614201832426838388903272590633097513group.public
}

ask3
aleo130tgenu0mm5q8w4aeuyh0tasn0upjvuw79f95rvkgegqcexx3vrs200myj

leo run recharge 100u64 1u64

{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  from: aleo130tgenu0mm5q8w4aeuyh0tasn0upjvuw79f95rvkgegqcexx3vrs200myj.private,
  amount: 100u64.private,
  token: 1u64.private,
  _nonce: 3170745149276121778182051766130114136917395704539229756533491191336946104113group.public
}

leo run sell 10u64 10000u64

{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  order: {
    addr: aleo130tgenu0mm5q8w4aeuyh0tasn0upjvuw79f95rvkgegqcexx3vrs200myj.private,
    qty: 10u64.private,
    price: 10000u64.private,
    amount: 100000u64.private,
    commission: 30u64.private,
    lock_amount: 0u64.private,
    lock_commission: 0u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 7352583952641935574364645614105925240401543128677821398212401268563487927543group.public
}

bid1
aleo1xc7czkvea9ahdehlnfhyh4z3es3dwzrnara7dtpeg02qw9whaqzqpwdmku

leo run recharge 1000000u64 2u64

{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  from: aleo1xc7czkvea9ahdehlnfhyh4z3es3dwzrnara7dtpeg02qw9whaqzqpwdmku.private,
  amount: 1000000u64.private,
  token: 2u64.private,
  _nonce: 2684942928921043068294067380977603757282813843730087321828063743997233052094group.public
}

leo run buy 10u64 8500u64

{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  order: {
    addr: aleo1xc7czkvea9ahdehlnfhyh4z3es3dwzrnara7dtpeg02qw9whaqzqpwdmku.private,
    qty: 10u64.private,
    price: 8500u64.private,
    amount: 85000u64.private,
    commission: 25u64.private,
    lock_amount: 85000u64.private,
    lock_commission: 25u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 4530731037460519668561805175351274086146348208680541101964835222934249438026group.public
}

bid2
aleo14eeuqt6r4rwv48qfn8zw0u88dp492enusfzqwnd3nqnelmjnlq9q9xtmtc

leo run recharge 1000000u64 2u64

{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  from: aleo14eeuqt6r4rwv48qfn8zw0u88dp492enusfzqwnd3nqnelmjnlq9q9xtmtc.private,
  amount: 1000000u64.private,
  token: 2u64.private,
  _nonce: 3729501026213141842762978810389555041744596741244985342272995190168343002285group.public
}

leo run buy 10u64 7500u64

{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  order: {
    addr: aleo14eeuqt6r4rwv48qfn8zw0u88dp492enusfzqwnd3nqnelmjnlq9q9xtmtc.private,
    qty: 10u64.private,
    price: 7500u64.private,
    amount: 75000u64.private,
    commission: 22u64.private,
    lock_amount: 75000u64.private,
    lock_commission: 22u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 464528667014153859546473286219448319112577829982347333482223390885735402492group.public
}

bid3
aleo1t6dckz3q43cjxzg9m5pn5w48x346qdpjz39nwy9en3yqczvhzczsyqhjdd

leo run recharge 1000000u64 2u64

{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  from: aleo1t6dckz3q43cjxzg9m5pn5w48x346qdpjz39nwy9en3yqczvhzczsyqhjdd.private,
  amount: 1000000u64.private,
  token: 2u64.private,
  _nonce: 2452043916860789182961799394552689947399410952225123161840172711753052500466group.public
}

leo run buy 10u64 6500u64

{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  order: {
    addr: aleo1t6dckz3q43cjxzg9m5pn5w48x346qdpjz39nwy9en3yqczvhzczsyqhjdd.private,
    qty: 10u64.private,
    price: 6500u64.private,
    amount: 65000u64.private,
    commission: 19u64.private,
    lock_amount: 65000u64.private,
    lock_commission: 19u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 3531571411807694740703527275423909157759909014874184706891750947418211121213group.public
}

handle deal

leo run deal "{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  order: {
    addr: aleo1d937cyk52y9zjdveu342hy8epqd6lj3dgrregerxweer09a0zurqez8h4f.private,
    qty: 10u64.private,
    price: 8000u64.private,
    amount: 80000u64.private,
    commission: 24u64.private,
    lock_amount: 0u64.private,
    lock_commission: 0u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 8025945051726748785443184839556329052313081507950230053430467825425349799494group.public
}" "{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  order: {
    addr: aleo1pd4cjynclvdggxssen4mtkq3k5n05yjzheq4znymm6fpww8dtyyq4x2g2y.private,
    qty: 10u64.private,
    price: 9000u64.private,
    amount: 90000u64.private,
    commission: 27u64.private,
    lock_amount: 0u64.private,
    lock_commission: 0u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 2839946431037416880466008217093611151634614201832426838388903272590633097513group.public
}" "{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  order: {
    addr: aleo130tgenu0mm5q8w4aeuyh0tasn0upjvuw79f95rvkgegqcexx3vrs200myj.private,
    qty: 10u64.private,
    price: 10000u64.private,
    amount: 100000u64.private,
    commission: 30u64.private,
    lock_amount: 0u64.private,
    lock_commission: 0u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 7352583952641935574364645614105925240401543128677821398212401268563487927543group.public
}" "{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  order: {
    addr: aleo1xc7czkvea9ahdehlnfhyh4z3es3dwzrnara7dtpeg02qw9whaqzqpwdmku.private,
    qty: 10u64.private,
    price: 8500u64.private,
    amount: 85000u64.private,
    commission: 25u64.private,
    lock_amount: 85000u64.private,
    lock_commission: 25u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 4530731037460519668561805175351274086146348208680541101964835222934249438026group.public
}" "{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  order: {
    addr: aleo14eeuqt6r4rwv48qfn8zw0u88dp492enusfzqwnd3nqnelmjnlq9q9xtmtc.private,
    qty: 10u64.private,
    price: 7500u64.private,
    amount: 75000u64.private,
    commission: 22u64.private,
    lock_amount: 75000u64.private,
    lock_commission: 22u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 464528667014153859546473286219448319112577829982347333482223390885735402492group.public
}" "{
  owner: aleo1000v3gwn7p8qcc72hzww7x9q0p2ez96scgrwyc8feajq5a4efsqsfhq2uv.private,
  order: {
    addr: aleo1t6dckz3q43cjxzg9m5pn5w48x346qdpjz39nwy9en3yqczvhzczsyqhjdd.private,
    qty: 10u64.private,
    price: 6500u64.private,
    amount: 65000u64.private,
    commission: 19u64.private,
    lock_amount: 65000u64.private,
    lock_commission: 19u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 3531571411807694740703527275423909157759909014874184706891750947418211121213group.public
}"

Outputs

 • {
  owner: aleo1d937cyk52y9zjdveu342hy8epqd6lj3dgrregerxweer09a0zurqez8h4f.private,
  order: {
    addr: aleo1d937cyk52y9zjdveu342hy8epqd6lj3dgrregerxweer09a0zurqez8h4f.private,
    qty: 10u64.private,
    price: 8000u64.private,
    amount: 80000u64.private,
    commission: 24u64.private,
    lock_amount: 0u64.private,
    lock_commission: 0u64.private,
    is_success: true.private,
    is_cancel: false.private
  },
  _nonce: 3002367771103278019569321006148695682809435333436016214860790603418833626851group.public
}
 • {
  owner: aleo1pd4cjynclvdggxssen4mtkq3k5n05yjzheq4znymm6fpww8dtyyq4x2g2y.private,
  order: {
    addr: aleo1pd4cjynclvdggxssen4mtkq3k5n05yjzheq4znymm6fpww8dtyyq4x2g2y.private,
    qty: 10u64.private,
    price: 9000u64.private,
    amount: 90000u64.private,
    commission: 27u64.private,
    lock_amount: 0u64.private,
    lock_commission: 0u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 2840472013148999471997781345956591321001420918294881446794923928625163324811group.public
}
 • {
  owner: aleo130tgenu0mm5q8w4aeuyh0tasn0upjvuw79f95rvkgegqcexx3vrs200myj.private,
  order: {
    addr: aleo130tgenu0mm5q8w4aeuyh0tasn0upjvuw79f95rvkgegqcexx3vrs200myj.private,
    qty: 10u64.private,
    price: 10000u64.private,
    amount: 100000u64.private,
    commission: 30u64.private,
    lock_amount: 0u64.private,
    lock_commission: 0u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 2714203701250461901027838757733913955803600753444173392449668222240037175033group.public
}
 • {
  owner: aleo1xc7czkvea9ahdehlnfhyh4z3es3dwzrnara7dtpeg02qw9whaqzqpwdmku.private,
  order: {
    addr: aleo1xc7czkvea9ahdehlnfhyh4z3es3dwzrnara7dtpeg02qw9whaqzqpwdmku.private,
    qty: 10u64.private,
    price: 8500u64.private,
    amount: 80000u64.private,
    commission: 24u64.private,
    lock_amount: 85000u64.private,
    lock_commission: 25u64.private,
    is_success: true.private,
    is_cancel: false.private
  },
  _nonce: 5163235553570664186634763854490272889080187125444423362442956607442264480094group.public
}
 • {
  owner: aleo14eeuqt6r4rwv48qfn8zw0u88dp492enusfzqwnd3nqnelmjnlq9q9xtmtc.private,
  order: {
    addr: aleo14eeuqt6r4rwv48qfn8zw0u88dp492enusfzqwnd3nqnelmjnlq9q9xtmtc.private,
    qty: 10u64.private,
    price: 7500u64.private,
    amount: 75000u64.private,
    commission: 22u64.private,
    lock_amount: 75000u64.private,
    lock_commission: 22u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 5035398278583734130251190670394677242126484857301278675319505956165084454264group.public
}
 • {
  owner: aleo1t6dckz3q43cjxzg9m5pn5w48x346qdpjz39nwy9en3yqczvhzczsyqhjdd.private,
  order: {
    addr: aleo1t6dckz3q43cjxzg9m5pn5w48x346qdpjz39nwy9en3yqczvhzczsyqhjdd.private,
    qty: 10u64.private,
    price: 6500u64.private,
    amount: 65000u64.private,
    commission: 19u64.private,
    lock_amount: 65000u64.private,
    lock_commission: 19u64.private,
    is_success: false.private,
    is_cancel: false.private
  },
  _nonce: 2028477193996344814854320790916508205171467778876905304712745395658314087938group.public
}

