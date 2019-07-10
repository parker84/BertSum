from sklearn.model_selection import train_test_split
import os
SEED = 123


class SplitRawFiles():

    def __init__(self, raw_data_dir, save_dir):
        self.raw_data_dir = raw_data_dir
        self.save_dir = save_dir
        self.datasets = {}

    def get_and_split_filenames(self):
        fnames = os.listdir(self.raw_data_dir)
        train, test = train_test_split(fnames, test_size=.4, random_state=SEED)
        val, test = train_test_split(test, test_size=.5, random_state=SEED)
        self.datasets["train"] = train
        self.datasets["valid"] = val
        self.datasets["test"] = test

    def save_fnames_to_corresponding_files(self):
        for dataset in self.datasets:
            with open(
                os.path.join(
                    self.save_dir, "mapping_" + dataset + ".txt"
                ), "w") as f:
                for fname in self.datasets[dataset]:
                    f.write(fname)
