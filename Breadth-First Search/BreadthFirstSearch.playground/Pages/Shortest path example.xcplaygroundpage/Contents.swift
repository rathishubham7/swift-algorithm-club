//: [Previous](@previous)

//: # Shortest Path Example

func breadthFirstSearchShortestPath(graph: Graph, source: Node) -> Graph {
  let shortestPathGraph = graph.duplicate()

  var queue = Queue<Node>()
  let sourceInShortestPathsGraph = shortestPathGraph.findNodeWithLabel(source.label)
  queue.enqueue(sourceInShortestPathsGraph)
  sourceInShortestPathsGraph.distance = 0

  while !queue.isEmpty {
    let current = queue.dequeue()!
    for edge in current.neighbors {
      let neighborNode = edge.neighbor
      if !neighborNode.hasDistance {
        queue.enqueue(neighborNode)
        neighborNode.distance = current.distance! + 1
      }
    }
  }

  return shortestPathGraph
}
/*:
![Animated example of a breadth-first search](Animated_BFS.gif)
*/

let graph = Graph()

let nodeA = graph.addNode("a")
let nodeB = graph.addNode("b")
let nodeC = graph.addNode("c")
let nodeD = graph.addNode("d")
let nodeE = graph.addNode("e")
let nodeF = graph.addNode("f")
let nodeG = graph.addNode("g")
let nodeH = graph.addNode("h")

graph.addEdge(nodeA, neighbor: nodeB)
graph.addEdge(nodeA, neighbor: nodeC)
graph.addEdge(nodeB, neighbor: nodeD)
graph.addEdge(nodeB, neighbor: nodeE)
graph.addEdge(nodeC, neighbor: nodeF)
graph.addEdge(nodeC, neighbor: nodeG)
graph.addEdge(nodeE, neighbor: nodeH)

let shortestPathGraph = breadthFirstSearchShortestPath(graph, source: nodeA)
print(shortestPathGraph.nodes)

//: [Next: Minimum Spanning Tree Example](@next)

