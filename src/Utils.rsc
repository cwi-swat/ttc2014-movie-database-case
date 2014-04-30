module Utils

import List;
import IO;
import Set;

//set[set[int]] combinations(set[int] numbers, int n) {
//  if (n == 1) {
//    return {{i}| i <- numbers};
//  }
//  return { s + {i} | i <- numbers, s <- combinations(numbers, n - 1), i notin s };
//}


set[set[int]] combinations(set[int] nums, int m) {
  xs = toList(nums);
  if (m > size(xs)) {
    return {};
  }
  //list[set[set[int]]] arr = [ {} |  i <- [0..m+1] ];
  map[int,set[set[int]]] arr = ( i: {} | i <- [0..m+1] );
  arr[0] = {{}};
  for (j <- [0..size(xs) - m + 1], i <- [1..m+1]) {
    arr[i] += { {xs[j+i-1], *ys} | set[int] ys <- arr[i-1] };
  }
  return arr[m];
}
	
//let comb m xs =
//  let xs = Array.of_list xs in
//  if m > Array.length xs then
//    []
//  else begin
//    let arr = Array.make (m+1) [] in
//    arr.(0) <- [[]];
//    for j = 0 to Array.length xs - m do
//      for i = 1 to m do
//        arr.(i) <- arr.(i) @ List.map (fun ys -> xs.(j+i-1)::ys) arr.(i-1)
//      done 
//    done;
//    arr.(m)
//  end
//;;


