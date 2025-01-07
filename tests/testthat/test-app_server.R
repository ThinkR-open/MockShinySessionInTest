test_that("app server", {

  old_request <- MockShinySession$active$request

  on.exit({
    MockShinySession$set(
      "active",
      "request",
      old_request,
      overwrite = TRUE
    )
  })

  MockShinySession$set(
    "active",
    "request",
    function(value) {
      return(
        list(
          "HTTP_USER_AGENT" = "hello world"
        )
      )
    },
    overwrite = TRUE
  )

  testServer(app_server, {
    session$elapse(1)

    expect_equal(
      r$HTTP_USER_AGENT,
      "hello world"
    )
  })
})


test_that("app server", {
  # We're making sure that the session object is correctly
  # set back to normal after the test
  session <- MockShinySession$new()
  expect_warning({
    expect_error({
      session$request$HTTP_USER_AGENT <- "test"
    })
  })

})