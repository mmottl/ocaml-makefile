open Printf

type 'a prodcons =
  { buffer: 'a array;
    lock: Mutex.t;
    mutable readpos: int;
    mutable writepos: int;
    notempty: Condition.t;
    notfull: Condition.t }

let create size init =
  { buffer = Array.make size init;
    lock = Mutex.create();
    readpos = 0;
    writepos = 0;
    notempty = Condition.create();
    notfull = Condition.create() }

let put p data =
  Mutex.lock p.lock;
  while (p.writepos + 1) mod Array.length p.buffer = p.readpos do
    Condition.wait p.notfull p.lock
  done;
  p.buffer.(p.writepos) <- data;
  p.writepos <- (p.writepos + 1) mod Array.length p.buffer;
  Condition.signal p.notempty;
  Mutex.unlock p.lock

let get p =
  Mutex.lock p.lock;
  while p.writepos = p.readpos do
    Condition.wait p.notempty p.lock
  done;
  let data = p.buffer.(p.readpos) in
  p.readpos <- (p.readpos + 1) mod Array.length p.buffer;
  Condition.signal p.notfull;
  Mutex.unlock p.lock;
  data

(* Test *)
let _ =
  let buff = create 20 0 in
  let rec produce n = put buff n; printf "%d-->\n" n; produce (n+1)
  and consume () = let n = get buff in printf "-->%d\n" n; consume () in
  ignore (Thread.create produce 0); consume()
