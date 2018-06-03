// A C /for Dijkstra's single source shortest path algorithm.
// The program is for adjacency matrix representation of the graph
// Number of vertices in the graph
V=9;

// A utility function to find the vertex with minimum distance value, from
// the set of vertices not yet included in shortest path tree
function [min_index] = minDistance(dist[],sptSet[])
// Initialize min value
min = INT_MAX, min_index

for v = 0:V
	if sptSet[v] == false && dist[v] <= min then
		min = dist[v], min_index = v;
	end
end

return min_index
endfunction

// A utility function to print the const ructed distance array
function printSolution(dist[],n)

disp("Vertex Distance from Source\n")
for i = 0:V
	disp("%d \t\t %d\n", i, dist[i]);
end
endfunction

// Funtion that implements Dijkstra's single source shortest path algorithm
// for a graph represented using adjacency matrix representation
function dijkstra(int graph[V][V], int src)

	int dist[V]; // The output array. dist[i] will hold the shortest
					// distance from src to i

	bool sptSet[V];  // sptSet[i] will true if vertex i is included in shortest
					// path tree or shortest distance from src to i is finalized

	// Initialize all distances as INFINITE and stpSet[] as false
	for i = 0:V
		dist[i] = INT_MAX, sptSet[i] = false;
	end

	// Distance of source vertex from itself is always 0
	dist[src] = 0;

	// Find shortest path for all vertices
	for count = 0:V-1
	// Pick the minimum distance vertex from the set of vertices not
	// yet processed. u is always equal to src in first iteration.
	int u = minDistance(dist, sptSet);

	// Mark the picked vertex as processed
	sptSet[u] = true;

	// Update dist value of the adjacent vertices of the picked vertex.
	for (int v = 0; v < V; v++)

		// Update dist[v] only if is not in sptSet, there is an edge from 
		// u to v, and total weight of path from src to v through u is 
		// smaller than current value of dist[v]
		if !sptSet[v] && graph[u][v] && dist[u]!= INT_MAX && dist[u]+graph[u][v] < dist[v] then
			dist[v] = dist[u] + graph[u][v];
		end

	end

	// print the constructed distance array
	printSolution(dist, V);
endfunction

// driver program to test above function
int main()
{
/* Let us create the example graph discussed above */
int graph[V][V] = [0 4 0 0 0 0 0 8 0;4 0 8 0 0 0 0 11 0;0 8 0 7 0 4 0 0 2;0 0 7 0 9 14 0 0 0;0 0 0 9 0 10 0 0 0;0 0 4 14 10 0 2 0 0;0 0 0 0 0 2 0 1 6;8 11 0 0 0 0 1 0 7;0 0 2 0 0 0 6 7 0];

	dijkstra(graph, 0);

	return 0;
}
