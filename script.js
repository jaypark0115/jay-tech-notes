// Shared page navigation and section tracking.
const body = document.body;

function repairStaleWebviewDom() {
  document
    .querySelectorAll(".chapter-overview, .chapter-local-nav")
    .forEach((element) => element.remove());

  const pageToc = document.querySelector(".page-toc");
  const pageTocTitle = pageToc?.querySelector("strong");
  const titleText = pageTocTitle?.textContent?.trim().toLowerCase();

  if (pageToc && titleText === "chapters") {
    const sectionLinks = [...document.querySelectorAll(".doc-section[id] h3")]
      .map((heading) => {
        const section = heading.closest(".doc-section[id]");
        return section
          ? `<a href="#${section.id}">${heading.textContent.trim()}</a>`
          : "";
      })
      .join("");

    if (sectionLinks) {
      pageToc.innerHTML = `<strong>On this page</strong>${sectionLinks}`;
    }
  }
}

repairStaleWebviewDom();

const menuButton = document.querySelector(".menu-button");
const navBackdrop = document.querySelector(".nav-backdrop");
const sidebarLinks = document.querySelectorAll(".sidebar a[href^='#']");
const searchInput = document.querySelector("#section-search");
const searchableSections = [...document.querySelectorAll(".searchable-section")].filter(
  (section) => !section.closest("[hidden]"),
);
const searchEmpty = document.querySelector(".search-empty");
const trackedLinks = [
  ...document.querySelectorAll(".section-nav a, .page-toc a"),
];

const chapterBySection = {
  "basic-concept": "what-is-camera-calibration",
  "why-needed": "what-is-camera-calibration",
  "intrinsic-parameters": "what-is-camera-calibration",
  "removing-distortion": "what-is-camera-calibration",
  "camera-types": "what-is-camera-calibration",
  "difference-from-conventional-cameras": "event-camera-calibration-method",
  "why-event-generation-is-required": "event-camera-calibration-method",
  "why-blinking-circle-grid-is-used": "event-camera-calibration-method",
  "calibration-pattern-configuration": "event-camera-calibration-method",
};

function setNavigation(open) {
  body.classList.toggle("nav-open", open);
  menuButton?.setAttribute("aria-expanded", String(open));
}

menuButton?.addEventListener("click", () => {
  setNavigation(!body.classList.contains("nav-open"));
});

navBackdrop?.addEventListener("click", () => setNavigation(false));

sidebarLinks.forEach((link) => {
  link.addEventListener("click", () => setNavigation(false));
});

searchInput?.addEventListener("input", (event) => {
  const query = event.target.value.trim().toLowerCase();
  let visibleCount = 0;

  searchableSections.forEach((section) => {
    const content = `${section.dataset.searchTitle ?? ""} ${section.textContent}`;
    const matches = !query || content.toLowerCase().includes(query);
    section.classList.toggle("search-hidden", !matches);
    if (matches) visibleCount += 1;
  });

  searchEmpty.hidden = visibleCount !== 0;
});

const sectionObserver = new IntersectionObserver(
  (entries) => {
    const visible = entries
      .filter((entry) => entry.isIntersecting)
      .sort((a, b) => a.boundingClientRect.top - b.boundingClientRect.top);

    if (!visible.length) return;

    const activeId = visible[0].target.id;
    const activeChapterId = chapterBySection[activeId] ?? activeId;
    trackedLinks.forEach((link) => {
      link.classList.toggle(
        "current",
        link.hash === `#${activeId}` || link.hash === `#${activeChapterId}`,
      );
    });
  },
  {
    rootMargin: "-12% 0px -72% 0px",
    threshold: 0,
  },
);

document
  .querySelectorAll(".doc-section[id]")
  .forEach((section) => sectionObserver.observe(section));
