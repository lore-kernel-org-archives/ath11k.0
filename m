Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kP0qu-0005Xw-Ec
 for ath11k@lists.infradead.org; Sun, 04 Oct 2020 10:02:49 +0000
Received: by mail-wm1-x343.google.com with SMTP id f21so375603wml.3
 for <ath11k@lists.infradead.org>; Sun, 04 Oct 2020 03:02:48 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
Subject: [PATCH 1/2] ath11k: Fix memory leak on error path
Date: Sun,  4 Oct 2020 11:02:18 +0100
Message-Id: <20201004100218.311653-2-alex.dewar90@gmail.com>
In-Reply-To: <20201004100218.311653-1-alex.dewar90@gmail.com>
References: <20201004100218.311653-1-alex.dewar90@gmail.com>
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
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Dewar <alex.dewar90@gmail.com>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

In ath11k_mac_setup_iface_combinations(), if memory cannot be assigned
for the variable limits, then the memory assigned to combinations will
be leaked. Fix this.

Addresses-Coverity-ID: 1497534 ("Resource leaks")
Fixes: 2626c269702e ("ath11k: add interface_modes to hw_params")
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3f63a7bd6b59..7f8dd47d2333 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6041,8 +6041,10 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 	n_limits = 2;
 
 	limits = kcalloc(n_limits, sizeof(*limits), GFP_KERNEL);
-	if (!limits)
+	if (!limits) {
+		kfree(combinations);
 		return -ENOMEM;
+	}
 
 	limits[0].max = 1;
 	limits[0].types |= BIT(NL80211_IFTYPE_STATION);
-- 
2.28.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
