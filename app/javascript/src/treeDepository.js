export const createTreeDepository = () => {
  // Trunk
  const trunkGeometry = new THREE.CylinderGeometry(0.2, 0.2, 1, 12);
  const trunkMaterial = new THREE.MeshBasicMaterial({ color: 0x8b4513 });
  const trunk = new THREE.Mesh(trunkGeometry, trunkMaterial);

  // Leaves
  const leavesGeometry1 = new THREE.SphereGeometry(0.7, 6, 6);
  const leavesGeometry2 = new THREE.SphereGeometry(0.5, 6, 6);
  const leavesGeometry3 = new THREE.SphereGeometry(0.3, 6, 6);
  // diffrent green colors
  const leavesMaterial = new THREE.MeshBasicMaterial({ color: 0x1b5a00 });

  const leaves01 = new THREE.Mesh(leavesGeometry1, leavesMaterial);
  const leaves02 = new THREE.Mesh(leavesGeometry2, leavesMaterial);
  const leaves03 = new THREE.Mesh(leavesGeometry3, leavesMaterial);

  // Branches
  const branchGeometry1 = new THREE.CylinderGeometry(0.1, 0.1, 1.3, 8);
  const branchGeometry2 = new THREE.CylinderGeometry(0.125, 0.125, 1, 8);
  const branchMaterial = new THREE.MeshBasicMaterial({ color: 0x8b4513 });
  branchGeometry1.rotateX(Math.PI / 4);
  branchGeometry2.rotateX(-Math.PI / 4);

  const branch01 = new THREE.Mesh(branchGeometry1, branchMaterial);
  const branch02 = new THREE.Mesh(branchGeometry2, branchMaterial);

  // Positioning elements
  trunk.position.y = 0.5;
  leaves01.position.set(0, 1.5, 0);
  leaves02.position.set(0, 0.9, -0.8);
  leaves03.position.set(0, 1.1, 0.8);
  branch01.position.set(0, 0.8, 0.5);
  branch02.position.set(0, 0.5, -0.4);

  // Create a group for the tree
  const treeGroup = new THREE.Group();

  // Add elements to the group
  treeGroup.add(trunk);
  treeGroup.add(leaves01);
  treeGroup.add(leaves02);
  treeGroup.add(leaves03);
  treeGroup.add(branch01);
  treeGroup.add(branch02);

  // Lights
  const pointLight = new THREE.PointLight(0xffffff, 1, 100);
  pointLight.position.set(0, 5, 5);
  treeGroup.add(pointLight);

  // Additional details like ornaments or decorations can be added here

  return {
    trunk,
    leaves01,
    leaves02,
    leaves03,
    branch01,
    branch02,
    treeGroup,
  };
};
