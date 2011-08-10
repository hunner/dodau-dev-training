Puppet::Type.type(:rcsrepo).provide(:git) do
  commands :git => 'git'

  def exists?
    File.directory?(resource[:path] + '/.git')
  end

  def create
    if resource[:source]
      FileUtils.rm_rf resource[:path] if File.exists? resource[:path]
      git("clone", resource[:source], resource[:path])
      self.revision = resource[:revision] if resource[:revision]
    else
      FileUtils.mkdir_p resource[:path] if ! File.directory? resource[:path]
      git_path "init"
    end
  end

  def destroy
    FileUtils.rm_rf(resource[:path])
  end

  def revision
    git_path("rev-parse", "HEAD").chomp
  end

  def revision=(value)
    git_path("fetch", "origin")
    git_path("checkout", value)
  end

  def git_path(*args)
    git("--git-dir", resource[:path] + '/.git', "--work-tree", resource[:path], *args)
  end
end
