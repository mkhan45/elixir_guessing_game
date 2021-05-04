defmodule Guessing do
    def run(:start) do
        n = Enum.random(0..101)
        run(n)
    end

    def run({:guess, n, inp}) when inp < n do
        IO.puts "Too low!\n"
        run(n)
    end

    def run({:guess, n, inp}) when inp > n do
        IO.puts "Too high\n"
        run(n)
    end

    def run({:guess, n, inp}) when inp == n do
        IO.puts "#{n} is Correct!"
    end

    def run(n) do
        inp_str = IO.gets "Guess a number:\n"
        inp = inp_str |> String.trim |> Integer.parse

        case inp do
            {inp, _} -> run({:guess, n, inp})
            :error ->
                IO.puts "Invalid number, try again"
                run(n)
        end
    end
end

Guessing.run(:start)
