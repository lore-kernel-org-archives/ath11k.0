Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXWc6-0005Xm-6C
 for ath11k@lists.infradead.org; Wed, 20 Nov 2019 20:30:11 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 0/3] ath11k: improve TX path
Date: Wed, 20 Nov 2019 21:29:53 +0100
Message-Id: <20191120202956.4401-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

This series improves the TX path. The following numbers
are peak performance measured.

prior to series
[SUM]  30.00-31.00  sec   104 MBytes   874 Mbits/sec
series applied
[SUM]  35.00-36.00  sec   124 MBytes  1.04 Gbits/sec
series applied + tx encap
[SUM]  77.00-78.00  sec   167 MBytes  1.40 Gbits/sec

John Crispin (3):
  ath11k: move some tx_status parsing to debugfs code
  ath11k: optimise ath11k_dp_tx_completion_handler
  ath11k: optimize ath11k_hal_tx_status_parse

 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 66 +++++++++-------
 drivers/net/wireless/ath/ath11k/dp.c          | 16 ++--
 drivers/net/wireless/ath/ath11k/dp.h          | 11 ++-
 drivers/net/wireless/ath/ath11k/dp_tx.c       | 79 ++++++++++++-------
 drivers/net/wireless/ath/ath11k/hal_tx.c      | 73 -----------------
 drivers/net/wireless/ath/ath11k/hal_tx.h      | 13 +--
 6 files changed, 101 insertions(+), 157 deletions(-)

-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
