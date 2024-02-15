# Use an existing base image
FROM nginx:latest

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy the HTML and CSS files to the container
COPY jupiter-main/. .

# Expose the port the web server runs on
EXPOSE 80

# Command to start the web server
CMD ["nginx", "-g", "daemon off;"]
