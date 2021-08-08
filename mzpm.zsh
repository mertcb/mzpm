#!/usr/bin/env zsh

[[ ! -z "${BIN_NAME}" ]] \
    || readonly BIN_NAME="${$(basename "$0")%.*}"
[[ ! -z "${CACHE_DIR}" ]] \
    || readonly CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/${BIN_NAME}"

# main function
function mzpm()
{
    for plug in "$@"; do
        local plug_name="$(basename ${plug})"
        local install_dir="${CACHE_DIR}/${plug_name}"
        if [[ ! -d "${install_dir}" ]]; then
            local plug_author="$(dirname ${plug})"
            mzpm_download_plugin_from_github "${plug_author}" "${plug_name}" "${install_dir}"
        fi
        mzpm_load_zsh_plugin "${plug_name}" "${install_dir}"
    done
}

###
# Download a ZSH plugin from github
# Arguments:    $1: plugin author
#               $2: plugin name
#               $3: directory in which the plugin should be installed
###
function mzpm_download_plugin_from_github()
{
    local plug_author="$1"
    local plug_name="$2"
    local install_dir="$3"
    local plug_link="https://github.com/${plug_author}/${plug_name}"

    # Don't reinstall
    git clone --depth=1 "${plug_link}" "${install_dir}"
}

###
# Source a ZSH plugin
# Arguments:    $1: plugin name
#               $2: the directory the plugin was installed in
###
function mzpm_load_zsh_plugin() {
    local plug_name="$1"
    local install_dir="$2"

    if [[ -f "${install_dir}/${plug_name}.plugin.zsh" ]]; then
        source "${install_dir}/${plug_name}.plugin.zsh"
    elif [[ -f "${install_dir}/${plug_name}.zsh" ]]; then
        source "${install_dir}/${plug_name}.zsh"
    fi
}
