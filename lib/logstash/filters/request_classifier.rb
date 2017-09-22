# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

class LogStash::Filters::RequestClassifier < LogStash::Filters::Base

  # Será el nombre con el que usar el plugin en el pipeline de Logstash
  config_name "request_classifier"
  
  # Definición de los parámetros de entrada del plugin
  # También se podrá usar:
  # :required, :list, :deprecated, :obsolete
  config :url, :validate => :string, :default => "", :required => true

  # Constructor del filtro
  # Hace que las variables se puedan usar en cualquier lugar del filtro
  public
  def register
  end

  # Función dónde estará la lógica de negocio (solo disponible para los plugin de tipo filtro)
  public
  def filter(event)

    url_value = event.get(@url)
    return unless url_value

    event.set("resource_type", urlClassifier(url_value))

    # Si el filtro se ha ejecutado correctamente hay que hacer esta llamada
    filter_matched(event)
  end

  def urlClassifier(url)

    url.downcase!

    if url.to_s.empty?
      return "undefined"
    elsif url.end_with?("/")
      return "directoy"
    elsif url.end_with?(".html") || url.end_with?(".php")
      return "page"
    elsif url.end_with?(".gif") || url.end_with?(".jpg") || url.end_with?(".png") || url.end_with?(".xbm")
      return "image"
    elsif url.include?("imagemap")
      return "imagemap"
    elsif url.end_with?(".mpg") || url.end_with?(".avi")
      return "video"
    elsif url.end_with?(".txt")
      return "file"
    elsif url.end_with?(".pl") || url.include?(".pl?")
      return "perl"
    end

    "unknown"
  end
end
