# app/resources/users/views/login.jl.html 

function func_6ed8d5caed02684b0a365153e7433d7a8078e618(;
    context = Genie.Renderer.vars(:context),
)

    [
        Genie.Renderer.Html.form(
            method = "POST",
            action = "$(Genie.Router.linkto(:authenticator))",
            htmlsourceindent = "2",
        ) do
            [
                Genie.Renderer.Html.input(
                    name = "email",
                    htmlsourceindent = "3",
                    placeholder = "Email",
                    type = "email",
                )
                Genie.Renderer.Html.input(
                    name = "password",
                    htmlsourceindent = "3",
                    placeholder = "Password",
                    type = "password",
                )
                Genie.Renderer.Html.input(
                    htmlsourceindent = "3",
                    value = "Login",
                    type = "submit",
                )
            ]
        end,
    ]
end
