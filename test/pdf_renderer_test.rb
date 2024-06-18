require "test_helper"

class PdfRendererTest < ActionDispatch::IntegrationTest
  test "it has a version number" do
    assert PdfRenderer::VERSION
  end

  test "pdf request sends a pdf as file" do
    get home_path(format: :pdf)
    assert_match "PDF", response.body
    assert_equal "binary", headers["Content-Transfer-Encoding"]
    assert_equal "attachment; filename=\"contents.pdf\"; filename*=UTF-8''contents.pdf",
    headers["Content-Disposition"]
    assert_equal "application/pdf", headers["Content-Type"]
  end
end
