Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3fSX-0005hs-Jo
 for ath11k@lists.infradead.org; Mon, 17 Feb 2020 12:25:13 +0000
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Subject: [RFC 0/2] add 802.11 decapsulation offload support
Date: Mon, 17 Feb 2020 17:54:35 +0530
Message-Id: <1581942277-585-1-git-send-email-mpubbise@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>, linux-wireless@vger.kernel.org

Adding support for offloading 802.11 decapsulation to the HW.
This reduces the CPU cycles spent on host CPU for doing the 
conversion from 802.11 format to ethernet format and thereby
improving the performance of the device.

Note:
Ath11k patch in this patchset depends on PN offload series
and the multi reo patchset with the following name.
"Support hash based reo destination ring selection"

Manikanta Pubbisetty (2):
  mac80211: add receive path for ethernet frame format
  ath11k: add rx hw 802.11 decapsulation offloading support

 drivers/net/wireless/ath/ath11k/core.c     |   4 +
 drivers/net/wireless/ath/ath11k/core.h     |   3 +
 drivers/net/wireless/ath/ath11k/dp_rx.c    | 184 ++++++++++++++----------
 drivers/net/wireless/ath/ath11k/hal_desc.h |   2 +
 drivers/net/wireless/ath/ath11k/mac.c      |  21 +++
 include/net/mac80211.h                     |  20 +++
 net/mac80211/rx.c                          | 215 ++++++++++++++++++++++++++++-
 7 files changed, 370 insertions(+), 79 deletions(-)

-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
