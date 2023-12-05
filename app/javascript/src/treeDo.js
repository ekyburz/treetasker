export const createTreeDo = () => {
  const trunkGeometry = new THREE.CylinderGeometry(0.2, 0.2, 1, 12);
  const trunkMaterial = new THREE.MeshBasicMaterial({ color: 0x8b4513 });
  const trunk = new THREE.Mesh(trunkGeometry, trunkMaterial);

  const leavesGeometry = new THREE.ConeGeometry(0.8, 1.5, 12);
  const leavesMaterial = new THREE.MeshBasicMaterial({ color: 0x1cb41c });
  const leaves = new THREE.Mesh(leavesGeometry, leavesMaterial);

  const treeGroup = new THREE.Group();

  trunk.position.y = 0.5;
  leaves.position.y = 1.5;

  treeGroup.add(trunk);
  treeGroup.add(leaves);

  return { trunk, leaves, treeGroup };
};
