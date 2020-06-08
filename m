Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQrR-0007Gs-O7
 for ath11k@lists.infradead.org; Mon, 08 Jun 2020 23:07:29 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.7 058/274] ath11k: Fix some resource leaks in error
 path in 'ath11k_thermal_register()'
Date: Mon,  8 Jun 2020 19:02:31 -0400
Message-Id: <20200608230607.3361041-58-sashal@kernel.org>
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
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
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit 25ca180ad380a0c7286442a922e7fbcc6a9f6083 ]

If 'thermal_cooling_device_register()' fails, we must undo what has been
allocated so far. So we must go to 'err_thermal_destroy' instead of
returning directly

In case of error in 'ath11k_thermal_register()', the previous
'thermal_cooling_device_register()' call must also be undone. Move the
'ar->thermal.cdev = cdev' a few lines above in order for this to be done
in 'ath11k_thermal_unregister()' which is called in the error handling
path.

Fixes: 2a63bbca06b2 ("ath11k: add thermal cooling device support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20200513201454.258111-1-christophe.jaillet@wanadoo.fr
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/thermal.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/thermal.c b/drivers/net/wireless/ath/ath11k/thermal.c
index 259dddbda2c7..5a7e150c621b 100644
--- a/drivers/net/wireless/ath/ath11k/thermal.c
+++ b/drivers/net/wireless/ath/ath11k/thermal.c
@@ -174,9 +174,12 @@ int ath11k_thermal_register(struct ath11k_base *sc)
 		if (IS_ERR(cdev)) {
 			ath11k_err(sc, "failed to setup thermal device result: %ld\n",
 				   PTR_ERR(cdev));
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_thermal_destroy;
 		}
 
+		ar->thermal.cdev = cdev;
+
 		ret = sysfs_create_link(&ar->hw->wiphy->dev.kobj, &cdev->device.kobj,
 					"cooling_device");
 		if (ret) {
@@ -184,7 +187,6 @@ int ath11k_thermal_register(struct ath11k_base *sc)
 			goto err_thermal_destroy;
 		}
 
-		ar->thermal.cdev = cdev;
 		if (!IS_REACHABLE(CONFIG_HWMON))
 			return 0;
 
-- 
2.25.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
