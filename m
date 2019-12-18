Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihcz4-0005CK-KF
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 17:19:39 +0000
Received: by mail-pg1-x542.google.com with SMTP id b137so1612046pga.6
 for <ath11k@lists.infradead.org>; Wed, 18 Dec 2019 09:19:38 -0800 (PST)
Date: Wed, 18 Dec 2019 09:19:35 -0800
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] ath11k: Use sizeof_field() instead of FIELD_SIZEOF()
Message-ID: <201912180919.2A471217@keescook>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, ath11k@lists.infradead.org

The FIELD_SIZEOF() macro was redundant, and is being removed from the
kernel. Since commit c593642c8be0 ("treewide: Use sizeof_field() macro")
this is one of the last users of the old macro, so replace it.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 4a518d406bc5..fd7cb07a9940 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -44,7 +44,7 @@ struct wmi_tlv {
 
 #define WMI_TLV_LEN	GENMASK(15, 0)
 #define WMI_TLV_TAG	GENMASK(31, 16)
-#define TLV_HDR_SIZE	FIELD_SIZEOF(struct wmi_tlv, header)
+#define TLV_HDR_SIZE	sizeof_field(struct wmi_tlv, header)
 
 #define WMI_CMD_HDR_CMD_ID      GENMASK(23, 0)
 #define WMI_MAX_MEM_REQS        32
-- 
2.17.1


-- 
Kees Cook

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
