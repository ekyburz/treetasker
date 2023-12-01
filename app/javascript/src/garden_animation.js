import { Turbo } from "@hotwired/turbo-rails";

document.addEventListener("turbo:load", function () {
  const trees = [];

  setTimeout(function () {
    const container = document.querySelector(".canvas-container");
    const containerWidth = container.clientWidth;
    const containerHeight = container.clientHeight;
    const treeCount = parseInt(container.dataset.treeCount, 10);

    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(
      75,
      containerWidth / containerHeight,
      0.1,
      1000
    );

    const renderer = new THREE.WebGLRenderer({
      canvas: document.getElementById("myCanvas"),
      alpha: true,
    });
    renderer.setSize(containerWidth, containerHeight);
    renderer.setClearColor(0xffffff, 0);

    const createTree = () => {
      const trunkGeometry = new THREE.BoxGeometry(0.2, 1, 0.2);
      const trunkMaterial = new THREE.MeshBasicMaterial({ color: 0x8b4513 });
      const trunk = new THREE.Mesh(trunkGeometry, trunkMaterial);

      const leavesGeometry = new THREE.ConeGeometry(0.8, 1.5, 8);
      const leavesMaterial = new THREE.MeshBasicMaterial({ color: 0x1cb41c });
      const leaves = new THREE.Mesh(leavesGeometry, leavesMaterial);

      const treeGroup = new THREE.Group();

      trunk.position.y = 0.5;
      leaves.position.y = 1.5;

      treeGroup.add(trunk);
      treeGroup.add(leaves);

      const checkForCollisions = () => {
        for (const existingTree of trees) {
          const distance = treeGroup.position.distanceTo(
            existingTree.treeGroup.position
          );
          if (distance < 1.5) {
            return true;
          }
        }
        return false;
      };

      let collisionDetected = true;
      let attempts = 0;

      while (collisionDetected && attempts < 100) {
        let randomY = Math.random() * (-4 - -1.5) + -1.5;
        let randomX = Math.random() * (9 - -5) + -7;

        treeGroup.position.y = randomY;
        treeGroup.position.x = randomX;

        collisionDetected = checkForCollisions();
        attempts++;
      }

      scene.add(treeGroup);
      trees.push({ treeGroup, trunk, leaves });

      return { trunk, leaves };
    };

    for (let i = 0; i < treeCount; i++) {
      createTree();
    }

    camera.position.z = 6;

    const animate = function () {
      requestAnimationFrame(animate);

      trees.forEach(({ trunk, leaves }) => {
        trunk.rotation.y += 0.01;
        leaves.rotation.y += 0.01;
      });

      renderer.render(scene, camera);
    };

    animate();
  }, 100);
});
