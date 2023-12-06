export const createTreeDelegate = () => {
  // Trunk
  const trunkGeometry = new THREE.CylinderGeometry(0.2, 0.2, 1, 12);
  const trunkMaterial = new THREE.MeshBasicMaterial({ color: 0x8b4513 });
  const trunk = new THREE.Mesh(trunkGeometry, trunkMaterial);

  // Leaves
  const leavesGeometry = new THREE.SphereGeometry(1, 12, 8);
  const leavesMaterial = new THREE.MeshBasicMaterial({ color: 0x537708 });
  const leaves = new THREE.Mesh(leavesGeometry, leavesMaterial);
  leaves.position.y = 1.5;

  // Apples
  const apples = new THREE.Group();
  const appleGeometry = new THREE.SphereGeometry(0.3, 8, 8);
  const appleMaterial = new THREE.MeshBasicMaterial({ color: 0xff0000 });

  for (let i = 0; i < 5; i++) {
    const apple = new THREE.Mesh(appleGeometry, appleMaterial);
    apple.position.y = 1.2;
    apple.position.x = Math.sin((i / 5) * Math.PI * 2) * 0.8;
    apple.position.z = Math.cos((i / 5) * Math.PI * 2) * 0.8;
    apples.add(apple);
  }

  // Tree group
  const treeGroup = new THREE.Group();
  treeGroup.add(trunk);
  treeGroup.add(leaves);
  treeGroup.add(apples);

  return { trunk, leaves, apples, treeGroup };
};
