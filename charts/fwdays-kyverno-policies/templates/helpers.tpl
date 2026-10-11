{{- define "kyverno-policies.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{/* All namespaces listed under personLabel.persons, as a sorted list */}}
{{- define "kyverno-policies.personNamespaces" -}}
{{- $all := list }}
{{- range .Values.personLabel.persons }}
{{- $all = concat $all .namespaces }}
{{- end }}
{{- $all | uniq | sortAlpha | toJson }}
{{- end }}

