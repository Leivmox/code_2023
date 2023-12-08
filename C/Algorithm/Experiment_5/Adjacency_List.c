#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define MAX_VERTICES 8 // 最大顶点数

// 定义邻接表中的节点结构
typedef struct Node {
    int vertex;
    int weight;
    struct Node *next;
} Node;

// 定义邻接表
typedef struct {
    Node *head;
} AdjList;

// 定义图结构，包含邻接表数组和顶点数
typedef struct {
    int num_vertices;
    AdjList *array;
} Graph;

// 创建图
Graph* createGraph(int num_vertices) {
    Graph* graph = (Graph*)malloc(sizeof(Graph));
    graph->num_vertices = num_vertices;

    graph->array = (AdjList*)malloc(num_vertices * sizeof(AdjList));

    for (int i = 0; i < num_vertices; ++i) {
        graph->array[i].head = NULL;
    }

    return graph;
}

// 添加边到邻接表
void addEdge(Graph* graph, int start, int end, int weight) {
    // 添加边 start -> end
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->vertex = end;
    newNode->weight = weight;
    newNode->next = graph->array[start].head;
    graph->array[start].head = newNode;

    // 添加边 end -> start （无向图）
    newNode = (Node*)malloc(sizeof(Node));
    newNode->vertex = start;
    newNode->weight = weight;
    newNode->next = graph->array[end].head;
    graph->array[end].head = newNode;
}

// 深度优先搜索递归函数
void DFSUtil(Graph* graph, int vertex, int visited[]) {
    visited[vertex] = 1;
    printf("%d ", vertex);

    Node* temp = graph->array[vertex].head;
    while (temp) {
        int adj_vertex = temp->vertex;
        if (!visited[adj_vertex]) {
            DFSUtil(graph, adj_vertex, visited);
        }
        temp = temp->next;
    }
}

// 深度优先搜索
void DFS(Graph* graph, int start) {
    int* visited = (int*)malloc(graph->num_vertices * sizeof(int));
    for (int i = 0; i < graph->num_vertices; ++i) {
        visited[i] = 0;
    }

    printf("深度优先搜索结果：\n");
    DFSUtil(graph, start, visited);
    printf("\n");

    free(visited);
}

// 广度优先搜索
void BFS(Graph* graph, int start) {
    int* visited = (int*)malloc(graph->num_vertices * sizeof(int));
    for (int i = 0; i < graph->num_vertices; ++i) {
        visited[i] = 0;
    }

    int queue[graph->num_vertices];
    int front = 0, rear = 0;

    visited[start] = 1;
    queue[rear++] = start;

    printf("广度优先搜索结果：\n");
    while (front < rear) {
        int vertex = queue[front++];
        printf("%d ", vertex);

        Node* temp = graph->array[vertex].head;
        while (temp) {
            int adj_vertex = temp->vertex;
            if (!visited[adj_vertex]) {
                visited[adj_vertex] = 1;
                queue[rear++] = adj_vertex;
            }
            temp = temp->next;
        }
    }
    printf("\n");

    free(visited);
}

// 寻找最小生成树的 Prim 算法
void primMST(Graph* graph) {
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
        Node* temp = graph->array[minIndex].head;
        while (temp) {
            int adj_vertex = temp->vertex;
            int weight = temp->weight;
            if (mstSet[adj_vertex] == 0 && weight < key[adj_vertex]) {
                parent[adj_vertex] = minIndex;
                key[adj_vertex] = weight;
            }
            temp = temp->next;
        }
    }

    // 输出最小生成树
    printf("最小生成树的边:\n");
    for (int i = 1; i < graph->num_vertices; i++) {
        printf("%d - %d\n", parent[i], i);
    }
}

int main() {
    Graph* graph = createGraph(MAX_VERTICES);

    // 添加边到图中
    addEdge(graph, 0, 1, 4);
    addEdge(graph, 0, 2, 8);
    addEdge(graph, 1, 3, 6);
    addEdge(graph, 1, 4, 2);
    addEdge(graph, 2, 4, 3);
    addEdge(graph, 3, 5, 5);
    addEdge(graph, 4, 5, 7);
    addEdge(graph, 5, 6, 4);
    addEdge(graph, 5, 7, 9);

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
                DFS(graph, 0);
                break;
            case 2:
                BFS(graph, 0);
                break;
            case 3:
                primMST(graph);
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
