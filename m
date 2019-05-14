Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQPFx-0001AH-8f
 for ath11k@lists.infradead.org; Tue, 14 May 2019 04:41:38 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 0/3] ATH11K DFS Support
Date: Tue, 14 May 2019 10:11:16 +0530
Message-Id: <1557808879-26933-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

This patchset enables dfs support in ath11k driver.
Firmware provides support for offloading certain modules
required for dfs implementation such as radar detection
and NOL implementation.

Sriram R (3):
  ath11k: Process radar detected event
  ath11k: Initialize and enable dfs radar detection
  ath11k: Add dfs debug and test interface

 drivers/net/wireless/ath/ath11k/core.h  |   1 +
 drivers/net/wireless/ath/ath11k/debug.c |  28 ++++++
 drivers/net/wireless/ath/ath11k/dp_rx.c |  20 +++-
 drivers/net/wireless/ath/ath11k/mac.c   |  54 +++++++++--
 drivers/net/wireless/ath/ath11k/wmi.c   | 164 +++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h   |  42 ++++++++
 6 files changed, 295 insertions(+), 14 deletions(-)

-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
