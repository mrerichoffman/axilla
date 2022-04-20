load("render.star", "render")
load("http.star", "http")

def main(config):
    title = config.get("title", "Title not set")
    print("Displaying message: " + title)
    title += "      "
    content = config.get("content", "Content not set")
    image = config.get("image", "").replace("::eq::", "=")

    imgSrc = http.get(image).body()

    # Render
    return render.Root(
        child =
            render.Column(
                expanded = True,
                children = [
                    render.Row(
                        children = [
                            # Image
                            render.Image(
                                src = imgSrc,
                                width = 25,
                                height = 25,
                            ),
                            render.Box(
                                height = 25,
                                width = 2,
                            ),
                            # Message Content
                            render.Marquee(
                                width = 35,
                                height = 25,
                                scroll_direction = "vertical",
                                child = render.Column(
                                    main_align = "start",
                                    children = [
                                      render.WrappedText(
                                          content = content,
                                          color = "#f0f0f0",
                                          font = "tom-thumb",
                                      ),
                                    ]
                                ),
                            ),
                        ],
                    ),
                    # Title
                    render.Box(
                        color = "#2E0854",
                        child = render.Marquee(
                            width = 64,
                            #height = 20,
                            child = render.Column(
                                expanded = True,
                                children = [
                                    render.Box(
                                        height = 1,
                                        width = 64,
                                    ),
                                    render.Padding(
                                        pad = (1, 0, 0, 0),
                                        child = render.Text(
                                            content = title,
                                            font = "tom-thumb",
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ),
                ],
            ),
    )

