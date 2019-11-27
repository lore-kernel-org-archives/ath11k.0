Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZxzr-0002Ij-Bt
 for ath11k@lists.infradead.org; Wed, 27 Nov 2019 14:08:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 00/10] ath11k: third round of post-bringup patches
Date: Wed, 27 Nov 2019 14:08:44 +0000
Message-ID: <0101016ead315f92-3756bcba-c277-43b3-813a-4cb731dc2241-000000@us-west-2.amazonses.com>
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

Here's third round of ath11k patches from ath11k-post-bringup
branch[1] which got queued while ath11k was in review.

Major features here are support for controlling tx power per station
and fixing tracing.

Please review.

Kalle

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-post-bringup


Anilkumar Kolli (4):
  ath11k: tracing: fix ath11k tracing
  ath11k: qmi clean up ce and HTC service config update
  ath11k: qmi clean up in ath11k_qmi_wlanfw_wlan_cfg_send()
  ath11k: pktlog: fix sending/using the pdev id

Govindaraj Saminathan (1):
  ath11k: unlock mutex during failure in qmi fw ready

Karthikeyan Periyasamy (2):
  ath11k: avoid burst time conversion logic
  ath11k: avoid use_after_free in ath11k_dp_rx_msdu_coalesce API

Maharaja Kennadyrajan (1):
  ath11k: add support for controlling tx power to a station

Sriram R (1):
  ath11k: add necessary peer assoc params in wmi dbg

Venkateswara Naralasetty (1):
  ath11k: update bawindow size in delba process

 drivers/net/wireless/ath/ath11k/ahb.c   |  9 +++----
 drivers/net/wireless/ath/ath11k/ce.h    |  9 +++++--
 drivers/net/wireless/ath/ath11k/core.c  |  1 +
 drivers/net/wireless/ath/ath11k/debug.h |  3 +++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 46 +++++++++++++++++++++------------
 drivers/net/wireless/ath/ath11k/mac.c   | 44 ++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/qmi.c   | 28 ++++++++++----------
 drivers/net/wireless/ath/ath11k/qmi.h   |  4 +--
 drivers/net/wireless/ath/ath11k/trace.h |  3 +++
 drivers/net/wireless/ath/ath11k/wmi.c   | 19 ++++++++++----
 10 files changed, 114 insertions(+), 52 deletions(-)

-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
