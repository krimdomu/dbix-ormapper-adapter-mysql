%define perl_vendorlib %(eval "`%{__perl} -V:installvendorlib`"; echo $installvendorlib)
%define perl_vendorarch %(eval "`%{__perl} -V:installvendorarch`"; echo $installvendorarch)

%define real_name DBIx-ORMapper-Adapter-MySQL

Summary: DBIx::ORMapper::Adapter::MySQL is the MySQL Adapter for DBIx::ORMapper
Name: perl-DBIx-ORMapper-Adapter-MySQL
Version: 0.0.1
Release: 1
License: Artistic
Group: Utilities/System
Source: http://github.com/krimdomu/dbix-ormapper-adapter-mysql/DBIx-ORMapper-Adapter-MySQL-%{version}.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

BuildRequires: perl >= 5.10.1
BuildRequires: perl(ExtUtils::MakeMaker)
Requires: perl >= 5.10.1
Requires: perl-libwww-perl
Requires: perl-Want
Requires: perl-Exception-Class
Requires: perl-DBI
Requires: perl-DBD-mysql

%description
MySQL Adapter for DBIx::ORMapper

%prep
%setup -n %{real_name}-%{version}

%build
%{__perl} Makefile.PL INSTALLDIRS="vendor" PREFIX="%{buildroot}%{_prefix}"
%{__make} %{?_smp_mflags}

%install
%{__rm} -rf %{buildroot}
%{__make} pure_install

### Clean up buildroot
find %{buildroot} -name .packlist -exec %{__rm} {} \;


%clean
%{__rm} -rf %{buildroot}

%files
%defattr(-,root,root, 0755)
%doc META.yml 
#%doc %{_mandir}/*
%{perl_vendorlib}/*

%changelog

* Fri Nov 23 2012 Jan Gehring <jan.gehring at, gmail.com> 0.0.1-1
- initial build
