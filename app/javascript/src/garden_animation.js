import * as TreeDo from "./treeDo";
import * as TreeDecide from "./treeDecide";
import * as TreeDelegate from "./treeDelegate";
import * as TreeDepository from "./treeDepository";

document.addEventListener("turbo:load", function () {
  const trees = [];

  const container = document.querySelector(".canvas-container");
  const isShowPage = container.classList.contains("show-page");
  const containerWidth = container.clientWidth;
  const containerHeight = container.clientHeight;
  let treeCountDo = parseInt(container.dataset.treeCountDo, 10) || 0;
  let treeCountDecide = parseInt(container.dataset.treeCountDecide, 10) || 0;
  let treeCountDelegate =
    parseInt(container.dataset.treeCountDelegate, 10) || 0;
  let treeCountDepository =
    parseInt(container.dataset.treeCountDepository, 10) || 0;
  let treeCount =
    treeCountDo + treeCountDecide + treeCountDelegate + treeCountDepository;

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

  const checkForCollisions = (newTreeGroup, existingTrees) => {
    for (const existingTree of existingTrees) {
      const distance = newTreeGroup.position.distanceTo(
        existingTree.treeGroup.position
      );
      if (distance < 1.5) {
        return true;
      }
    }
    return false;
  };

  const createTreeDo = () => {
    const {
      trunk,
      coneLeave01,
      coneLeave02,
      coneLeave03,
      treeGroup,
      christmasStar,
      christmasGlobe,
    } = TreeDo.createTreeDo();

    let collisionDetected = true;
    let attempts = 0;

    while (collisionDetected && attempts < 10) {
      let randomY = Math.random() * (-4 - -1.5) + -1.5;
      let randomX = Math.random() * (9 - -5) + -7;
      if (isShowPage && trees.length === 0) {
        randomY = -1.5;
        randomX = 0;
      }

      treeGroup.position.y = randomY;
      treeGroup.position.x = randomX;
      let scale = 1 / (0.7 + treeCount * 0.1);
      treeGroup.scale.set(scale, scale, scale);

      collisionDetected = checkForCollisions(treeGroup, trees);
      attempts++;
    }

    scene.add(treeGroup);
    trees.push({
      treeGroup,
      trunk,
      coneLeave01,
      coneLeave02,
      coneLeave03,
      christmasStar,
      christmasGlobe,
    });

    return {
      trunk,
      coneLeave01,
      coneLeave02,
      coneLeave03,
      christmasStar,
      christmasGlobe,
    };
  };

  const createTreeDecide = () => {
    const {
      leaveDark,
      leaveLight,
      squareLeave01,
      squareLeave02,
      squareLeave03,
      treeGroup,
    } = TreeDecide.createTreeDecide();

    let collisionDetected = true;
    let attempts = 0;

    while (collisionDetected && attempts < 10) {
      let randomY = Math.random() * (-4 - -1.5) + -1.5;
      let randomX = Math.random() * (9 - -5) + -7;
      if (trees.length === 0) {
        randomY = -1.5;
        randomX = 0;
      }

      treeGroup.position.y = randomY;
      treeGroup.position.x = randomX;
      let scale = 1 / (1 + treeCount * 0.1);
      treeGroup.scale.set(scale, scale, scale);

      collisionDetected = checkForCollisions(treeGroup, trees);
      attempts++;
    }

    scene.add(treeGroup);
    trees.push({
      leaveDark,
      leaveLight,
      squareLeave01,
      squareLeave02,
      squareLeave03,
      treeGroup,
    });

    return {
      leaveDark,
      leaveLight,
      squareLeave01,
      squareLeave02,
      squareLeave03,
    };
  };

  const createTreeDelegate = () => {
    const { trunk, leaves, apples, treeGroup } =
      TreeDelegate.createTreeDelegate();

    let collisionDetected = true;
    let attempts = 0;

    while (collisionDetected && attempts < 10) {
      let randomY = Math.random() * (-4 - -1.5) + -1.5;
      let randomX = Math.random() * (9 - -5) + -7;
      if (trees.length === 0 && isShowPage) {
        randomY = -1.5;
        randomX = 0;
      }

      treeGroup.position.y = randomY;
      treeGroup.position.x = randomX;
      let scale = 1 / (1 + treeCount * 0.1);
      treeGroup.scale.set(scale, scale, scale);

      collisionDetected = checkForCollisions(treeGroup, trees);
      attempts++;
    }

    scene.add(treeGroup);
    trees.push({
      trunk,
      leaves,
      apples,
      treeGroup,
    });

    return {
      trunk,
      leaves,
      apples,
    };
  };

  const createTreeDepository = () => {
    const {
      trunk,
      leaves01,
      leaves02,
      leaves03,
      branch01,
      branch02,
      treeGroup,
    } = TreeDepository.createTreeDepository();

    let collisionDetected = true;
    let attempts = 0;

    while (collisionDetected && attempts < 10) {
      let randomY = Math.random() * (-4 - -1.5) + -1.5;
      let randomX = Math.random() * (9 - -5) + -7;
      if (trees.length === 0 && isShowPage) {
        randomY = -1.5;
        randomX = 0;
      }

      treeGroup.position.y = randomY;
      treeGroup.position.x = randomX;
      let scale = 1 / (1 + treeCount * 0.1);
      treeGroup.scale.set(scale, scale, scale);

      collisionDetected = checkForCollisions(treeGroup, trees);
      attempts++;
    }

    scene.add(treeGroup);
    trees.push({
      trunk,
      leaves01,
      leaves02,
      leaves03,
      branch01,
      branch02,
      treeGroup,
    });

    return {
      trunk,
      leaves01,
      leaves02,
      leaves03,
      branch01,
      branch02,
    };
  };

  for (let i = 0; i < treeCountDelegate; i++) {
    createTreeDelegate();
  }

  for (let i = 0; i < treeCountDo; i++) {
    createTreeDo();
  }
  for (let i = 0; i < treeCountDecide; i++) {
    createTreeDecide();
  }

  for (let i = 0; i < treeCountDepository; i++) {
    createTreeDepository();
  }

  camera.position.z = 6;
  if (treeCount == 1) {
    camera.position.z = 3;
  }

  const animate = function () {
    requestAnimationFrame(animate);

    trees.forEach(({ treeGroup }) => {
      treeGroup.rotation.y += 0.01;
    });

    renderer.render(scene, camera);
  };

  animate();
});
