using Images, Color, FixedPointNumbers, ImageView

function iterate(img)
    out = similar(img)
    a   = restrict(img)

    x   = width (a) - 1
    y   = height(a) - 1

    for i in 1:x, j in 1:y
        #=println(x - i + 1, " ", j+y-1)=#
        out[i        , j        ] = a[i        , j        ]
        out[i + x - 0, j        ] = a[x - i + 1, j        ]
        out[i        , j + y - 0] = a[i        , y - j + 1]
        out[i + x - 0, j + y - 0] = a[x - i + 1, y - j + 1]
    end

    return out
end

function main()
    img = imread("input.png")

    #=view(img)=#

    for i in 1:3
        img = iterate(img)
    end

    view(img)


end

