Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.lkml@gmail.com>
Subject: wireless: convert tasklets to use new tasklet_setup() API
Date: Tue,  6 Oct 2020 11:21:33 +0530
Message-Id: <20201006055135.291411-1-allen.lkml@gmail.com>
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
To: kvalo@codeaurora.org
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com, kuba@kernel.org, Allen Pais <apais@linux.microsoft.com>, davem@davemloft.net, nbd@nbd.name

From: Allen Pais <apais@linux.microsoft.com>

 This series converts the remaining drivers to use new
tasklet_setup() API.

 The patches are based on wireless-drivers-next.git

Allen Pais (2):
  ath11k: convert tasklets to use new tasklet_setup() API
  wireless: mt76: convert tasklets to use new tasklet_setup() API

 drivers/net/wireless/ath/ath11k/pci.c              |  7 +++----
 drivers/net/wireless/mediatek/mt76/mt7603/beacon.c |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7603/init.c   |  3 +--
 drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/mmio.c   |  6 +++---
 drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c   | 10 +++++-----
 drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c  |  7 +++----
 drivers/net/wireless/mediatek/mt76/usb.c           |  6 +++---
 drivers/net/wireless/mediatek/mt7601u/dma.c        | 12 ++++++------
 9 files changed, 27 insertions(+), 30 deletions(-)

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
