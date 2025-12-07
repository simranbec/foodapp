<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Food App Canva Code</title><!-- Tailwind CDN -->
  <script src="https://cdn.tailwindcss.com"></script><!-- Canva SDKs -->
  <script src="/_sdk/element_sdk.js"></script>
  <style>
    body {
      box-sizing: border-box;
    }
    html, body {
      height: 100%;
      width: 100%;
      margin: 0;
      padding: 0;
    }
    .app-wrapper {
      height: 100%;
      width: 100%;
    }
    /* Simple focus outline override to ensure visibility on colored backgrounds */
    :focus-visible {
      outline: 2px solid #f97316;
      outline-offset: 2px;
    }
  </style>
  <style>@view-transition { navigation: auto; }</style>
  <script src="/_sdk/data_sdk.js" type="text/javascript"></script>
 </head>
 <body class="h-full w-full">
  <div id="app-root" class="app-wrapper flex flex-col bg-slate-900 text-slate-100">
   <header class="w-full">
    <div class="max-w-5xl mx-auto px-4 py-4 flex flex-col gap-3">
     <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
      <div>
       <h1 id="app-title" class="text-2xl font-semibold tracking-tight">Tasty Bites</h1>
       <p id="app-subtitle" class="text-sm text-slate-200/80 mt-1">Browse quick, delicious recipes by meal type.</p>
      </div>
      <div class="inline-flex items-center gap-2 rounded-full bg-slate-800/80 px-3 py-1 border border-slate-700"><span class="text-xs uppercase tracking-wide text-slate-200/70">Food App</span> <span class="w-1 h-1 rounded-full bg-amber-400"></span> <span class="text-xs text-slate-200/80">Tap a recipe to view</span>
      </div>
     </div>
     <nav aria-label="Meal filters" class="flex flex-wrap gap-2 mt-1"><button type="button" data-filter="all" class="filter-chip inline-flex items-center gap-1 px-3 py-1.5 rounded-full text-xs font-medium border border-slate-600 bg-slate-800 text-slate-100 shadow-sm"> <span>All</span> <span class="text-[10px] opacity-80" aria-hidden="true">•</span> <span class="filter-count">0</span> </button> <button type="button" data-filter="breakfast" class="filter-chip inline-flex items-center gap-1 px-3 py-1.5 rounded-full text-xs font-medium border border-slate-700 bg-slate-900/40 text-slate-100"> <span>Breakfast</span> <span class="text-[10px] opacity-80" aria-hidden="true">•</span> <span class="filter-count">0</span> </button> <button type="button" data-filter="lunch" class="filter-chip inline-flex items-center gap-1 px-3 py-1.5 rounded-full text-xs font-medium border border-slate-700 bg-slate-900/40 text-slate-100"> <span>Lunch</span> <span class="text-[10px] opacity-80" aria-hidden="true">•</span> <span class="filter-count">0</span> </button> <button type="button" data-filter="dinner" class="filter-chip inline-flex items-center gap-1 px-3 py-1.5 rounded-full text-xs font-medium border border-slate-700 bg-slate-900/40 text-slate-100"> <span>Dinner</span> <span class="text-[10px] opacity-80" aria-hidden="true">•</span> <span class="filter-count">0</span> </button> <button type="button" data-filter="dessert" class="filter-chip inline-flex items-center gap-1 px-3 py-1.5 rounded-full text-xs font-medium border border-slate-700 bg-slate-900/40 text-slate-100"> <span>Dessert</span> <span class="text-[10px] opacity-80" aria-hidden="true">•</span> <span class="filter-count">0</span> </button>
     </nav>
    </div>
   </header>
   <main class="flex-1 w-full">
    <div class="max-w-5xl mx-auto px-4 pb-4 pt-2 flex flex-col lg:flex-row gap-4 h-full"><!-- Recipe list -->
     <section class="lg:w-2/5 w-full flex flex-col min-h-0" aria-label="Recipe list">
      <div class="flex items-center justify-between mb-2">
       <h2 class="text-sm font-semibold tracking-wide text-slate-100 uppercase">Recipes</h2>
       <div class="relative w-40"><label class="sr-only" for="search-input">Search recipes</label> <input id="search-input" type="text" class="w-full rounded-full bg-slate-800/80 border border-slate-700 px-3 py-1.5 text-xs text-slate-100 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-amber-400/70" placeholder="Search by name...">
       </div>
      </div>
      <div id="recipe-list" class="flex-1 min-h-0 overflow-y-auto space-y-2 pr-1"><!-- Recipe cards injected here -->
      </div>
     </section><!-- Divider on small screens -->
     <div class="block lg:hidden h-px w-full bg-slate-700/80"></div><!-- Recipe detail -->
     <section class="lg:w-3/5 w-full flex flex-col min-h-0 rounded-2xl bg-slate-800/80 border border-slate-700/80 shadow-lg" aria-label="Recipe details">
      <div class="flex items-start justify-between px-4 pt-3 pb-2 border-b border-slate-700/60">
       <div>
        <h2 id="detail-title" class="text-lg font-semibold text-slate-100">Choose a recipe</h2>
        <p id="detail-subtitle" class="text-xs text-slate-200/80 mt-1">Tap a card on the left to see ingredients, time and steps.</p>
       </div>
       <div class="inline-flex items-center gap-1 rounded-full bg-slate-900/60 px-2 py-1 border border-slate-700/80"><span class="text-[10px]" id="detail-tag-badge">Meal</span>
       </div>
      </div>
      <div class="flex-1 min-h-0 overflow-y-auto px-4 py-3 space-y-4">
       <div id="detail-meta" class="flex flex-wrap gap-2 text-xs"><!-- Meta chips -->
       </div>
       <div>
        <h3 class="text-xs font-semibold text-slate-100 uppercase tracking-wide mb-1.5">Ingredients</h3>
        <ul id="detail-ingredients" class="list-disc list-inside space-y-1 text-xs text-slate-100">
         <li class="text-slate-200/80">No recipe selected yet.</li>
        </ul>
       </div>
       <div>
        <h3 class="text-xs font-semibold text-slate-100 uppercase tracking-wide mb-1.5">Steps</h3>
        <ol id="detail-steps" class="list-decimal list-inside space-y-1.5 text-xs text-slate-100">
         <li class="text-slate-200/80">Use the filters or search to find something tasty.</li>
         <li class="text-slate-200/80">Click a recipe card to see full details here.</li>
        </ol>
       </div>
      </div>
      <footer class="px-4 py-2 border-t border-slate-700/70 text-[11px] text-slate-200/70 flex items-center justify-between"><span id="footer-text"> Powered by your creativity. </span> <span class="inline-flex items-center gap-1"> <span aria-hidden="true">⏱️</span> <span id="detail-time-text">–</span> </span>
      </footer>
     </section>
    </div>
   </main>
  </div>
  <script>
    // ---- Static Sample Recipe Data (no persistence needed) ----
    const RECIPES = [
      {
        id: "overnight-oats",
        name: "Berry Overnight Oats",
        type: "breakfast",
        emoji: "🥣",
        difficulty: "Easy",
        time: 10,
        activeTimeLabel: "10 min prep · rest overnight",
        tags: ["High fiber", "Make-ahead"],
        servings: 2,
        calories: 280,
        ingredients: [
          "1 cup rolled oats",
          "1 cup milk or dairy-free milk",
          "1/2 cup mixed berries",
          "1 tbsp chia seeds",
          "1 tbsp honey or maple syrup",
          "Pinch of salt"
        ],
        steps: [
          "In a jar or bowl, combine oats, milk, chia seeds, sweetener and salt.",
          "Stir well, then fold in berries.",
          "Cover and chill in the fridge overnight.",
          "Serve cold in the morning, add extra berries on top if you like."
        ]
      },
      {
        id: "avocado-toast",
        name: "Avocado Toast",
        type: "breakfast",
        emoji: "🥑",
        difficulty: "Easy",
        time: 8,
        activeTimeLabel: "8 min",
        tags: ["Quick", "Vegetarian"],
        servings: 1,
        calories: 320,
        ingredients: [
          "2 slices wholegrain bread",
          "1 ripe avocado",
          "Salt & pepper",
          "Chili flakes (optional)",
          "Lemon juice (optional)"
        ],
        steps: [
          "Toast the bread to your liking.",
          "Mash the avocado with salt, pepper and lemon juice if using.",
          "Spread avocado mash over toast.",
          "Top with chili flakes and serve immediately."
        ]
      },
      {
        id: "bowl-lunch",
        name: "Colorful Grain Bowl",
        type: "lunch",
        emoji: "🥗",
        difficulty: "Medium",
        time: 25,
        activeTimeLabel: "25 min",
        tags: ["Meal prep", "Gluten-free"],
        servings: 2,
        calories: 430,
        ingredients: [
          "1 cup cooked quinoa or brown rice",
          "1 cup roasted veggies",
          "1/2 cup chickpeas, drained",
          "1/2 avocado, sliced",
          "Handful baby spinach",
          "2 tbsp tahini or yogurt dressing"
        ],
        steps: [
          "Cook the base grain according to package instructions.",
          "Roast veggies with oil, salt and pepper until tender.",
          "Add grain to a bowl, top with veggies, chickpeas and spinach.",
          "Drizzle with dressing and top with avocado slices."
        ]
      },
      {
        id: "pasta-dinner",
        name: "Creamy Garlic Pasta",
        type: "dinner",
        emoji: "🍝",
        difficulty: "Medium",
        time: 30,
        activeTimeLabel: "30 min",
        tags: ["Comfort", "Family friendly"],
        servings: 3,
        calories: 520,
        ingredients: [
          "250g pasta",
          "2 tbsp butter or olive oil",
          "3 garlic cloves, minced",
          "1 cup cream or milk",
          "1/2 cup grated parmesan",
          "Salt, pepper, parsley"
        ],
        steps: [
          "Cook pasta in salted water until al dente, reserve some pasta water.",
          "In a pan, melt butter and gently cook garlic until fragrant.",
          "Add cream, simmer, then stir in parmesan.",
          "Toss pasta with sauce, using pasta water to loosen if needed.",
          "Season with salt, pepper and chopped parsley."
        ]
      },
      {
        id: "choco-mug-cake",
        name: "Chocolate Mug Cake",
        type: "dessert",
        emoji: "🍫",
        difficulty: "Easy",
        time: 5,
        activeTimeLabel: "5 min",
        tags: ["Single serve", "Microwave"],
        servings: 1,
        calories: 380,
        ingredients: [
          "4 tbsp flour",
          "2 tbsp sugar",
          "2 tbsp cocoa powder",
          "3 tbsp milk",
          "1 tbsp oil",
          "1/4 tsp baking powder",
          "Pinch of salt"
        ],
        steps: [
          "In a mug, mix dry ingredients until well combined.",
          "Stir in milk and oil until smooth.",
          "Microwave for 60–90 seconds until risen and just set.",
          "Let cool slightly and enjoy straight from the mug."
        ]
      }
    ];

    // ---- DOM References ----
    const recipeListEl = document.getElementById("recipe-list");
    const searchInputEl = document.getElementById("search-input");
    const filterButtons = Array.from(document.querySelectorAll(".filter-chip"));
    const detailTitleEl = document.getElementById("detail-title");
    const detailSubtitleEl = document.getElementById("detail-subtitle");
    const detailTagBadgeEl = document.getElementById("detail-tag-badge");
    const detailMetaEl = document.getElementById("detail-meta");
    const detailIngredientsEl = document.getElementById("detail-ingredients");
    const detailStepsEl = document.getElementById("detail-steps");
    const detailTimeTextEl = document.getElementById("detail-time-text");
    const appTitleEl = document.getElementById("app-title");
    const appSubtitleEl = document.getElementById("app-subtitle");
    const footerTextEl = document.getElementById("footer-text");

    // ---- State ----
    let currentFilter = "all";
    let currentSearch = "";
    let selectedId = null;

    function getFilteredRecipes() {
      return RECIPES.filter((r) => {
        const matchesFilter = currentFilter === "all" ? true : r.type === currentFilter;
        const matchesSearch = currentSearch
          ? r.name.toLowerCase().includes(currentSearch.toLowerCase())
          : true;
        return matchesFilter && matchesSearch;
      });
    }

    function updateFilterCounts() {
      const counts = {
        all: RECIPES.length,
        breakfast: RECIPES.filter((r) => r.type === "breakfast").length,
        lunch: RECIPES.filter((r) => r.type === "lunch").length,
        dinner: RECIPES.filter((r) => r.type === "dinner").length,
        dessert: RECIPES.filter((r) => r.type === "dessert").length
      };
      filterButtons.forEach((btn) => {
        const filter = btn.getAttribute("data-filter");
        const countSpan = btn.querySelector(".filter-count");
        if (countSpan && counts[filter] != null) {
          countSpan.textContent = counts[filter];
        }
      });
    }

    function renderRecipeList() {
      const recipes = getFilteredRecipes();
      // Keep focus visible if re-rendered
      const previouslyFocusedId = document.activeElement?.dataset?.recipeId || null;

      // Clear only children
      while (recipeListEl.firstChild) {
        recipeListEl.removeChild(recipeListEl.firstChild);
      }

      if (!recipes.length) {
        const emptyDiv = document.createElement("div");
        emptyDiv.className =
          "rounded-xl border border-dashed border-slate-700/80 bg-slate-900/40 px-3 py-4 text-xs text-slate-200/80";
        emptyDiv.textContent = "No recipes match your search and filters. Try a different keyword.";
        recipeListEl.appendChild(emptyDiv);
        return;
      }

      recipes.forEach((recipe) => {
        const card = document.createElement("button");
        card.type = "button";
        card.dataset.recipeId = recipe.id;
        const isSelected = selectedId === recipe.id;
        card.className =
          "w-full text-left flex items-center justify-between gap-3 rounded-xl px-3 py-2 border transition " +
          (isSelected
            ? "border-amber-400/80 bg-amber-500/10 shadow-md"
            : "border-slate-700 bg-slate-900/40 hover:border-amber-400/60 hover:bg-slate-800/70");

        card.setAttribute("aria-pressed", isSelected ? "true" : "false");

        card.innerHTML = `
          <div class="flex items-center gap-3">
            <div class="w-8 h-8 rounded-xl bg-slate-800 flex items-center justify-center text-lg">
              <span aria-hidden="true">${recipe.emoji}</span>
            </div>
            <div class="flex flex-col">
              <span class="text-xs font-semibold text-slate-100 line-clamp-1">${recipe.name}</span>
              <span class="text-[11px] text-slate-200/80">
                ${capitalize(recipe.type)} · ${recipe.time} min · ${recipe.difficulty}
              </span>
            </div>
          </div>
          <div class="flex flex-col items-end text-[10px] text-slate-100">
            <span class="inline-flex items-center gap-1 px-2 py-0.5 rounded-full bg-slate-800 border border-slate-700">
              <span aria-hidden="true">🍽️</span>
              <span>${recipe.servings} servings</span>
            </span>
            <span class="mt-1 text-slate-200/80">${recipe.calories} kcal</span>
          </div>
        `;

        card.addEventListener("click", () => {
          selectedId = recipe.id;
          renderRecipeList();
          renderDetail(recipe);
        });

        recipeListEl.appendChild(card);

        if (recipe.id === previouslyFocusedId) {
          card.focus();
        }
      });
    }

    function renderDetail(recipe) {
      if (!recipe) {
        detailTitleEl.textContent = "Choose a recipe";
        detailSubtitleEl.textContent =
          window.elementSdk?.config?.empty_state_text ||
          defaultConfig.empty_state_text;
        detailTagBadgeEl.textContent = "Meal";
        detailMetaEl.innerHTML = "";
        detailIngredientsEl.innerHTML =
          '<li class="text-slate-200/80">No recipe selected yet.</li>';
        detailStepsEl.innerHTML =
          '<li class="text-slate-200/80">Use the filters and search to explore dishes.</li>';
        detailTimeTextEl.textContent = "–";
        return;
      }

      detailTitleEl.textContent = `${recipe.emoji} ${recipe.name}`;
      detailSubtitleEl.textContent = `${capitalize(recipe.type)} · ${recipe.difficulty}`;
      detailTagBadgeEl.textContent = capitalize(recipe.type);
      detailTimeTextEl.textContent = `${recipe.time} min total`;

      // Meta chips
      detailMetaEl.innerHTML = "";
      const metaItems = [
        { label: "Time", value: recipe.activeTimeLabel },
        { label: "Servings", value: recipe.servings + " serving" + (recipe.servings > 1 ? "s" : "") },
        { label: "Calories", value: recipe.calories + " kcal" }
      ];
      metaItems.forEach((m) => {
        const chip = document.createElement("div");
        chip.className =
          "inline-flex items-center gap-1 px-2 py-1 rounded-full bg-slate-900/70 border border-slate-700 text-[11px] text-slate-100";
        chip.innerHTML = `<span class="font-semibold">${m.label}:</span><span>${m.value}</span>`;
        detailMetaEl.appendChild(chip);
      });

      // Ingredients
      detailIngredientsEl.innerHTML = "";
      recipe.ingredients.forEach((ing) => {
        const li = document.createElement("li");
        li.className = "text-xs text-slate-100";
        li.textContent = ing;
        detailIngredientsEl.appendChild(li);
      });

      // Steps
      detailStepsEl.innerHTML = "";
      recipe.steps.forEach((step) => {
        const li = document.createElement("li");
        li.className = "text-xs text-slate-100";
        li.textContent = step;
        detailStepsEl.appendChild(li);
      });
    }

    function capitalize(str) {
      return str.charAt(0).toUpperCase() + str.slice(1);
    }

    function handleFilterClick(filter) {
      currentFilter = filter;
      filterButtons.forEach((btn) => {
        const btnFilter = btn.getAttribute("data-filter");
        if (btnFilter === filter) {
          btn.className =
            "filter-chip inline-flex items-center gap-1 px-3 py-1.5 rounded-full text-xs font-medium border border-amber-400 bg-amber-500/10 text-slate-100 shadow-sm";
        } else {
          btn.className =
            "filter-chip inline-flex items-center gap-1 px-3 py-1.5 rounded-full text-xs font-medium border border-slate-700 bg-slate-900/40 text-slate-100";
        }
      });
      renderRecipeList();
      const first = getFilteredRecipes()[0];
      if (first) {
        selectedId = first.id;
        renderDetail(first);
      } else {
        selectedId = null;
        renderDetail(null);
      }
    }

    // Wire up filters
    filterButtons.forEach((btn) => {
      btn.addEventListener("click", () => {
        const filter = btn.getAttribute("data-filter");
        handleFilterClick(filter);
      });
    });

    // Search input
    searchInputEl.addEventListener("input", (e) => {
      currentSearch = e.target.value || "";
      renderRecipeList();
    });

    // Initial render
    updateFilterCounts();
    selectedId = RECIPES[0]?.id || null;
    renderRecipeList();
    renderDetail(RECIPES[0]);

    // ---- Canva Element SDK: Editable Colors, Fonts & Text ----
    const defaultConfig = {
      app_title: "Tasty Bites",
      app_subtitle: "Browse quick, delicious recipes by meal type.",
      empty_state_text: "Tap a recipe card to see ingredients and steps here.",
      footer_text: "Powered by your creativity.",
      background_color: "#020617",      // BACKGROUND
      surface_color: "#020617",         // SECONDARY_SURFACE (panels/cards edges)
      text_color: "#e2e8f0",            // TEXT
      primary_action_color: "#f97316",  // PRIMARY_ACTION accents
      secondary_action_color: "#0f172a",// SECONDARY_ACTION chip backgrounds
      font_family: "system-ui",
      font_size: 14
    };

    function applyConfigToUI(config) {
      const cfg = { ...defaultConfig, ...config };

      // Colors
      const root = document.getElementById("app-root");
      if (root) {
        root.style.backgroundColor = cfg.background_color;
        root.style.color = cfg.text_color;
      }

      // Panels and surfaces
      const surfaceSections = document.querySelectorAll(
        "section[aria-label='Recipe details'], header .inline-flex, .filter-chip, #recipe-list > button, #recipe-list > div"
      );
      surfaceSections.forEach((el) => {
        if (el.tagName.toLowerCase() === "button" && el.classList.contains("filter-chip")) {
          // filter chips: use secondary_action_color for unselected, primary for selected border
          const isSelected = el.getAttribute("aria-pressed") === "true";
          el.style.backgroundColor = isSelected
            ? cfg.surface_color
            : cfg.secondary_action_color;
          el.style.borderColor = isSelected
            ? cfg.primary_action_color
            : "#1f2933"; // slate-700-ish
        }
      });

      // Detail panel border / background
      const detailSection = document.querySelector(
        "section[aria-label='Recipe details']"
      );
      if (detailSection) {
        detailSection.style.backgroundColor = cfg.surface_color;
        detailSection.style.borderColor = "#1f2933";
      }

      // Text
      [appTitleEl, appSubtitleEl, detailTitleEl, detailSubtitleEl].forEach((el) => {
        if (el) el.style.color = cfg.text_color;
      });

      // Tag badge uses primary action as border
      if (detailTagBadgeEl) {
        detailTagBadgeEl.parentElement.style.borderColor = cfg.primary_action_color;
      }

      // Primary accent color on focus rings via inline style for some elements
      searchInputEl.style.boxShadow = "none";

      // Font family + sizes
      const baseFont = cfg.font_family || defaultConfig.font_family;
      const baseSize = Number(cfg.font_size) || defaultConfig.font_size;
      const fontStack = `${baseFont}, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif`;

      document.documentElement.style.fontFamily = fontStack;

      const scale = (multiplier) => `${baseSize * multiplier}px`;

      if (appTitleEl) appTitleEl.style.fontSize = scale(1.6);
      if (appSubtitleEl) appSubtitleEl.style.fontSize = scale(0.9);
      if (detailTitleEl) detailTitleEl.style.fontSize = scale(1.3);
      if (detailSubtitleEl) detailSubtitleEl.style.fontSize = scale(0.85);
      if (footerTextEl) footerTextEl.style.fontSize = scale(0.8);
      if (searchInputEl) searchInputEl.style.fontSize = scale(0.8);

      // Text content from config
      appTitleEl.textContent = cfg.app_title;
      appSubtitleEl.textContent = cfg.app_subtitle;
      footerTextEl.textContent = cfg.footer_text;
      if (!selectedId) {
        detailSubtitleEl.textContent = cfg.empty_state_text;
      }
    }

    (async function initElementSdk() {
      if (!window.elementSdk) {
        // Running outside Canva editor – just apply defaults
        applyConfigToUI(defaultConfig);
        return;
      }

      await window.elementSdk.init({
        defaultConfig,
        onConfigChange: async (config) => {
          applyConfigToUI(config);
        },
        mapToCapabilities: (config) => {
          const cfg = { ...defaultConfig, ...config };

          const backgroundRecolorable = {
            get: () => cfg.background_color,
            set: (value) => {
              window.elementSdk.setConfig({ background_color: value });
            }
          };

          const surfaceRecolorable = {
            get: () => cfg.surface_color,
            set: (value) => {
              window.elementSdk.setConfig({ surface_color: value });
            }
          };

          const textRecolorable = {
            get: () => cfg.text_color,
            set: (value) => {
              window.elementSdk.setConfig({ text_color: value });
            }
          };

          const primaryActionRecolorable = {
            get: () => cfg.primary_action_color,
            set: (value) => {
              window.elementSdk.setConfig({ primary_action_color: value });
            }
          };

          const secondaryActionRecolorable = {
            get: () => cfg.secondary_action_color,
            set: (value) => {
              window.elementSdk.setConfig({ secondary_action_color: value });
            }
          };

          const fontEditable = {
            get: () => cfg.font_family,
            set: (value) => {
              window.elementSdk.setConfig({ font_family: value });
            }
          };

          const fontSizeable = {
            get: () => cfg.font_size,
            set: (value) => {
              window.elementSdk.setConfig({ font_size: value });
            }
          };

          return {
            recolorables: [
              backgroundRecolorable,
              surfaceRecolorable,
              textRecolorable,
              primaryActionRecolorable,
              secondaryActionRecolorable
            ],
            borderables: [],
            fontEditable,
            fontSizeable
          };
        },
        mapToEditPanelValues: (config) => {
          const cfg = { ...defaultConfig, ...config };
          return new Map([
            ["app_title", cfg.app_title],
            ["app_subtitle", cfg.app_subtitle],
            ["empty_state_text", cfg.empty_state_text],
            ["footer_text", cfg.footer_text]
          ]);
        }
      });

      // Apply initial config from Canva
      applyConfigToUI(window.elementSdk.config || defaultConfig);
    })();
  </script>
 <script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'9aa4d756f440800d',t:'MTc2NTExOTA4OC4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script></body>
</html>
