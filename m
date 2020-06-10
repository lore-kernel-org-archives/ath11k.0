Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jitgT-000559-3c
 for ath11k@lists.infradead.org; Wed, 10 Jun 2020 05:53:58 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 0/2] ath11k: Rename soc_rx_stats to soc_dp_stats and add more
 dp stats
Date: Wed, 10 Jun 2020 11:21:46 +0530
Message-Id: <1591768308-32005-1-git-send-email-srirrama@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>

Currently, the debugfs "soc_rx_stats" in location '/sys/kernel/debug/ath11k/ipq8074/'
is used for getting only dp rx stats. This has been renamed to "soc_dp_stats"
as tx stats and other ring specific info would also be useful for
debug purpose and it would be good to have all these stats under similar
file.

This patchset adds support for tx error stats and ring backpressure
stats. More ring specific stats could be added here in future.

Sriram R (2):
  ath11k: Add dp tx err stats
  ath11k: Add support for ring backpressure stats

 drivers/net/wireless/ath/ath11k/core.h  |  34 ++++++++-
 drivers/net/wireless/ath/ath11k/debug.c | 128 ++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/dp.h    |  42 +++++++++++
 drivers/net/wireless/ath/ath11k/dp_rx.c |  28 ++++++-
 drivers/net/wireless/ath/ath11k/dp_tx.c |   7 +-
 5 files changed, 229 insertions(+), 10 deletions(-)

-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
