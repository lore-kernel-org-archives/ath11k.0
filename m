Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGgsp-0008Jk-J5
 for ath11k@lists.infradead.org; Wed, 17 Apr 2019 09:29:37 +0000
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: [PATCH 0/3] ath11k: Add Mesh mode support
Date: Wed, 17 Apr 2019 02:29:15 -0700
Message-Id: <1555493358-16381-1-git-send-email-rmanohar@codeaurora.org>
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
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>

Hi,

Posting initial patches to bring Mesh support to ath11k. There are known
issues which is also captured in first patch.

Known issues:
 - Depends on firmware fix to allow other BSS frames
 - Failed to complete path negotiation in secured mode
 - Target assert while shutting down interface in secured mode

-Rajkumar

Rajkumar Manoharan (3):
  ath11k: enable mesh mode
  ath11k: allow 4 address transmission for mesh packet
  ath11k: remove addition check for PMF

 drivers/net/wireless/ath/ath11k/dp_tx.c |  3 +++
 drivers/net/wireless/ath/ath11k/mac.c   | 19 ++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.c   | 21 ++++++++++-----------
 drivers/net/wireless/ath/ath11k/wmi.h   | 11 +++++++----
 4 files changed, 38 insertions(+), 16 deletions(-)

-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
