Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaarq-0003Y4-Rx
 for ath11k@lists.infradead.org; Fri, 29 Nov 2019 07:39:08 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 01/10] ath11k: Fix htt stats sounding info and pdev cca
 stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016ea76291c1-5098ab8c-5e07-4a40-a582-6bd9ae513b74-000000@us-west-2.amazonses.com>
References: <0101016ea76291c1-5098ab8c-5e07-4a40-a582-6bd9ae513b74-000000@us-west-2.amazonses.com>
Message-ID: <0101016eb619579d-05e0f102-a029-4b36-b69a-b975c589a74c-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2019 07:39:04 +0000
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> The Previous configuartion of htt stats sounding info and pdev cca stats
> are invalid due to that getting time out error.
> 
> Changing htt stats sounding info value from 0xFF to 0x00 and htt pdev cca
> stats from 0x10 to 0x00
> 
> Signed-off-by: Ganesh Sesetti <gseset@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

10 patches applied to ath-next branch of ath.git, thanks.

86d4def890fd ath11k: Fix htt stats sounding info and pdev cca stats
5e97128759b4 ath11k: fix resource leak in ath11k_mac_sta_state
5b90fc760db5 ath11k: fix wmi service ready ext tlv parsing
0f37fbf43c3f ath11k: update tcl cmd descriptor parameters for STA mode
293cb5839729 ath11k: optimize RX path latency
f1d34a01ed54 ath11k: avoid WMM param truncation
d12ac6c47a32 ath11k: remove unused tx ring counters
d2f510fa0103 ath11k: Fix skb_panic observed during msdu coalescing
79c647a3c59d ath11k: Fixing TLV length issue in peer pktlog WMI command
051cefa44667 ath11k: Fix target crash due to WBM_IDLE_LINK ring desc shortage

-- 
https://patchwork.kernel.org/patch/11261935/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
