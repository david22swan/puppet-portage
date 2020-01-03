if Facter.value(:operatingsystem) == 'Gentoo'
  ESELECT_CMD = '/usr/bin/eselect --brief --color=no'
  eselect_modules = %x(#{ESELECT_CMD} modules list).split("\n").reject! { |c| c.chomp.empty? }.map { |s| s.split()[0] }
  eselect_modules_blacklist = [
    'help', 'usage', 'version', 'bashcomp', 'env', 'fontconfig', 'modules',
    'news', 'rc',
  ]
  eselect_modules = eselect_modules - eselect_modules_blacklist
  eselect_modules_multitarget = {
    'php' => ['cli', 'apache2', 'fpm', 'cgi'],
  }

  def facter_add(name, output)
    Facter.add(name) do
      confine :operatingsystem => :gentoo
      setcode do
        output
      end
    end
  end

  eselect_modules.each do |eselect_module|
    # Skip unless it supports the 'show' command
    next unless %x{#{ESELECT_CMD} #{eselect_module} help}.split("\n").reject! { |c| c.chomp.empty? }.map { |s| s.split()[0] }.include?('show')
    # Extract data
    if (submodules = eselect_modules_multitarget[eselect_module])
      submodules.each do |target|
        output = %x{#{ESELECT_CMD} #{eselect_module} show #{target}}.strip
        facter_add("eselect_#{eselect_module}_#{target}", output)
      end
    else
      output = %x{#{ESELECT_CMD} #{eselect_module} show}.strip.split(' ')[0]
      if not ['(none)', '(unset)'].include? output
        facter_add("eselect_#{eselect_module}", output)
      end
    end
  end
end
