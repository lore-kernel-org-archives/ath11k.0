Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxBqX-0005oM-ET
 for ath11k@lists.infradead.org; Mon, 12 Aug 2019 15:02:54 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 01/15] ath11k: rename per_transfer_context to skb
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <156534276745.30736.11736417077894270794.stgit@x230>
References: <156534276745.30736.11736417077894270794.stgit@x230>
Message-Id: <20190812150253.00A5F60AA3@smtp.codeaurora.org>
Date: Mon, 12 Aug 2019 15:02:52 +0000 (UTC)
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
Cc: ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> Rename the field to skb to make it more clear what it contains. While at it,
> change also two function parameters to use skb instead context.
> 
> No functional changes. Only compile tested.
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

15 patches applied to ath11k-bringup branch of ath.git, thanks.

3e4f065bbf2b ath11k: rename per_transfer_context to skb
78eb3c7fce34 ath11k: remove unused struct ath11k_ce_sg_item
75a016fcc8f7 ath11k: cleanup and rename ath11k_send_crash_inject_cmd()
c3df984c6cc3 ath11k: remove unused IEEE80211_VHTCAP defines
9abae4e48e1e ath11k: move ath11k_mac_destroy() after _create()
44781976e2e6 ath11k: random whitespace fixes
bf1a82d6d7aa ath11k: make static const in debugfs functions
dbb836bbbf6f ath11k: remove box comments
6b5972013e22 ath11k: move fops_pktlog_filter to correct place
2a5adaf9109a ath11k: avoid excessive casting in debug_htt_stats.c
ae021cdb8522 ath11k: debug_htt_stats: pass stats_req as a properly typed pointer
9566b90559c6 ath11k: debug_htt_stats: remove unnecessary cast
8cfd6f1e670b ath11k: debug_htt_stats: move tag_buf assignment to the first
31689a989dc5 ath11k: debug_htt_stats: fix line over 90 char warnings
2e1a3ed0437e ath11k: debug_htt_stats: move fops structs close to the functions

-- 
https://patchwork.kernel.org/patch/11085995/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
