module Api
  class SkillsController < Api::BaseController

    private

      def album_params
        params.require(:album).permit(:title)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:title, :description)
      end

  end
end

