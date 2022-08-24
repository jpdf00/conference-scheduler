class ScheduleOrganizer
  def initialize(lectures:)
    @lectures = lectures
    @lightning_lectures = lightning_lectures
    @lectures -= @lightning_lectures
    @conference = Conference.create!({name: "Conferência #{Time.now}"})
    @lunch = { title: 'Almoço', duration: 60 }
    @networking = { title: 'Evento de Networking', duration: 60 }
  end

  def organize
    index = 0

    until @lectures.empty? && @lightning_lectures.empty?
      create_track(index)
      index += 1
    end

    @conference.id
  end

  private

  def create_track(index)
    @track = @conference.tracks.new({name: index})
    @next_start = '09:00'.to_time

    @time = 180
    fill_session('lectures')
    fill_session('lightning_lectures') unless @time < 5
    @next_start = @next_start < '12:00'.to_time ? '12:00'.to_time : @next_start
    add_lecture_to_track(@lunch)

    @time = 240
    fill_session('lectures')
    fill_session('lightning_lectures') unless @time < 5
    @next_start = @next_start < '16:00'.to_time ? '16:00'.to_time : @next_start
    add_lecture_to_track(@networking)

    @track.save!
  end

  def lightning_lectures
    @lectures.select { |lecture| lecture[:duration] == 5 }
  end

  def fill_session(instance_variable)
    return if instance_variable_get("@#{instance_variable}").empty?

    limit_time = @time == 180 ? '12:00'.to_time : '17:00'.to_time

    while @time > 0 && !instance_variable_get("@#{instance_variable}").empty?
      lecture = find_lecture(instance_variable)
      return if @next_start + (lecture[:duration] * 60) > limit_time

      add_lecture_to_track(lecture)
      instance_variable_get("@#{instance_variable}").delete(lecture)
    end
  end

  def find_lecture(instance_variable)
    index = instance_variable_get("@#{instance_variable}").index { |lecture| lecture[:duration] == @time} || 0
    lecture = instance_variable_get("@#{instance_variable}")[index]
  end

  def add_lecture_to_track(lecture)
    lecture[:start_at] = @next_start
    @track.lectures.new(lecture)
    @next_start += lecture[:duration] * 60
    @time -= lecture[:duration]
  end
end