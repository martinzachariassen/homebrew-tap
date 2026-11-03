class DomeneshopMcp < Formula
  desc "MCP server for the Domeneshop API: domains, DNS, forwards and invoices"
  homepage "https://github.com/martinzachariassen/domeneshop-mcp"
  url "https://registry.npmjs.org/domeneshop-mcp/-/domeneshop-mcp-2.0.3.tgz"
  sha256 "993327568ae91e6ea01fef64f97fd3f4b71efd358e2eee23856bd3825991717a"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/domeneshop-mcp --version")
  end
end
