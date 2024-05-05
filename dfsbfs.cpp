#include<iostream>
#include<vector>
#include<queue>
using namespace std;

class Graph
{
	vector<vector<int>> adjList;
	public:
		Graph(int n)
		{
			adjList.resize(n);
		}
		
		void addEdge(int u,int v)
		{
			adjList[u].push_back(v);
			adjList[v].push_back(u);
		}
		
		void dfsUtil(int v,bool visited[])
		{
			visited[v]=true;
			cout<<v<<" ";
			for(int n:adjList[v])
			{
				if(!visited[n])
				{
					dfsUtil(n,visited);
				}
			}
		}
		
		void dfs(int start)
		{
			bool visited[adjList.size()]={false};
			dfsUtil(start,visited);
		}
		
		void bfs(int start)
		{
			bool visited[adjList.size()]={false};
			queue <int> q;
			q.push(start);
			visited[start]=true;
			while(!q.empty())
			{
				int u=q.front();
				q.pop();
				cout<<u<<" ";
				for(int n:adjList[u])
				{
					if(!visited[n])
					{
						q.push(n);
						visited[n]=true;
					}
				}
			
			}
		}
};

int main()
{
	int numVertices, numEdges;
    cout << "Enter the number of vertices: ";
    cin >> numVertices;

    cout << "Enter the number of edges: ";
    cin >> numEdges;

    Graph g(numVertices);

    cout << "Enter the edges (format: u v):" << endl;
    for (int i = 0; i < numEdges; ++i) {
        int u, v;
        cin >> u >> v;
        g.addEdge(u, v);
    }

    int startVertex;
    cout << "Enter the starting vertex: ";
    cin >> startVertex;

    cout << "Depth First Search: ";
    g.dfs(startVertex);
    cout << endl;

    cout << "Breadth First Search: ";
    g.bfs(startVertex);
    cout << endl;

    return 0;
}