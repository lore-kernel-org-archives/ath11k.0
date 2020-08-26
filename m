Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB4LW-0000ei-Jl
 for ath11k@lists.infradead.org; Wed, 26 Aug 2020 22:56:47 +0000
Received: by mail-lj1-x243.google.com with SMTP id w25so4221347ljo.12
 for <ath11k@lists.infradead.org>; Wed, 26 Aug 2020 15:56:46 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH net-next 6/6] net: ath11k: constify ath11k_thermal_ops
Date: Thu, 27 Aug 2020 00:56:08 +0200
Message-Id: <20200826225608.90299-7-rikard.falkeborn@gmail.com>
In-Reply-To: <20200826225608.90299-1-rikard.falkeborn@gmail.com>
References: <20200826225608.90299-1-rikard.falkeborn@gmail.com>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

The only usage of ath11k_thermal_ops is to pass its address to
thermal_cooling_device_register() which takes a const pointer. Make it
const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/net/wireless/ath/ath11k/thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/thermal.c b/drivers/net/wireless/ath/ath11k/thermal.c
index 5a7e150c621b..c96b26f39a25 100644
--- a/drivers/net/wireless/ath/ath11k/thermal.c
+++ b/drivers/net/wireless/ath/ath11k/thermal.c
@@ -53,7 +53,7 @@ ath11k_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
 	return ret;
 }
 
-static struct thermal_cooling_device_ops ath11k_thermal_ops = {
+static const struct thermal_cooling_device_ops ath11k_thermal_ops = {
 	.get_max_state = ath11k_thermal_get_max_throttle_state,
 	.get_cur_state = ath11k_thermal_get_cur_throttle_state,
 	.set_cur_state = ath11k_thermal_set_cur_throttle_state,
-- 
2.28.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
