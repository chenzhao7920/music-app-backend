module Api
  module V1
    class DiscogsController < ApplicationController
      def search_album
        discogs = DiscogsService.new
        results = discogs.search(search_params)
        render json: results
      end

      def artist_releases
        discogs = DiscogsService.new
        releases = discogs.get_artist_releases(params[:artist_id])
        render json: releases
      end

      def release
        discogs = DiscogsService.new
        release = discogs.get_release(params[:release_id])
        render json: release
      end

      def master
        discogs = DiscogsService.new
        master = discogs.get_master(params[:master_id])
        render json: master
      end

      private

      def search_params
        params.permit(:q, :type, :artist, :genre, :country, :year, :per_page,:page)
      end
    end
  end
end