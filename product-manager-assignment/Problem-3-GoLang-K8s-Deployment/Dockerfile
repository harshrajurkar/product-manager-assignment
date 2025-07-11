# Use official Go image
FROM golang:1.21-alpine

# Set work directory
WORKDIR /app

# Copy files
COPY go-app/ .

# Build the Go app
RUN go build -o app

# Expose port
EXPOSE 8080

# Run the app
CMD ["./app"]

