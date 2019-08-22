import os


def get_video_list(path):
    video_path = path

    file_list = os.listdir(video_path)

    video_list = []

    for file in file_list:
        if file.endswith(".mp4"):
            video_list.append(file)

    video = []

    for file in video_list:
        video.append(os.path.join(video_path, file))

    return video


def set_audio_path(video_path):
    audio_path = video_path.replace(".mp4", ".mp3")
    return audio_path


def remove_audio(path):
    audio_set = os.path.join(path, "*.mp3")
    if os.path.isfile(audio_set):
        command = "rm {}".format(audio_set)
        os.system(command)
    else:
        print("There is no audio file, let's generate them!")


def video2audio(path):
    video = get_video_list(path)
    remove_audio(path)

    for mp4 in video:
        input_video = mp4
        output_audio = set_audio_path(input_video)
        command = "ffmpeg -i {} -b:a 128k -vn {} >> /dev/null 2>&1".format(input_video, output_audio)
        print(command)
        os.system(command)

    print("Coding is finished!")


if __name__ == "__main__":
    path_ = "/Users/baboo/tmp/weibo"
    video2audio(path_)



