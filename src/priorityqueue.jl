using DataStructures

pq = PriorityQueue() # empty queue
pq['a'] = 10 # enqueue or push
pq['b'] = 5 
pq['c'] = 15
peek(pq) # expose lowest priority item
dequeue!(pq) # dequeue or pop
