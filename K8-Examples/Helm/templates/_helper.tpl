{{- define "nginx-chart.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}
