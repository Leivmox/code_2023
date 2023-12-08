#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define MAX_VERTICES 8 // 最大顶点数

// 邻接矩阵表示的图结构
typedef struct {
    int matrix[MAX_VERTICES][MAX_VERTICES]; // 邻接矩阵
    int num_vertices; // 当前图中顶点的数量
} Graph;

// 栈的结构和操作（用于深度优先搜索）
typedef struct {
    int data[MAX_VERTICES];
    int top;
} Stack;

// 初始化图
void initializeGraph(Graph *graph, int num_vertices) {
    graph->num_vertices = num_vertices;
    for (int i = 0; i < num_vertices; i++) {
        for (int j = 0; j < num_vertices; j++) {
            graph->matrix[i][j] = 0; // 初始化邻接矩阵，0 表示无连接
        }
    }
}

// 添加边到邻接矩阵
void addEdge(Graph *graph, int start, int end, int weight) {
    graph->matrix[start][end] = weight;
    graph->matrix[end][start] = weight; // 无向图，所以两个方向都要设置
}

// 深度优先搜索
void DFS(Graph *graph, int vertex, int visited[]) {
    visited[vertex] = 1;
    printf("%d ", vertex);

    for (int i = 0; i < graph->num_vertices; i++) {
        if (graph->matrix[vertex][i] != 0 && !visited[i]) {
            DFS(graph, i, visited);
        }
    }
}

// 广度优先搜索
void BFS(Graph *graph, int start) {
    int visited[MAX_VERTICES] = {0};
    int queue[MAX_VERTICES];
    int front = 0, rear = 0;

    visited[start] = 1;
    printf("%d ", start);
    queue[rear++] = start;

    while (front < rear) {
        int current = queue[front++];

        for (int i = 0; i < graph->num_vertices; i++) {
            if (graph->matrix[current][i] != 0 && !visited[i]) {
                visited[i] = 1;
                printf("%d ", i);
                queue[rear++] = i;
            }
        }
    }
}

// 寻找最小生成树的 Prim 算法
void primMST(Graph *graph) {
    int parent[MAX_VERTICES]; // 用于存储最小生成树的父节点
    int key[MAX_VERTICES]; // 用于存储选择的顶点到最小生成树的距离
    int mstSet[MAX_VERTICES]; // 标记顶点是否已经包含在最小生成树中

    for (int i = 0; i < graph->num_vertices; i++) {
        key[i] = INT_MAX; // 初始化所有顶点的距离为无穷大
        mstSet[i] = 0; // 初始化所有顶点都不在最小生成树中
    }

    key[0] = 0; // 从第一个顶点开始构建最小生成树
    parent[0] = -1; // 第一个顶点作为根节点

    for (int count = 0; count < graph->num_vertices - 1; count++) {
        int minKey = INT_MAX;
        int minIndex;

        // 选择当前 key 值最小的顶点
        for (int v = 0; v < graph->num_vertices; v++) {
            if (mstSet[v] == 0 && key[v] < minKey) {
                minKey = key[v];
                minIndex = v;
            }
        }

        mstSet[minIndex] = 1; // 标记已选择的顶点为已访问

        // 更新与选定顶点相邻的顶点的 key 值
        for (int v = 0; v < graph->num_vertices; v++) {
            if (graph->matrix[minIndex][v] != 0 && mstSet[v] == 0 && graph->matrix[minIndex][v] < key[v]) {
                parent[v] = minIndex;
                key[v] = graph->matrix[minIndex][v];
            }
        }
    }

    // 输出最小生成树
    printf("最小生成树的边:\n");
    for (int i = 1; i < graph->num_vertices; i++) {
        printf("%d - %d\n", parent[i], i);
    }
}

int main() {
    Graph graph;
    initializeGraph(&graph, MAX_VERTICES); // 初始化一个具有最大顶点数的图

    // 添加边到图中，这里使用示例数据，你可以根据需要修改输入的数据和顶点数量
    addEdge(&graph, 0, 1, 4);
    addEdge(&graph, 0, 2, 8);
    addEdge(&graph, 1, 2, 2);
    addEdge(&graph, 1, 3, 6);
    addEdge(&graph, 2, 4, 3);
    addEdge(&graph, 2, 5, 9);
    addEdge(&graph, 3, 5, 5);
    addEdge(&graph, 4, 5, 7);
    addEdge(&graph, 4, 6, 1);
    addEdge(&graph, 5, 7, 4);
    addEdge(&graph, 6, 7, 2);

    int choice;
    do {
        printf("\n图算法菜单：\n");
        printf("1. 深度优先搜索\n");
        printf("2. 广度优先搜索\n");
        printf("3. 求最小生成树\n");
        printf("0. 退出\n");
        printf("请选择操作：");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("深度优先搜索结果：\n");
                int visited_dfs[MAX_VERTICES] = {0};
                DFS(&graph, 0, visited_dfs);
                break;
            case 2:
                printf("广度优先搜索结果：\n");
                BFS(&graph, 0);
                break;
            case 3:
                printf("最小生成树结果：\n");
                primMST(&graph);
                break;
            case 0:
                printf("退出程序。\n");
                break;
            default:
                printf("无效选择，请重新输入。\n");
        }
    } while (choice != 0);

    return 0;
}
