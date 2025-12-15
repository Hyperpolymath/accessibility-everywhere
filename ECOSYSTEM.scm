;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — accessibility-everywhere

(ecosystem
  (version "1.0.0")
  (name "accessibility-everywhere")
  (type "project")
  (purpose "> Making web accessibility a search engine ranking factor")

  (position-in-ecosystem
    "Part of hyperpolymath ecosystem. Follows RSR guidelines.")

  (related-projects
    (project (name "rhodium-standard-repositories")
             (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
             (relationship "standard")))

  (what-this-is "> Making web accessibility a search engine ranking factor")
  (what-this-is-not "- NOT exempt from RSR compliance"))
