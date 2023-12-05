export const createTreeDelegate = () => {
  // Trunk
  const trunkGeometry = new THREE.CylinderGeometry(0.2, 0.2, 1, 32, 1, false);
  const trunkMaterial = new THREE.MeshStandardMaterial({
    color: 0x00aae4,
    roughness: 1,
    metalness: 0,
    emissive: 0x00aae4,
    envMapIntensity: 1,
    blendColor: 0,
  });
  const trunk = new THREE.Mesh(trunkGeometry, trunkMaterial);
  trunk.name = "Cylinder";

  // Leaves
  const leavesGeometry = new THREE.SphereGeometry(
    1,
    32,
    16,
    0,
    6.283185307179586,
    0,
    3.141592653589793
  );
  const leavesMaterial = new THREE.MeshStandardMaterial({
    color: 0x7f7f7f,
    roughness: 1,
    metalness: 0,
    emissive: 0xbb8080,
    envMapIntensity: 1,
    blendColor: 0,
  });
  const leaves = new THREE.Mesh(leavesGeometry, leavesMaterial);
  leaves.name = "leaves";

  // Apple
  const appleGeometry = new THREE.SphereGeometry(
    0.1,
    32,
    16,
    0,
    6.283185307179586,
    0,
    3.141592653589793
  );
  const appleMaterial = new THREE.MeshStandardMaterial({
    color: 0xb60520,
    roughness: 1,
    metalness: 0,
    emissive: 0xb60520,
    envMapIntensity: 1,
    blendColor: 0,
  });
  const apple = new THREE.Mesh(appleGeometry, appleMaterial);
  apple.name = "apple";

  // Tree Group
  const treeGroup = new THREE.Group();
  treeGroup.add(trunk);
  treeGroup.add(leaves);
  treeGroup.add(apple);

  return { trunk, leaves, apple, treeGroup };
};
