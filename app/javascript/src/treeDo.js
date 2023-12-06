export const createTreeDo = () => {
  const trunkGeometry = new THREE.CylinderGeometry(0.2, 0.2, 1, 12);
  const trunkMaterial = new THREE.MeshBasicMaterial({ color: 0x8b4513 });
  const trunk = new THREE.Mesh(trunkGeometry, trunkMaterial);

  const leavesGeometry = new THREE.ConeGeometry(0.8, 1.5, 12);
  const leavesMaterial = new THREE.MeshBasicMaterial({ color: 0x1cb41c });
  const leavesMaterialwhite = new THREE.MeshBasicMaterial({ color: 0xffffff });

  const coneLeave01 = new THREE.Mesh(leavesGeometry, leavesMaterial);
  const coneLeave02 = new THREE.Mesh(leavesGeometry, leavesMaterial);
  const coneLeave03 = new THREE.Mesh(leavesGeometry, leavesMaterialwhite);

  const starGeometry = new THREE.TetrahedronGeometry(0.2);
  const starMaterial = new THREE.MeshBasicMaterial({ color: 0xffd700 });
  const christmasStar = new THREE.Mesh(starGeometry, starMaterial);

  const christmasGlobeGeometry = new THREE.SphereGeometry(0.1, 32, 32);
  // color red metallic with a bit of shine
  const christmasGlobeMaterial = new THREE.MeshPhongMaterial({
    color: 0xff0000,
    shininess: 50,
    specular: 0x222222,
  });

  const treeGroup = new THREE.Group();

  trunk.position.y = 0.5;
  coneLeave01.position.y = 1.5;
  coneLeave02.position.y = 2;
  coneLeave03.position.y = 2.3;
  christmasStar.position.y = 2.6;

  for (let i = 0; i < 5; i++) {
    const christmasGlobe = new THREE.Mesh(
      christmasGlobeGeometry,
      christmasGlobeMaterial
    );
    christmasGlobe.position.y = 0.9;
    christmasGlobe.position.x = Math.sin((i / 5) * Math.PI * 2) * 0.7;
    christmasGlobe.position.z = Math.cos((i / 5) * Math.PI * 2) * 0.7;
    treeGroup.add(christmasGlobe);
  }

  coneLeave02.scale.set(0.7, 0.7, 0.7);
  coneLeave03.scale.set(0.5, 0.5, 0.5);

  const pointLight = new THREE.PointLight(0xffffff, 1, 100);
  pointLight.position.set(0, 5, 5); // Adjust the light position

  treeGroup.add(pointLight);

  treeGroup.add(trunk);
  treeGroup.add(coneLeave01);
  treeGroup.add(coneLeave02);
  treeGroup.add(coneLeave03);
  treeGroup.add(christmasStar);

  return {
    trunk,
    coneLeave01,
    coneLeave02,
    treeGroup,
    coneLeave03,
    christmasStar,
  };
};
