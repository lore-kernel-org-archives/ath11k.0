Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 0/9] relay: cleanup and const callbacks, take 2
Date: Mon, 23 Nov 2020 19:59:20 +0200
Message-Id: <cover.1606153547.git.jani.nikula@intel.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, jani.nikula@intel.com, intel-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, ath10k@lists.infradead.org, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

This is v2 of [1], with a number of cleanups added first based on
Christoph's feedback, making the actual constness patch much smaller and
cleaner.

I don't know who actually maintains relay, it's not in MAINTAINERS -
Cc'd Andrew just in case.

I'd think it would be simplest to queue patches 5-9 via whichever tree
the relay patches get merged. They're all one-liners so neglible
conflict potential.

BR,
Jani.


[1] http://lore.kernel.org/r/20201118165320.26829-1-jani.nikula@intel.com


Cc: linux-block@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>
Cc: ath11k@lists.infradead.org
Cc: ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>


Jani Nikula (9):
  relay: remove unused buf_mapped and buf_unmapped callbacks
  relay: require non-NULL callbacks in relay_open()
  relay: make create_buf_file and remove_buf_file callbacks mandatory
  relay: allow the use of const callback structs
  drm/i915: make relay callbacks const
  ath10k: make relay callbacks const
  ath11k: make relay callbacks const
  ath9k: make relay callbacks const
  blktrace: make relay callbacks const

 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |   2 +-
 drivers/net/wireless/ath/ath10k/spectral.c    |   2 +-
 drivers/net/wireless/ath/ath11k/spectral.c    |   2 +-
 .../net/wireless/ath/ath9k/common-spectral.c  |   2 +-
 include/linux/relay.h                         |  29 ++---
 kernel/relay.c                                | 107 +++---------------
 kernel/trace/blktrace.c                       |   2 +-
 7 files changed, 26 insertions(+), 120 deletions(-)

-- 
2.20.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
