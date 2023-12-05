export const createTreeDecide = () => {
  const geometry = new THREE.BoxGeometry(1, 1, 1);
  const trunkgeometry = new THREE.CylinderGeometry(0.2, 0.2, 1, 12);

  const leaveDarkMaterial = new THREE.MeshBasicMaterial({ color: 0x91e56e });
  const leaveLightMaterial = new THREE.MeshBasicMaterial({ color: 0xa2ff7a });
  const leaveDarkDarkMaterial = new THREE.MeshBasicMaterial({
    color: 0x71b356,
  });

  const stemMaterial = new THREE.MeshBasicMaterial({ color: 0x7d5a4f });
  const stem = new THREE.Mesh(trunkgeometry, stemMaterial);
  stem.position.set(0, 0, 0);

  const squareLeave01 = new THREE.Mesh(geometry, leaveDarkMaterial);
  squareLeave01.position.set(0.5, 1.6, 0.5);
  squareLeave01.scale.set(0.8, 0.8, 0.8);

  const squareLeave02 = new THREE.Mesh(geometry, leaveDarkMaterial);
  squareLeave02.position.set(-0.4, 1.3, -0.4);
  squareLeave02.scale.set(0.7, 0.7, 0.7);

  const squareLeave03 = new THREE.Mesh(geometry, leaveDarkMaterial);
  squareLeave03.position.set(0.4, 1.7, -0.5);
  squareLeave03.scale.set(0.7, 0.7, 0.7);

  const leaveDark = new THREE.Mesh(geometry, leaveDarkMaterial);
  leaveDark.position.set(0, 1.2, 0);
  leaveDark.scale.set(1, 2, 1);

  const leaveLight = new THREE.Mesh(geometry, leaveLightMaterial);
  leaveLight.position.set(0, 1.2, 0);
  leaveLight.scale.set(1.1, 0.5, 1.1);
  const treeGroup = new THREE.Group();
  treeGroup.scale.set(0.7, 0.7, 0.7);
  treeGroup.add(leaveDark);
  treeGroup.add(leaveLight);
  treeGroup.add(squareLeave01);
  treeGroup.add(squareLeave02);
  treeGroup.add(squareLeave03);
  treeGroup.add(stem);

  return {
    leaveDark,
    leaveLight,
    squareLeave01,
    squareLeave02,
    squareLeave03,
    treeGroup,
  };
};
