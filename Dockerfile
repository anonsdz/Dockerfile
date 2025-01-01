# Sử dụng Ubuntu mới nhất
FROM ubuntu:latest

# Cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
  curl \
  gnupg \
  lsb-release \
  ca-certificates

# Thêm Node.js PPA và cài đặt Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
  apt-get install -y nodejs

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép mã nguồn vào container
COPY . .

# Cài đặt dependencies
RUN npm install

# Expose port 3000
EXPOSE 3000

# Khởi chạy ứng dụng
CMD ["npm", "start"]
