Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMZc-0001U7-JB
 for ath11k@lists.infradead.org; Thu, 10 Dec 2020 14:05:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 0/6] ath11k: QCA6390 stability fixes
Date: Thu, 10 Dec 2020 16:05:18 +0200
Message-Id: <1607609124-17250-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

Few fixes to improve statibility on QCA6390. Please review.

Kalle

Carl Huang (4):
  ath11k: put hw to DBS using WMI_PDEV_SET_HW_MODE_CMDID
  ath11k: pci: fix hot reset stability issues
  ath11k: pci: fix L1ss clock unstable problem
  ath11k: pci: disable VDD4BLOW

Kalle Valo (1):
  ath11k: mhi: print a warning if firmware crashed

Pradeep Kumar Chitrapu (1):
  ath11k: Fix incorrect tlvs in scan start command

 drivers/net/wireless/ath/ath11k/core.c |  12 ++-
 drivers/net/wireless/ath/ath11k/hw.h   |   6 --
 drivers/net/wireless/ath/ath11k/mhi.c  |   9 +++
 drivers/net/wireless/ath/ath11k/pci.c  | 132 +++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/pci.h  |  24 ++++++
 drivers/net/wireless/ath/ath11k/wmi.c  |  69 +++++++++--------
 drivers/net/wireless/ath/ath11k/wmi.h  |   3 +
 7 files changed, 206 insertions(+), 49 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
