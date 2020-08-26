Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB4LR-0000dd-1G
 for ath11k@lists.infradead.org; Wed, 26 Aug 2020 22:56:41 +0000
Received: by mail-lj1-x243.google.com with SMTP id t6so4231895ljk.9
 for <ath11k@lists.infradead.org>; Wed, 26 Aug 2020 15:56:39 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH net-next 0/6] drivers/net: constify static ops-variables
Date: Thu, 27 Aug 2020 00:56:02 +0200
Message-Id: <20200826225608.90299-1-rikard.falkeborn@gmail.com>
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
To: "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>, Antoine Tenart <antoine.tenart@bootlin.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@gmail.com>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Heiner Kallweit <hkallweit1@gmail.com>

This series constifies a number of static ops variables, to allow the
compiler to put them in read-only memory. Compile-tested only.

Rikard Falkeborn (6):
  net: ethernet: qualcomm: constify qca_serdev_ops
  net: ethernet: ravb: constify bb_ops
  net: renesas: sh_eth: constify bb_ops
  net: phy: at803x: constify static regulator_ops
  net: phy: mscc: macsec: constify vsc8584_macsec_ops
  net: ath11k: constify ath11k_thermal_ops

 drivers/net/ethernet/qualcomm/qca_uart.c  | 2 +-
 drivers/net/ethernet/renesas/ravb_main.c  | 2 +-
 drivers/net/ethernet/renesas/sh_eth.c     | 2 +-
 drivers/net/phy/at803x.c                  | 4 ++--
 drivers/net/phy/mscc/mscc_macsec.c        | 2 +-
 drivers/net/wireless/ath/ath11k/thermal.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.28.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
