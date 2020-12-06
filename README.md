# Patrick Read's Advent of Code

To run an individual day's script:

1. Rebuild the Docker image: `docker build -t advent_of_code .`
2. Run the Ruby file using Docker run, setting the FILE environment variable to whatever script to run: `docker run --env FILE=1/main_a.rb -it advent_of_code`
