Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 00/16] wirless: convert tasklets to use new tasklet_setup()
Date: Mon, 17 Aug 2020 14:36:21 +0530
Message-Id: <20200817090637.26887-1-allen.cryptic@gmail.com>
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
To: kvalo@codeaurora.org, kuba@kernel.org, jirislaby@kernel.org, mickflemm@gmail.com, mcgrof@kernel.org, chunkeey@googlemail.com, Larry.Finger@lwfinger.net, stas.yakovlev@gmail.com, helmut.schaa@googlemail.com, pkshih@realtek.com, yhchuang@realtek.com, dsd@gentoo.org, kune@deine-taler.de
Cc: brcm80211-dev-list.pdl@broadcom.com, keescook@chromium.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, brcm80211-dev-list@cypress.com, b43-dev@lists.infradead.org, Allen Pais <allen.lkml@gmail.com>, ath11k@lists.infradead.org

From: Allen Pais <allen.lkml@gmail.com>

Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
introduced a new tasklet initialization API. This series converts 
all the wireless drivers to use the new tasklet_setup() API

Allen Pais (16):
  wireless: ath5k: convert tasklets to use new tasklet_setup() API
  wireless: ath9k: convert tasklets to use new tasklet_setup() API
  wireless: ath: convert tasklets to use new tasklet_setup() API
  wireless: ath11k: convert tasklets to use new tasklet_setup() API
  wireless: atmel: convert tasklets to use new tasklet_setup() API
  wireless: b43legacy: convert tasklets to use new tasklet_setup() API
  wireless: brcm80211: convert tasklets to use new tasklet_setup() API
  wireless: ipw2x00: convert tasklets to use new tasklet_setup() API
  wireless: iwlegacy: convert tasklets to use new tasklet_setup() API
  wireless: intersil: convert tasklets to use new tasklet_setup() API
  wireless: marvell: convert tasklets to use new tasklet_setup() API
  wireless: mediatek: convert tasklets to use new tasklet_setup() API
  wireless: quantenna: convert tasklets to use new tasklet_setup() API
  wireless: ralink: convert tasklets to use new tasklet_setup() API
  wireless: realtek: convert tasklets to use new tasklet_setup() API
  wireless: zydas: convert tasklets to use new tasklet_setup() API

 drivers/net/wireless/ath/ath11k/ahb.c         |  7 +++---
 drivers/net/wireless/ath/ath5k/base.c         | 24 +++++++++----------
 drivers/net/wireless/ath/ath5k/rfkill.c       |  7 +++---
 drivers/net/wireless/ath/ath9k/ath9k.h        |  4 ++--
 drivers/net/wireless/ath/ath9k/beacon.c       |  4 ++--
 drivers/net/wireless/ath/ath9k/htc.h          |  4 ++--
 drivers/net/wireless/ath/ath9k/htc_drv_init.c |  6 ++---
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c |  8 +++----
 drivers/net/wireless/ath/ath9k/init.c         |  5 ++--
 drivers/net/wireless/ath/ath9k/main.c         |  4 ++--
 drivers/net/wireless/ath/ath9k/wmi.c          |  7 +++---
 drivers/net/wireless/ath/ath9k/wmi.h          |  2 +-
 drivers/net/wireless/ath/carl9170/usb.c       |  7 +++---
 drivers/net/wireless/atmel/at76c50x-usb.c     |  9 ++++---
 .../net/wireless/broadcom/b43legacy/main.c    |  8 +++----
 drivers/net/wireless/broadcom/b43legacy/pio.c |  7 +++---
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c |  6 ++---
 .../broadcom/brcm80211/brcmsmac/mac80211_if.h |  2 +-
 drivers/net/wireless/intel/ipw2x00/ipw2100.c  |  9 ++++---
 drivers/net/wireless/intel/ipw2x00/ipw2200.c  |  7 +++---
 .../net/wireless/intel/iwlegacy/3945-mac.c    |  8 +++----
 .../net/wireless/intel/iwlegacy/4965-mac.c    |  8 +++----
 .../net/wireless/intersil/hostap/hostap_hw.c  | 18 +++++++-------
 drivers/net/wireless/intersil/orinoco/main.c  |  7 +++---
 drivers/net/wireless/intersil/p54/p54pci.c    |  8 +++----
 drivers/net/wireless/marvell/mwl8k.c          | 16 ++++++-------
 drivers/net/wireless/mediatek/mt76/mac80211.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |  2 +-
 .../wireless/mediatek/mt76/mt7603/beacon.c    |  4 ++--
 .../net/wireless/mediatek/mt76/mt7603/init.c  |  3 +--
 .../wireless/mediatek/mt76/mt7603/mt7603.h    |  2 +-
 .../net/wireless/mediatek/mt76/mt7615/mmio.c  |  6 ++---
 .../net/wireless/mediatek/mt76/mt76x02_dfs.c  | 10 ++++----
 .../net/wireless/mediatek/mt76/mt76x02_mmio.c | 14 +++++------
 drivers/net/wireless/mediatek/mt76/tx.c       |  4 ++--
 drivers/net/wireless/mediatek/mt76/usb.c      | 12 +++++-----
 drivers/net/wireless/mediatek/mt7601u/dma.c   | 12 +++++-----
 .../quantenna/qtnfmac/pcie/pearl_pcie.c       |  7 +++---
 .../quantenna/qtnfmac/pcie/topaz_pcie.c       |  7 +++---
 .../net/wireless/ralink/rt2x00/rt2400pci.c    | 14 ++++++-----
 .../net/wireless/ralink/rt2x00/rt2500pci.c    | 14 ++++++-----
 .../net/wireless/ralink/rt2x00/rt2800mmio.c   | 24 +++++++++++--------
 .../net/wireless/ralink/rt2x00/rt2800mmio.h   | 10 ++++----
 drivers/net/wireless/ralink/rt2x00/rt2x00.h   | 10 ++++----
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    |  5 ++--
 drivers/net/wireless/ralink/rt2x00/rt61pci.c  | 20 +++++++++-------
 drivers/net/wireless/realtek/rtlwifi/pci.c    | 21 ++++++++--------
 drivers/net/wireless/realtek/rtlwifi/usb.c    |  9 ++++---
 drivers/net/wireless/realtek/rtw88/main.c     |  3 +--
 drivers/net/wireless/realtek/rtw88/tx.c       |  4 ++--
 drivers/net/wireless/realtek/rtw88/tx.h       |  2 +-
 drivers/net/wireless/zydas/zd1211rw/zd_usb.c  |  8 +++----
 52 files changed, 208 insertions(+), 223 deletions(-)

-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
