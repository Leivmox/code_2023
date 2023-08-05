#include <stdio.h>
#include <stdbool.h>
#include <limits.h>

#define V 5 // 图中顶点的数量

// 辅助函数：找到距离数组中最小距离对应的顶点
int minDistance(int dist[], bool sptSet[]) {
    int min = INT_MAX, min_index;

    for (int v = 0; v < V; v++) {
        if (sptSet[v] == false && dist[v] <= min) {
            min = dist[v];
            min_index = v;
        }
    }

    return min_index;
}

// 辅助函数：打印最短路径
void printPath(int parent[], int j) {
    if (parent[j] == -1)
        return;

    printPath(parent, parent[j]);
    printf(" -> %d", j);
}

// Dijkstra算法
void dijkstra(int graph[V][V], int src) {
    int dist[V]; // 存储从源点到每个顶点的最短距离
    bool sptSet[V]; 
    int parent[V]; 


    for (int i = 0; i < V; i++) {
        dist[i] = INT_MAX;
        sptSet[i] = false;
        parent[i] = -1;
    }


    dist[src] = 0;


    for (int count = 0; count < V - 1; count++) {
        int u = minDistance(dist, sptSet);
        sptSet[u] = true;

        for (int v = 0; v < V; v++) {
            if (!sptSet[v] && graph[u][v] && dist[u] != INT_MAX && dist[u] + graph[u][v] < dist[v]) {
                dist[v] = dist[u] + graph[u][v];
                parent[v] = u;
            }
        }
    }


    printf("顶点\t\t最短距离\t\t最短路径\n");
    for (int i = 0; i < V; i++) {
        printf("%d\t\t%d\t\t%d", i, dist[i], src);
        printPath(parent, i);
        printf("\n");
    }
}

int main() {
    int graph[V][V] = {
        {0, 10, 20, 0, 0},
        {10, 0, 5, 40, 0},
        {20, 5, 0, 60, 30},
        {0, 40, 60, 0, 20},
        {0, 0, 30, 20, 0}
    };

    int src = 0; // 源点
    dijkstra(graph, src);

    return 0;
}
