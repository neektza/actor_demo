ruby+actors
-----------

1. Actors
	- high level concurrency abstraction
		* thread:actor != 1:1
	- concurrent objects/processes, exist and exectute independently
		* each actor has it's own state, they (ideally) share nothing
		* erlang has immutable data structures, ruby doesn't (take care of it yourself!)
	- recomendation - concurrency is not parallelism talk

2. Ruby Actors - Celluloid
	- OOP actor = cell, Erlang actors are processes that have no state, Ruby actor have state in for of instance variables
	- internals:
		* each object/actor runs in a separate thread
		* each task is executed in it's own fiber (enables long lasting ops to be suspended)
	- implements the core erlang ideas:
		* linking/monitoring
		* supervisors
	- some other cool features:
		* futures
		* pools

3. Demo ...
