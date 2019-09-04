Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5RKx-0006ii-1Q
 for ath11k@lists.infradead.org; Wed, 04 Sep 2019 09:12:24 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 0/4] ath11k: add HE support
Date: Wed,  4 Sep 2019 11:12:07 +0200
Message-Id: <20190904091211.26868-1-john@phrozen.org>
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

This series adds HE support for the ath11k driver. These patches were
previously sent and this is a rebase on ontop of ath11k-post-bringup.

*** BLURB HERE ***

John Crispin (3):
  ath11k: add HE support
  ath11k: add TWT support
  ath11k: add spatial reuse support

Sven Eckelmann (1):
  ath11k: register HE mesh capabilities

 drivers/net/wireless/ath/ath11k/core.h |   2 +
 drivers/net/wireless/ath/ath11k/mac.c  | 336 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/reg.c  |   1 +
 drivers/net/wireless/ath/ath11k/wmi.c  | 132 +++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h  |  93 ++++++-
 5 files changed, 554 insertions(+), 10 deletions(-)

-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
