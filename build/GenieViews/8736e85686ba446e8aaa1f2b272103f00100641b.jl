# app/layouts/app.jl.html 

function func_8736e85686ba446e8aaa1f2b272103f00100641b(;
    context = Genie.Renderer.vars(:context),
)

    [
        Genie.Renderer.Html.doctype()
        Genie.Renderer.Html.html(htmlsourceindent = "0", lang = "en") do
            [
                Genie.Renderer.Html.head(htmlsourceindent = "1") do
                    [
                        Genie.Renderer.Html.meta(charset = "utf-8", htmlsourceindent = "2")
                        Genie.Renderer.Html.title(htmlsourceindent = "2") do
                            [
                                """Accounts""";
                            ]
                        end
                    ]
                end
                Genie.Renderer.Html.body(htmlsourceindent = "1") do
                    [
                        @yield
                    ]
                end
            ]
        end
    ]
end
