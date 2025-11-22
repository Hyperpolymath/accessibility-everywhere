{
  description = "Accessibility Everywhere - Making web accessibility a search engine ranking factor";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # Node.js environment
        nodejs = pkgs.nodejs_20;

        # Python environment for scripts
        python = pkgs.python311;

        # Build dependencies
        buildInputs = with pkgs; [
          nodejs
          nodePackages.npm
          nodePackages.typescript
          nodePackages.typescript-language-server
          just
          docker
          docker-compose
          git
          chromium  # For Puppeteer
          arangodb  # Database
        ];

        # Development tools
        devInputs = with pkgs; [
          # Editors
          neovim
          vscode

          # Linters and formatters
          nodePackages.eslint
          nodePackages.prettier

          # Testing
          nodePackages.jest

          # Debugging
          nodejs.passthru.python.pkgs.debugpy
        ];

      in
      {
        # Development shell
        devShells.default = pkgs.mkShell {
          buildInputs = buildInputs ++ devInputs;

          shellHook = ''
            echo "🌐 Accessibility Everywhere Development Environment"
            echo "=================================================="
            echo ""
            echo "Available commands:"
            echo "  just          - Show all build recipes"
            echo "  just dev      - Start development servers"
            echo "  just build    - Build all packages"
            echo "  just test     - Run tests"
            echo "  just validate-rsr - Check RSR compliance"
            echo ""
            echo "Node.js version: $(node --version)"
            echo "npm version: $(npm --version)"
            echo ""

            # Set up environment variables
            export CHROME_BIN="${pkgs.chromium}/bin/chromium"
            export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
            export PUPPETEER_EXECUTABLE_PATH="${pkgs.chromium}/bin/chromium"

            # Create .env if it doesn't exist
            if [ ! -f .env ]; then
              cp .env.example .env
              echo "✓ Created .env from .env.example"
            fi
          '';
        };

        # Production build
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "accessibility-everywhere";
          version = "1.0.0";

          src = ./.;

          buildInputs = buildInputs;

          buildPhase = ''
            export HOME=$TMPDIR
            npm ci
            npm run build --workspaces
          '';

          installPhase = ''
            mkdir -p $out
            cp -r . $out/
          '';

          meta = with pkgs.lib; {
            description = "Making web accessibility a search engine ranking factor";
            homepage = "https://accessibility-everywhere.org";
            license = with licenses; [ mit ];
            platforms = platforms.unix;
          };
        };

        # Docker image
        packages.docker = pkgs.dockerTools.buildLayeredImage {
          name = "accessibility-everywhere";
          tag = "latest";

          contents = [ self.packages.${system}.default ];

          config = {
            Cmd = [ "${nodejs}/bin/node" "tools/monitoring-api/dist/server.js" ];
            ExposedPorts = {
              "3000/tcp" = {};
            };
            Env = [
              "NODE_ENV=production"
              "PORT=3000"
            ];
          };
        };

        # Formatter
        formatter = pkgs.nixpkgs-fmt;

        # Checks
        checks = {
          # Lint check
          lint = pkgs.stdenv.mkDerivation {
            name = "accessibility-everywhere-lint";
            src = ./.;
            buildInputs = buildInputs;
            buildPhase = ''
              npm ci
              npm run lint --workspaces --if-present
            '';
            installPhase = "mkdir -p $out";
          };

          # Test check
          test = pkgs.stdenv.mkDerivation {
            name = "accessibility-everywhere-test";
            src = ./.;
            buildInputs = buildInputs;
            buildPhase = ''
              npm ci
              npm test --workspaces
            '';
            installPhase = "mkdir -p $out";
          };

          # Build check
          build = pkgs.stdenv.mkDerivation {
            name = "accessibility-everywhere-build";
            src = ./.;
            buildInputs = buildInputs;
            buildPhase = ''
              npm ci
              npm run build --workspaces
            '';
            installPhase = "mkdir -p $out";
          };
        };

        # Apps
        apps = {
          # Development server
          dev = {
            type = "app";
            program = "${pkgs.writeShellScript "dev" ''
              ${docker-compose}/bin/docker-compose up
            ''}";
          };

          # API server
          api = {
            type = "app";
            program = "${pkgs.writeShellScript "api" ''
              ${nodejs}/bin/node tools/monitoring-api/dist/server.js
            ''}";
          };

          # CLI tool
          cli = {
            type = "app";
            program = "${pkgs.writeShellScript "cli" ''
              ${nodejs}/bin/node tools/cli/dist/cli.js "$@"
            ''}";
          };
        };
      }
    );
}
