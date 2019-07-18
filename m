Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnzH1-0001VC-7V
 for ath11k@lists.infradead.org; Thu, 18 Jul 2019 05:48:14 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] MAINTAINERS: add ath11k
Date: Thu, 18 Jul 2019 07:47:57 +0200
Message-Id: <20190718054757.32693-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

This makes the get_maintainer.pl script work.

Signed-off-by: John Crispin <john@phrozen.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c2fce72e694..43006c2debf0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12827,6 +12827,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
 S:	Supported
 F:	drivers/net/wireless/ath/ath10k/
 
+QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
+M:	Kalle Valo <kvalo@codeaurora.org>
+L:	ath11k@lists.infradead.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
+S:	Supported
+F:	drivers/net/wireless/ath/ath11k/
+
 QUALCOMM ATHEROS ATH9K WIRELESS DRIVER
 M:	QCA ath9k Development <ath9k-devel@qca.qualcomm.com>
 L:	linux-wireless@vger.kernel.org
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
