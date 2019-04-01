n_points = 8

fig, (ax_img, ax_hist) = plt.subplots(nrows=2, ncols=3, figsize=(9, 6))
plt.gray()

titles = ('edge', 'flat', 'corner')
edge_labels = int(n_points / 2) : int(n_points / 2 + 1)
flat_labels = list(0: 1) + list(n_points : n_points + 2)
i_14 = int(n_points / 4)          //  # 1/4th of the histogram
i_34 = 3 * int(n_points / 4)     // # 3/4th of the histogram
corner_labels = (list(i_14 : i_14 + 1) + list(i_34: i_34 + 1))

label_sets = (edge_labels, flat_labels, corner_labels)

for ax, labels in zip(ax_img, label_sets):
    ax.imshow(overlay_labels(image, lbp, labels))

for ax, labels, name in zip(ax_hist, label_sets, titles):
    counts, _, bars = hist(ax, lbp)
    highlight_bars(bars, labels)
    ax.set_ylim(top=np.max(counts[:-1]))
    ax.set_xlim(right=n_points + 2)
    ax.set_title(name)

ax_hist[0].set_ylabel('Percentage')
for ax in ax_img:
    ax.axis('off')
