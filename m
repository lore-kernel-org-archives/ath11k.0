Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4Y-00082F-QL
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:16 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 00/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab
Date: Thu,  8 Aug 2019 18:32:57 +0530
Message-Id: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

Struct ath11k_base is represented as 'sc' and 'ab'.
In order to avoid confusion and better readability,
renamed the ath11k_base struct representation from
'sc' to 'ab.

No functional changes are made in this patchset.

Maharaja Kennadyrajan (15):
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in ahb.c
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in ce.c
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in ce.h
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in core.c
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in core.h
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in debug.c
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in debug.h
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in dp.c
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in dp.h
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in dp_rx.c
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in hal.c
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in hal.h
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in qmi.h
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in wmi.c
  ath11k: Rename ath11k_base struct from 'sc' to 'ab in wmi.h

 drivers/net/wireless/ath/ath11k/ahb.c   | 202 +++++++--------
 drivers/net/wireless/ath/ath11k/ce.c    |  96 +++----
 drivers/net/wireless/ath/ath11k/ce.h    |  10 +-
 drivers/net/wireless/ath/ath11k/core.c  | 328 ++++++++++++------------
 drivers/net/wireless/ath/ath11k/core.h  |   4 +-
 drivers/net/wireless/ath/ath11k/debug.c |  12 +-
 drivers/net/wireless/ath/ath11k/debug.h |  14 +-
 drivers/net/wireless/ath/ath11k/dp.c    |  40 +--
 drivers/net/wireless/ath/ath11k/dp.h    |   8 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c |   6 +-
 drivers/net/wireless/ath/ath11k/hal.c   | 134 +++++-----
 drivers/net/wireless/ath/ath11k/hal.h   |   8 +-
 drivers/net/wireless/ath/ath11k/qmi.h   |   8 +-
 drivers/net/wireless/ath/ath11k/wmi.c   |  94 +++----
 drivers/net/wireless/ath/ath11k/wmi.h   |  16 +-
 15 files changed, 490 insertions(+), 490 deletions(-)

-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
