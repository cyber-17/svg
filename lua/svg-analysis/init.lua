local function extract_https_links()
  -- 获取当前 buffer 的内容
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local https_links = {}

  -- 正则表达式匹配以 https 开头的 URL
  local https_pattern = 'https://[%w%._%?%&%=%-]+'

  for _, line in ipairs(lines) do
    for https_url in line:gmatch(https_pattern) do
      table.insert(https_links, https_url)
    end
  end

  -- 输出结果
  if #https_links > 0 then
    print('Extracted HTTPS Links:')
    for _, url in ipairs(https_links) do
      print(url)
    end
  else
    print('No HTTPS links found.')
  end
end

-- 将函数映射到某个命令
vim.api.nvim_create_user_command('ExtractHttpsLinks', extract_https_links, {})
