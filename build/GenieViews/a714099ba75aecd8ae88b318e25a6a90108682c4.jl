# app/resources/users/views/auth.jl.html 

function func_a714099ba75aecd8ae88b318e25a6a90108682c4(;
    context = Genie.Renderer.vars(:context),
)

    [
        Genie.Renderer.Html.div(htmlsourceindent = "2") do
            [
                Genie.Renderer.Html.button(htmlsourceindent = "3") do
                    [
                        Genie.Renderer.Html.a(
                            htmlsourceindent = "4",
                            href = "$(Genie.Router.linkto(:sign_up))",
                        ) do
                            [
                                """SignUP""";
                            ]
                        end;
                    ]
                end
                Genie.Renderer.Html.button(htmlsourceindent = "3") do
                    [
                        Genie.Renderer.Html.a(
                            htmlsourceindent = "4",
                            href = "$(Genie.Router.linkto(:log_in))",
                        ) do
                            [
                                """LogIN""";
                            ]
                        end;
                    ]
                end
            ]
        end,
    ]
end
