Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNf1A-0001YA-Qt
 for ath11k@lists.infradead.org; Mon, 06 May 2019 14:55:02 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH v3 0/6] ath11k: add monitor mode support
Date: Mon,  6 May 2019 07:54:50 -0700
Message-Id: <1557154496-12059-1-git-send-email-milehu@codeaurora.org>
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
Cc: Miles Hu <milehu@codeaurora.org>

Adding monitor mode in ath11k. It can be enabled
 by commands below:

  ifconfig wlan0 down
  iw wlan0 set type monitor
  ifconfig wlan0 up

change channel:
  iw wlan0 set freq 5805 80 5775

Change summary:
1. create monitor status/destination/buffer/link descriptor rings.
2. enable these rings and push ring filters to buffer/status rings.
3. add napi entry point for monitor status and destination rings process.
4. implement monitor status/buffer rings replenish.
5. process entries from the status ring to get ppdu id and tlv status.
6. process entries from the destination ring by comparing ppdu id to build
    msdu list.
7. merge msdu list to mpdu and copy rx status to cb.
8. deliver mpdu to upper layer.

Known issues:
 - Coexist with other interface type (AP/STA) not fully supported.
 - higher data rates (11ax) not supported. radiotap needs proper info.
 - signal strength and rate idx not accurate in some packets.

-Miles Hu

Miles Hu (6):
  ath11k: init/deinit monitor rings
  ath11k: monitor filter set function
  ath11k: htt setup monitor rings
  ath11k: monitor mode attach/detach
  ath11k: enable/disable monitor mode and destination ring entry process
  ath11k: merge msdu tlv process and status/destination ring process

V2:
 - Move to ath11k-bringup branch
V3:
 - Fix compile error on x86

 drivers/net/wireless/ath/ath11k/core.h     |   8 +-
 drivers/net/wireless/ath/ath11k/dp.c       | 111 ++--
 drivers/net/wireless/ath/ath11k/dp.h       | 189 ++++++-
 drivers/net/wireless/ath/ath11k/dp_rx.c    | 864 ++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/dp_rx.h    |  61 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c    | 179 +++---
 drivers/net/wireless/ath/ath11k/dp_tx.h    |   1 +
 drivers/net/wireless/ath/ath11k/hal.c      |   2 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h |   3 +
 drivers/net/wireless/ath/ath11k/hal_rx.c   |  28 +
 drivers/net/wireless/ath/ath11k/hal_rx.h   |  17 +
 drivers/net/wireless/ath/ath11k/mac.c      |  40 +-
 drivers/net/wireless/ath/ath11k/rx_desc.h  |   1 +
 13 files changed, 1341 insertions(+), 163 deletions(-)

-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
