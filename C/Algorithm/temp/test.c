class TreeNode:
    def __init__(self, key):
        self.key = key
        self.left = None
        self.right = None

def preorder_traversal(root):
    if root:
        print(root.key, end=" ")
        preorder_traversal(root.left)
        preorder_traversal(root.right)

def inorder_traversal(root):
    if root:
        inorder_traversal(root.left)
        print(root.key, end=" ")
        inorder_traversal(root.right)

def count_nodes(root):
    if root is None:
        return 0
    return 1 + count_nodes(root.left) + count_nodes(root.right)

def huffman_coding(data):
    nodes = [TreeNode((symbol, freq)) for symbol, freq in data.items()]
    while len(nodes) > 1:
        nodes.sort(key=lambda x: x.key[1])
        left = nodes.pop(0)
        right = nodes.pop(0)
        new_node = TreeNode((None, left.key[1] + right.key[1]))
        new_node.left = left
        new_node.right = right
        nodes.append(new_node)
    return nodes[0]

def huffman_codes(root, code="", mapping=None):
    if mapping is None:
        mapping = {}
    if root.key[0] is not None:
        mapping[root.key[0]] = code
    if root.left:
        huffman_codes(root.left, code + "0", mapping)
    if root.right:
        huffman_codes(root.right, code + "1", mapping)
    return mapping

# Example usage
if __name__ == "__main__":
    # Binary Tree
    root = TreeNode(1)
    root.left = TreeNode(2)
    root.right = TreeNode(3)
    root.left.left = TreeNode(4)
    root.left.right = TreeNode(5)

    print("Preorder Traversal:")
    preorder_traversal(root)
    print("\nInorder Traversal:")
    inorder_traversal(root)
    print("\nNumber of Nodes:", count_nodes(root))

    # Huffman Coding
    data = {'a': 4, 'b': 9, 'c': 12, 'd': 5, 'e': 13, 'f': 16}
    huffman_tree = huffman_coding(data)
    huffman_mapping = huffman_codes(huffman_tree)

    print("\n\nHuffman Coding:")
    for symbol, code in huffman_mapping.items():
        print(f"{symbol}: {code}")