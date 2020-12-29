defmodule LagerWeb.FooLiveTest do
  use LagerWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Lager.Test

  @create_attrs %{baz: "some baz", name: "some name"}
  @update_attrs %{baz: "some updated baz", name: "some updated name"}
  @invalid_attrs %{baz: nil, name: nil}

  defp fixture(:foo) do
    {:ok, foo} = Test.create_foo(@create_attrs)
    foo
  end

  defp create_foo(_) do
    foo = fixture(:foo)
    %{foo: foo}
  end

  describe "Index" do
    setup [:create_foo]

    test "lists all bar", %{conn: conn, foo: foo} do
      {:ok, _index_live, html} = live(conn, Routes.foo_index_path(conn, :index))

      assert html =~ "Listing Bar"
      assert html =~ foo.baz
    end

    test "saves new foo", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.foo_index_path(conn, :index))

      assert index_live |> element("a", "New Foo") |> render_click() =~
               "New Foo"

      assert_patch(index_live, Routes.foo_index_path(conn, :new))

      assert index_live
             |> form("#foo-form", foo: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#foo-form", foo: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.foo_index_path(conn, :index))

      assert html =~ "Foo created successfully"
      assert html =~ "some baz"
    end

    test "updates foo in listing", %{conn: conn, foo: foo} do
      {:ok, index_live, _html} = live(conn, Routes.foo_index_path(conn, :index))

      assert index_live |> element("#foo-#{foo.id} a", "Edit") |> render_click() =~
               "Edit Foo"

      assert_patch(index_live, Routes.foo_index_path(conn, :edit, foo))

      assert index_live
             |> form("#foo-form", foo: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#foo-form", foo: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.foo_index_path(conn, :index))

      assert html =~ "Foo updated successfully"
      assert html =~ "some updated baz"
    end

    test "deletes foo in listing", %{conn: conn, foo: foo} do
      {:ok, index_live, _html} = live(conn, Routes.foo_index_path(conn, :index))

      assert index_live |> element("#foo-#{foo.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#foo-#{foo.id}")
    end
  end

  describe "Show" do
    setup [:create_foo]

    test "displays foo", %{conn: conn, foo: foo} do
      {:ok, _show_live, html} = live(conn, Routes.foo_show_path(conn, :show, foo))

      assert html =~ "Show Foo"
      assert html =~ foo.baz
    end

    test "updates foo within modal", %{conn: conn, foo: foo} do
      {:ok, show_live, _html} = live(conn, Routes.foo_show_path(conn, :show, foo))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Foo"

      assert_patch(show_live, Routes.foo_show_path(conn, :edit, foo))

      assert show_live
             |> form("#foo-form", foo: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#foo-form", foo: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.foo_show_path(conn, :show, foo))

      assert html =~ "Foo updated successfully"
      assert html =~ "some updated baz"
    end
  end
end
