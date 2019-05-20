Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSdd4-0000Vl-9o
 for ath11k@lists.infradead.org; Mon, 20 May 2019 08:26:43 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: fix sparse symbol should be static warnings
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557811234-5439-1-git-send-email-kvalo@codeaurora.org>
References: <1557811234-5439-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20190520082641.8479460E5F@smtp.codeaurora.org>
Date: Mon, 20 May 2019 08:26:41 +0000 (UTC)
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

> Fixes warnings like:
> 
> drivers/net/wireless/ath/ath11k/wmi.c:203:5: warning: symbol 'ath11k_wmi_cmd_send_nowait' was not declared. Should it be static?
> 
> Also ath11k_dp_htt_rx_filter_setup() was declared in the wrong header file, fix that as well.
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath.git, thanks.

08c6d676f96b ath11k: fix sparse symbol should be static warnings
ef5f0fc6d73f ath11k: remove unused functions
e8cb49bd3900 ath11k: workaround GCC unitialised warnings

-- 
https://patchwork.kernel.org/patch/10942033/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
