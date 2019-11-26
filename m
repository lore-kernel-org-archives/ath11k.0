Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZYeE-0002jj-DX
 for ath11k@lists.infradead.org; Tue, 26 Nov 2019 11:04:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 00/10] ath11k: second round of post-bringup patches
Date: Tue, 26 Nov 2019 11:04:43 +0000
Message-ID: <0101016ea7628c8b-bbd1270e-424a-4bfe-bbec-24d21f7d13be-000000@us-west-2.amazonses.com>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

Here's second of round of ath11k patches from ath11k-post-bringup
branch[1] which got queued while ath11k was in review.

Major features here are support for new firmare version and
performance improvements.

Please review.

Kalle

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-post-bringup

Anilkumar Kolli (2):
  ath11k: fix wmi service ready ext tlv parsing
  ath11k: update tcl cmd descriptor parameters for STA mode

Ganesh Sesetti (1):
  ath11k: Fix htt stats sounding info and pdev cca stats

John Crispin (1):
  ath11k: optimize RX path latency

Karthikeyan Periyasamy (2):
  ath11k: fix resource leak in ath11k_mac_sta_state
  ath11k: avoid WMM param truncation

Pradeep Kumar Chitrapu (1):
  ath11k: remove unused tx ring counters

Sriram R (1):
  ath11k: Fix skb_panic observed during msdu coalescing

Vasanthakumar Thiagarajan (1):
  ath11k: Fix target crash due to WBM_IDLE_LINK ring desc shortage

Vikas Patel (1):
  ath11k: Fixing TLV length issue in peer pktlog WMI command

 drivers/net/wireless/ath/ath11k/dp.c       |  15 ++-
 drivers/net/wireless/ath/ath11k/dp.h       |   5 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c    |  71 ++++++++------
 drivers/net/wireless/ath/ath11k/dp_tx.c    |   7 --
 drivers/net/wireless/ath/ath11k/hal_desc.h |   5 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c   |  49 +---------
 drivers/net/wireless/ath/ath11k/hal_rx.h   |  28 +-----
 drivers/net/wireless/ath/ath11k/hal_tx.c   |   6 +-
 drivers/net/wireless/ath/ath11k/hal_tx.h   |   4 +-
 drivers/net/wireless/ath/ath11k/mac.c      | 144 +++++++++++++++++------------
 drivers/net/wireless/ath/ath11k/wmi.c      |  16 +++-
 drivers/net/wireless/ath/ath11k/wmi.h      |   5 +-
 12 files changed, 162 insertions(+), 193 deletions(-)

-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
