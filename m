Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVXxF-0006RI-Bl
 for ath11k@lists.infradead.org; Fri, 15 Nov 2019 09:31:50 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v3 49/49] MAINTAINERS: add ath11k
Date: Fri, 15 Nov 2019 11:29:13 +0200
Message-Id: <1573810153-29623-50-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1573810153-29623-1-git-send-email-kvalo@codeaurora.org>
References: <1573810153-29623-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org, ath11k@lists.infradead.org

Add an entry for ath11k to the MAINTAINERS file.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 677ef41cb012..ae00b2c443b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13028,6 +13028,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
 S:	Supported
 F:	drivers/net/wireless/ath/ath10k/
 
+QUALCOMM ATHEROS ATH11K WIRELESS DRIVER
+M:	Kalle Valo <kvalo@codeaurora.org>
+L:	ath11k@lists.infradead.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
+S:	Supported
+F:	drivers/net/wireless/ath/ath11k/
+
 QUALCOMM ATHEROS ATH9K WIRELESS DRIVER
 M:	QCA ath9k Development <ath9k-devel@qca.qualcomm.com>
 L:	linux-wireless@vger.kernel.org


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
