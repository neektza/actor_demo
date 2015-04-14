ruby+actors
-----------

1. Aktori
	- high level concurrency apstrakcija
		* thread:actor != 1:1
	- concurrent objects/processes, postoje i izvrsavaju se nezavisno
		* svaki ima svoj state, nista se ne dijeli (idealno)
		* erlang je immutable, ruby nije
	- preporuka (concurrency is not parallelism)

2. Ruby aktori - Celluloid
	- OOP aktori - cellovi (Erlang aktori su procesi koji nemaju stanje)
	- internalije
		* svaki objekt ima svoj thread
		* svaki message (method) se vrti u svom fiberu (sto omogucuje suspenziju blocking callova)
	- erlang filozofija + hrpa ostalih super kul stvari
		* linking/monitoring
		* supervisors
		* supervision groups
		* futures

3. Live demo
	- use case
	- stari kod
	- novi kod
