namespace 'work_experiences' do

  desc 'Migrate all internships to work experiences'
  task load: :environment do
    Internship.all.each{|internship| WorkExperience.create(internship.attributes.merge(company: internship.laboratory).except("laboratory"))}
  end

end
