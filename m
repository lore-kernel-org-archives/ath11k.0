Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEX93-0002Do-74
 for ath11k@lists.infradead.org; Wed, 18 Mar 2020 11:46:01 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: Supporting RX ring backpressure HTT event and
 stats handling
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1584350920-20688-1-git-send-email-srirrama@codeaurora.org>
References: <1584350920-20688-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20200318114546.B8411C433BA@smtp.codeaurora.org>
Date: Wed, 18 Mar 2020 11:45:46 +0000 (UTC)
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

> The Firmware sends HTT event to host whenever there is a
> backpressure on RX rings, Handling such event and dumping
> info on the console under the "ATH11K_DBG_DP_HTT"  debug level.
> 
> Fetching RX ring backpressure histogram from FW via htt_stats debugfs.
> 
>  #echo "24" > /sys/kernel/debug/ath11k/ipq8074/macX/htt_stats_type
>  #cat /sys/kernel/debug/ath11k/ipq8074/macX/htt_stats
> 
> Signed-off-by: Vikas Patel <vikpatel@codeaurora.org>
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

678e8414bf4e ath11k: Supporting RX ring backpressure HTT event and stats handling

-- 
https://patchwork.kernel.org/patch/11440011/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
