figma.showUI(__html__, { width: 300, height: 150 });

figma.ui.onmessage = (msg) => {
  if (msg.type === 'measure-line') {
    const selectedNodes: SceneNode[] = figma.currentPage.selection;
    let totalDistance = 0;

    selectedNodes.forEach((node) => {
      if (!node || (node.type !== 'VECTOR' && node.type !== 'LINE')) {
        figma.ui.postMessage({ type: 'error', message: 'Please select a vector path or line.' });
        return;
      }

      if (node.type === 'VECTOR') {
        const vectorPath = node as VectorNode;
        totalDistance += calculateTotalDistance(vectorPath);
      } else if (node.type === 'LINE') {
        const line = node as LineNode;
        totalDistance += line.width;
      }  
    });

    figma.ui.postMessage({ type: 'result', distance: totalDistance });
  }

  if (msg.type === 'close') {
    figma.closePlugin();
  }
};

function calculateTotalDistance(vectorNode: VectorNode): number {
  if (!vectorNode.vectorNetwork || !vectorNode.vectorNetwork.vertices) {
    return 0;
  }

  const vertices = vectorNode.vectorNetwork.vertices;
  const segments = vectorNode.vectorNetwork.segments;
  let totalDistance = 0;

  segments.forEach((segment) => {
    const startVertex = vertices[segment.start];
    const endVertex = vertices[segment.end];

    const distance = calculateDistance(
      startVertex.x,
      startVertex.y,
      endVertex.x,
      endVertex.y
    );

    totalDistance += distance;
  });

  return totalDistance;
}

function calculateDistance(x1: number, y1: number, x2: number, y2: number): number {
  return Math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2);
}