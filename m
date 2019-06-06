Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvN7-00034d-4X
 for ath11k@lists.infradead.org; Thu, 06 Jun 2019 16:36:16 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k/dp_tx: Remove endian conversion in
 HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559559277-21696-1-git-send-email-vthiagar@codeaurora.org>
References: <1559559277-21696-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190606163612.00AB1615AB@smtp.codeaurora.org>
Date: Thu,  6 Jun 2019 16:36:11 +0000 (UTC)
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
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: ath11k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:

> With copyengine performing byte-swap when host target endian is different,
> driver should not do any endian conversion over the messages going through
> any of the copyengines. Remove the endian conversion while sending
> HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG, this also fixes the below sparse
> warnings.
> 
> drivers/net/wireless/ath/ath11k/dp_tx.c:837:33: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/dp_tx.c:837:33:    expected unsigned int [usertype] pkt_type_en_flags0
> drivers/net/wireless/ath/ath11k/dp_tx.c:837:33:    got restricted __le32 [usertype]
> drivers/net/wireless/ath/ath11k/dp_tx.c:838:33: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/dp_tx.c:838:33:    expected unsigned int [usertype] pkt_type_en_flags1
> drivers/net/wireless/ath/ath11k/dp_tx.c:838:33:    got restricted __le32 [usertype]
> drivers/net/wireless/ath/ath11k/dp_tx.c:839:33: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/dp_tx.c:839:33:    expected unsigned int [usertype] pkt_type_en_flags2
> drivers/net/wireless/ath/ath11k/dp_tx.c:839:33:    got restricted __le32 [usertype]
> drivers/net/wireless/ath/ath11k/dp_tx.c:840:33: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/dp_tx.c:840:33:    expected unsigned int [usertype] pkt_type_en_flags3
> drivers/net/wireless/ath/ath11k/dp_tx.c:840:33:    got restricted __le32 [usertype]
> drivers/net/wireless/ath/ath11k/dp_tx.c:841:28: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/dp_tx.c:841:28:    expected unsigned int [usertype] rx_filter_tlv
> drivers/net/wireless/ath/ath11k/dp_tx.c:841:28:    got restricted __le32 [usertype]
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>

Patch applied to ath.git, thanks.

3191e61b1618 ath11k/dp_tx: Remove endian conversion in HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG

-- 
https://patchwork.kernel.org/patch/10972749/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
