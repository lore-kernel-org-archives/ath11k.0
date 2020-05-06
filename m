Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWGbD-0006G4-4n
 for ath11k@lists.infradead.org; Wed, 06 May 2020 09:44:22 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 0/3] Add infra support for discrete chipset in ath11k
Date: Wed,  6 May 2020 15:13:57 +0530
Message-Id: <20200506094400.4740-1-govinds@codeaurora.org>
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
To: ath11k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

QCA6390 is PCI based 11ax chipset to be supported in ath11k.
Current design supports only AHB interface for 11ax chipset.
Refactor the code by adding hif layer for bus level abstraction to support PCI based device.

Tested HW: IPQ8074A

Govind Singh (3):
  ath11k: Add support for multibus support
  ath11k: Add drv private for bus opaque struct
  ath11k: Remove bus layer includes from upper layer

 drivers/net/wireless/ath/ath11k/ahb.c      | 47 +++++++++---
 drivers/net/wireless/ath/ath11k/ahb.h      | 22 ------
 drivers/net/wireless/ath/ath11k/core.c     | 47 ++++--------
 drivers/net/wireless/ath/ath11k/core.h     | 10 ++-
 drivers/net/wireless/ath/ath11k/dp.c       |  1 +
 drivers/net/wireless/ath/ath11k/hal.c      | 87 +++++++++++-----------
 drivers/net/wireless/ath/ath11k/hal_desc.h |  2 +
 drivers/net/wireless/ath/ath11k/hal_rx.c   | 22 +++---
 drivers/net/wireless/ath/ath11k/hal_tx.c   | 13 ++--
 drivers/net/wireless/ath/ath11k/hal_tx.h   |  1 +
 drivers/net/wireless/ath/ath11k/hif.h      | 65 ++++++++++++++++
 drivers/net/wireless/ath/ath11k/htc.c      |  4 +-
 drivers/net/wireless/ath/ath11k/hw.h       |  5 ++
 13 files changed, 198 insertions(+), 128 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/hif.h

-- 
2.22.0

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
