#include <iostream>
#include <climits>
#include <iostream>
#include <vector>
#include <queue>
#include <utility>

using namespace std;

#define INF INT_MAX

typedef pair<int, int> pii;

void primMST(vector<vector<pii>>& graph, int start) {
    int V = graph.size();
    vector<int> key(V, INF), parent(V, -1);
    vector<bool> visited(V, false);
    priority_queue<pii, vector<pii>, greater<pii>> pq;
    
    pq.push({0, start});
    key[start] = 0;

    while (!pq.empty()) {
        int u = pq.top().second;
        pq.pop();

        if (visited[u]) continue;
        visited[u] = true;

        for (auto& edge : graph[u]) {
            int v = edge.first;
            int weight = edge.second;

            if (!visited[v] && weight < key[v]) {
                parent[v] = u;
                key[v] = weight;
                pq.push({key[v], v});
            }
        }
    }

    cout << "Edges in the MST:\n";
    for (int i = 0; i < V; ++i) {
        if (parent[i] != -1) {
            cout << parent[i] << " - " << i << "\t" << key[i] << endl;
        }
    }
}

int main() {
    int V, E;
    cout << "Enter the number of vertices and edges: ";
    cin >> V >> E;

    vector<vector<pii>> graph(V);

    cout << "Enter the source, destination, and weight for each edge:\n";
    for (int i = 0; i < E; ++i) {
        int src, dest, weight;
        cin >> src >> dest >> weight;
        graph[src].push_back({dest, weight});
        graph[dest].push_back({src, weight});
    }

    int start;
    cout << "Enter the starting vertex: ";
    cin >> start;

    primMST(graph, start);

    return 0;
}
