;; STATE.scm - STATEFUL CONTEXT TRACKING ENGINE
;; Project: accessibility-everywhere
;; Purpose: Persist conversation state between AI sessions
;;
;; CRITICAL: Download this file at end of each session!
;; At start of next conversation, upload it to resume context.

(define state
  '((metadata
     (format-version "1.0")
     (schema-date "2024-01-22")
     (last-updated "2025-12-08")
     (generator "claude-opus-4")
     (project-repo "hyperpolymath/accessibility-everywhere"))

    ;; ═══════════════════════════════════════════════════════════════
    ;; USER CONTEXT
    ;; ═══════════════════════════════════════════════════════════════
    (user
     (name "hyperpolymath")
     (roles ("founder" "maintainer" "developer"))
     (preferences
      (languages ("TypeScript" "JavaScript" "React"))
      (tools ("GitHub" "Docker" "npm" "CloudFlare"))
      (infrastructure ("ArangoDB" "Puppeteer" "axe-core")))
     (values
      ("accessibility-first"
       "FOSS"
       "WCAG-compliance"
       "economic-incentives-for-good")))

    ;; ═══════════════════════════════════════════════════════════════
    ;; CURRENT POSITION
    ;; ═══════════════════════════════════════════════════════════════
    (position
     (phase "Phase 1: Foundation")
     (phase-status "90% complete - tools built, awaiting deployment")
     (summary
      "Core tooling is production-ready. Browser extension, testing dashboard,
       monitoring API, GitHub Action, CLI tool, npm packages, React components,
       and WordPress plugin are all built. Documentation is comprehensive.
       Project is pre-launch - no public deployment or users yet.")

     (what-exists
      ((browser-extension
        (status "built")
        (location "tools/browser-extension/")
        (features ("Chrome/Firefox" "WCAG A/AA/AAA" "real-time scanning")))
       (testing-dashboard
        (status "built")
        (location "tools/testing-dashboard/")
        (features ("instant scanning" "shareable results" "leaderboard")))
       (monitoring-api
        (status "built")
        (location "tools/monitoring-api/")
        (features ("REST API" "violation reporting" "badge system")))
       (github-action
        (status "built")
        (location "tools/github-action/")
        (features ("CI/CD integration" "PR blocking" "WCAG levels")))
       (cli-tool
        (status "built")
        (location "tools/cli/")
        (features ("batch scanning" "multiple formats" "CI mode")))
       (npm-packages
        (status "built")
        (locations ("packages/core/" "packages/scanner/"))
        (features ("programmatic scanning" "TypeScript support")))
       (react-components
        (status "built")
        (location "components/react/")
        (features ("accessible Button" "accessible Modal")))
       (wordpress-plugin
        (status "built")
        (location "tools/wordpress-plugin/")
        (features ("Gutenberg integration" "content scanning")))))

     (what-is-missing
      ("Production deployment"
       "Browser extension store listings"
       "npm package publications"
       "Real users"
       "Partnerships (W3C, WebAIM)"
       "Public leaderboard data"
       "Revenue")))

    ;; ═══════════════════════════════════════════════════════════════
    ;; ROUTE TO MVP v1
    ;; ═══════════════════════════════════════════════════════════════
    (mvp-roadmap
     (target "Quick Launch in 2-4 weeks")
     (estimated-cost "$50/month ongoing + $5 one-time Chrome store")

     (steps
      ((step 1
        (task "Deploy testing dashboard")
        (platform "CloudFlare Pages")
        (effort "1 hour")
        (cost "free")
        (status "pending"))

       (step 2
        (task "Deploy monitoring API")
        (platform "Railway or Render")
        (effort "2 hours")
        (cost "$25-50/month")
        (status "pending"))

       (step 3
        (task "Setup ArangoDB")
        (platform "Railway")
        (effort "1 hour")
        (cost "included in API hosting")
        (status "pending"))

       (step 4
        (task "Submit browser extension to Chrome Web Store")
        (platform "Chrome Web Store")
        (effort "4 hours")
        (cost "$5 one-time")
        (status "pending")
        (notes "1-3 day review period"))

       (step 5
        (task "Submit browser extension to Firefox Add-ons")
        (platform "addons.mozilla.org")
        (effort "2 hours")
        (cost "free")
        (status "pending")
        (notes "1-7 day review period"))

       (step 6
        (task "Publish npm packages")
        (packages ("@accessibility-everywhere/core"
                   "@accessibility-everywhere/scanner"
                   "@accessibility-everywhere/cli"))
        (effort "1 hour")
        (cost "free")
        (status "pending"))

       (step 7
        (task "Publish GitHub Action to Marketplace")
        (effort "1 hour")
        (cost "free")
        (status "pending"))

       (step 8
        (task "Write launch announcement")
        (platforms ("GitHub" "Twitter" "Hacker News" "Reddit"))
        (effort "2 hours")
        (status "pending"))

       (step 9
        (task "Soft launch")
        (goal "first 1000 users")
        (effort "ongoing")
        (status "pending"))))

     (mvp-definition
      "Users can:
       - Install browser extension from official stores
       - Scan any URL via public dashboard
       - Use CLI tool via npm
       - Integrate GitHub Action in CI/CD
       - Access free tier API (1000 req/month)
       - View public leaderboard"))

    ;; ═══════════════════════════════════════════════════════════════
    ;; KNOWN ISSUES & BLOCKERS
    ;; ═══════════════════════════════════════════════════════════════
    (issues
     (technical
      ((id "ISSUE-001"
        (title "No production infrastructure")
        (severity "blocker")
        (description "All tools exist but nothing is deployed to production")
        (resolution "Deploy to CloudFlare Pages + Railway"))

       (id "ISSUE-002"
        (title "ArangoDB not provisioned")
        (severity "blocker")
        (description "Database required for API, leaderboard, and historical data")
        (resolution "Provision on Railway or use ArangoDB Cloud"))

       (id "ISSUE-003"
        (title "npm packages unpublished")
        (severity "high")
        (description "Core packages not on npm registry")
        (resolution "npm login && npm publish --access public"))

       (id "ISSUE-004"
        (title "Extension not in stores")
        (severity "high")
        (description "Browser extension requires manual installation")
        (resolution "Submit to Chrome Web Store and Firefox Add-ons"))))

     (business
      ((id "BIZ-001"
        (title "No users yet")
        (severity "expected")
        (description "Pre-launch, zero adoption metrics")
        (resolution "Launch and begin marketing"))

       (id "BIZ-002"
        (title "No partnerships")
        (severity "medium")
        (description "W3C, WebAIM, ISOC partnerships not established")
        (resolution "Post-launch outreach with adoption metrics"))

       (id "BIZ-003"
        (title "No revenue")
        (severity "low")
        (description "Freemium model not active")
        (resolution "Focus on free tier adoption first"))))

     (unknowns
      ("Browser extension store review time/outcome"
       "Initial user reception"
       "Competitive response from existing tools"
       "Search engine receptiveness to ranking factor proposal")))

    ;; ═══════════════════════════════════════════════════════════════
    ;; QUESTIONS FOR USER
    ;; ═══════════════════════════════════════════════════════════════
    (questions-pending
     ((q1
       (topic "Launch Strategy")
       (question "Which launch option do you prefer?")
       (options
        (("Quick Launch" "2-4 weeks" "$50/month" "full features on free tier")
         ("Full Launch" "3 months" "£2k-5k total" "professional branding + PR")
         ("Minimal Launch" "1 week" "£0" "static only, no backend")))
       (recommendation "Quick Launch - validates demand with minimal risk"))

      (q2
       (topic "Budget")
       (question "What is your monthly budget for infrastructure?")
       (context "$50/month covers free tier hosting; scales with usage"))

      (q3
       (topic "Timeline")
       (question "What is your target launch date?")
       (context "Quick Launch ready in 2-4 weeks from decision"))

      (q4
       (topic "Priorities")
       (question "Which tools should launch first?")
       (options ("All at once" "Dashboard + API first" "Extension first"))
       (recommendation "All at once for maximum impact"))

      (q5
       (topic "Branding")
       (question "Is professional branding needed before launch?")
       (context "Can launch with current assets, rebrand later"))

      (q6
       (topic "Domain")
       (question "Do you own accessibility-everywhere.org?")
       (context "Need domain for production deployment"))))

    ;; ═══════════════════════════════════════════════════════════════
    ;; LONG-TERM ROADMAP
    ;; ═══════════════════════════════════════════════════════════════
    (roadmap
     (vision
      "Make web accessibility a search engine ranking factor within 2-3 years,
       driving adoption from 4% to 50%+ (mirroring HTTPS success story)")

     (phases
      ((phase-1
        (name "Foundation")
        (timeline "Months 1-3")
        (status "90% complete")
        (goals
         ("Build core tools" ;; DONE
          "Create documentation" ;; DONE
          "Public launch"
          "First 10K users"))
        (deliverables
         ("Browser extension" ;; DONE
          "Testing dashboard" ;; DONE
          "Monitoring API" ;; DONE
          "GitHub Action" ;; DONE
          "CLI tool" ;; DONE
          "npm packages"))) ;; DONE

       (phase-2
        (name "Adoption")
        (timeline "Months 4-9")
        (status "not started")
        (goals
         ("50K+ active users"
          "10+ partnerships"
          "Framework integrations"
          "100+ paying customers"))
        (deliverables
         ("W3C/ISOC partnerships"
          "Conference presentations"
          "WordPress plugin launch"
          "React component library"
          "VS Code extension"
          "Developer tutorials")))

       (phase-3
        (name "Public Pressure")
        (timeline "Months 10-18")
        (status "not started")
        (goals
         ("Major media coverage"
          "500+ badges displayed"
          "10% score improvement industry-wide"
          "Break-even on costs"))
        (deliverables
         ("Public leaderboard (top 10K sites)"
          "Hall of Fame / Hall of Shame"
          "Industry benchmarking reports"
          "Media campaigns"
          "Accessibility awards")))

       (phase-4
        (name "Search Engine Integration")
        (timeline "Months 18-36")
        (status "not started")
        (goals
         ("Search engine meetings"
          "Pilot programs"
          "PUBLIC COMMITMENT TO RANKING FACTOR"))
        (deliverables
         ("Formal proposals to Google/Bing/DuckDuckGo"
          "Technical integration documentation"
          "Adoption data presentations"
          "Beta accessibility signals"
          "Public announcement")))))

     (success-metrics
      ((metric "Users"
        (month-3 "10K")
        (month-12 "200K")
        (month-24 "1.5M"))
       (metric "Extension installs"
        (month-3 "10K")
        (month-12 "100K")
        (month-24 "500K"))
       (metric "API customers (paid)"
        (month-6 "50")
        (month-12 "210")
        (month-24 "1100"))
       (metric "Monthly revenue"
        (month-6 "$2.5K")
        (month-12 "$15K")
        (month-24 "$100K"))
       (metric "Partnerships"
        (month-6 "5")
        (month-12 "50")
        (month-24 "100"))
       (metric "Search engine commitment"
        (target "Month 30-36")))))

    ;; ═══════════════════════════════════════════════════════════════
    ;; CRITICAL NEXT ACTIONS (Top 5)
    ;; ═══════════════════════════════════════════════════════════════
    (critical-next
     ((priority 1
       (action "Decide on launch strategy")
       (owner "user")
       (deadline "immediate")
       (notes "Quick Launch recommended"))

      (priority 2
       (action "Deploy dashboard to CloudFlare Pages")
       (owner "developer")
       (effort "1 hour")
       (depends-on "launch decision"))

      (priority 3
       (action "Provision ArangoDB + Deploy API")
       (owner "developer")
       (effort "3 hours")
       (depends-on "launch decision"))

      (priority 4
       (action "Submit browser extension to Chrome Web Store")
       (owner "developer")
       (effort "4 hours")
       (cost "$5")
       (depends-on "API deployment"))

      (priority 5
       (action "Publish npm packages")
       (owner "developer")
       (effort "1 hour")
       (depends-on "none"))))

    ;; ═══════════════════════════════════════════════════════════════
    ;; HISTORY / VELOCITY TRACKING
    ;; ═══════════════════════════════════════════════════════════════
    (history
     (snapshots
      ((date "2024-01-22"
        (milestone "Initial project scaffolding")
        (completion 10))
       (date "2024-12-01"
        (milestone "Core tools complete")
        (completion 80))
       (date "2025-12-08"
        (milestone "Full tooling + docs complete, pre-launch")
        (completion 90))))

     (velocity
      (notes "Rapid development phase complete. Now entering deployment phase.")))

    ;; ═══════════════════════════════════════════════════════════════
    ;; PROJECT CATALOG
    ;; ═══════════════════════════════════════════════════════════════
    (projects
     ((project "browser-extension"
       (status "complete")
       (completion 100)
       (category "user-tools")
       (next-action "Submit to stores"))

      (project "testing-dashboard"
       (status "complete")
       (completion 100)
       (category "user-tools")
       (next-action "Deploy to CloudFlare"))

      (project "monitoring-api"
       (status "complete")
       (completion 100)
       (category "infrastructure")
       (next-action "Deploy to Railway"))

      (project "github-action"
       (status "complete")
       (completion 100)
       (category "developer-tools")
       (next-action "Publish to Marketplace"))

      (project "cli-tool"
       (status "complete")
       (completion 100)
       (category "developer-tools")
       (next-action "Publish to npm"))

      (project "npm-packages"
       (status "complete")
       (completion 100)
       (category "developer-tools")
       (next-action "Publish to npm"))

      (project "react-components"
       (status "complete")
       (completion 100)
       (category "developer-tools")
       (next-action "Publish to npm"))

      (project "wordpress-plugin"
       (status "complete")
       (completion 100)
       (category "integrations")
       (next-action "Submit to WordPress plugin directory"))

      (project "documentation"
       (status "complete")
       (completion 100)
       (category "support")
       (files ("README.md"
               "CLAUDE.md"
               "CONTRIBUTING.md"
               "docs/ACCESSIBILITY_INITIATIVE.md"
               "docs/PROPOSED_STANDARDS.md"
               "docs/CAMPAIGN_MATERIALS.md"
               "docs/NEXT_STEPS.md")))

      (project "production-deployment"
       (status "blocked")
       (completion 0)
       (category "infrastructure")
       (blocker "Awaiting launch decision")
       (next-action "User decides on launch strategy"))

      (project "partnership-outreach"
       (status "paused")
       (completion 0)
       (category "business")
       (blocker "Need launched product first")
       (next-action "Post-launch: contact W3C, WebAIM"))

      (project "search-engine-proposal"
       (status "paused")
       (completion 0)
       (category "business")
       (blocker "Need adoption metrics")
       (next-action "Target: Month 18"))))

    ;; ═══════════════════════════════════════════════════════════════
    ;; SESSION NOTES
    ;; ═══════════════════════════════════════════════════════════════
    (session
     (id "create-state-scm-01PvD3EKfm6bECAnoUUWS73g")
     (date "2025-12-08")
     (summary "Created STATE.scm checkpoint file documenting project status")
     (files-modified ("STATE.scm"))
     (decisions-pending
      ("Launch strategy selection"
       "Budget confirmation"
       "Timeline finalization")))))

;; ═══════════════════════════════════════════════════════════════════
;; UTILITY FUNCTIONS (for AI parsing)
;; ═══════════════════════════════════════════════════════════════════

(define (get-current-focus)
  "Returns the current project focus and phase"
  (assoc 'position state))

(define (get-blocked-projects)
  "Returns all projects with status 'blocked'"
  (filter (lambda (p) (eq? (cadr (assoc 'status (cdr p))) 'blocked))
          (cdr (assoc 'projects state))))

(define (get-critical-actions)
  "Returns top 5 priority actions"
  (cdr (assoc 'critical-next state)))

(define (get-pending-questions)
  "Returns questions awaiting user input"
  (cdr (assoc 'questions-pending state)))

(define (get-mvp-steps)
  "Returns MVP roadmap steps"
  (cdr (assoc 'steps (cdr (assoc 'mvp-roadmap state)))))

;; End of STATE.scm
