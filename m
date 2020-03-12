Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCNfL-0001XB-Uu
 for ath11k@lists.infradead.org; Thu, 12 Mar 2020 13:14:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath11k: Supporting RX ring backpressure HTT event and
 stats handling
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1581909128-14861-1-git-send-email-srirrama@codeaurora.org>
References: <1581909128-14861-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20200312131422.54190C433D2@smtp.codeaurora.org>
Date: Thu, 12 Mar 2020 13:14:22 +0000 (UTC)
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
To: Sriram R <srirrama@codeaurora.org>
Cc: Vikas Patel <vikpatel@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> From: Vikas Patel <vikpatel@codeaurora.org>
> 
> The Firmware sends HTT event to host whenever there is a
> backpressure on RX rings, Handling such event and dumping
> info on the console under the "ATH11K_DBG_DP_HTT"  debug level.
> 
> Fetching RX ring backpressure histogram from FW via htt_stats debugfs.
> 
>  #echo "24" > /sys/kernel/debug/ath11k/macX/htt_stats_type
>  #cat /sys/kernel/debug/ath11k/macX/htt_stats
> 
> Signed-off-by: Vikas Patel <vikpatel@codeaurora.org>
> Signed-off-by: Sriram R <srirrama@codeaurora.org>

Fails to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/dp_rx.c:1330
error: drivers/net/wireless/ath/ath11k/dp_rx.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11385041/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
