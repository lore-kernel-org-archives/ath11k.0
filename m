Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG0Px-000486-8D
 for ath11k@lists.infradead.org; Wed, 09 Sep 2020 13:45:46 +0000
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] ath11k: Remove unused inline function
 htt_htt_stats_debug_dump()
Date: Wed, 9 Sep 2020 21:45:33 +0800
Message-ID: <20200909134533.19604-1-yuehaibing@huawei.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, linux-kernel@vger.kernel.org

There is no caller in tree, so can remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 .../net/wireless/ath/ath11k/debug_htt_stats.c | 44 -------------------
 1 file changed, 44 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 6b532dc99c98..ad3f08a5b031 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -3895,50 +3895,6 @@ static inline void htt_print_backpressure_stats_tlv_v(const u32 *tag_buf,
 	}
 }
 
-static inline void htt_htt_stats_debug_dump(const u32 *tag_buf,
-					    struct debug_htt_stats_req *stats_req)
-{
-	u8 *buf = stats_req->buf;
-	u32 len = stats_req->buf_len;
-	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	u32 tlv_len = 0, i = 0, word_len = 0;
-
-	tlv_len  = FIELD_GET(HTT_TLV_LEN, *tag_buf) + HTT_TLV_HDR_LEN;
-	word_len = (tlv_len % 4) == 0 ? (tlv_len / 4) : ((tlv_len / 4) + 1);
-	len += HTT_DBG_OUT(buf + len, buf_len - len,
-			   "============================================");
-	len += HTT_DBG_OUT(buf + len, buf_len - len,
-			   "HKDBG TLV DUMP: (tag_len=%u bytes, words=%u)",
-			   tlv_len, word_len);
-
-	for (i = 0; i + 3 < word_len; i += 4) {
-		len += HTT_DBG_OUT(buf + len, buf_len - len,
-				   "0x%08x 0x%08x 0x%08x 0x%08x",
-				   tag_buf[i], tag_buf[i + 1],
-				   tag_buf[i + 2], tag_buf[i + 3]);
-	}
-
-	if (i + 3 == word_len) {
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "0x%08x 0x%08x 0x%08x ",
-				tag_buf[i], tag_buf[i + 1], tag_buf[i + 2]);
-	} else if (i + 2 == word_len) {
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "0x%08x 0x%08x ",
-				tag_buf[i], tag_buf[i + 1]);
-	} else if (i + 1 == word_len) {
-		len += HTT_DBG_OUT(buf + len, buf_len - len, "0x%08x ",
-				tag_buf[i]);
-	}
-	len += HTT_DBG_OUT(buf + len, buf_len - len,
-			   "============================================");
-
-	if (len >= buf_len)
-		buf[buf_len - 1] = 0;
-	else
-		buf[len] = 0;
-
-	stats_req->buf_len = len;
-}
-
 static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
 					  u16 tag, u16 len, const void *tag_buf,
 					  void *user_data)
-- 
2.17.1



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
