Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khGGW-0001Qe-IT
 for ath11k@lists.infradead.org; Mon, 23 Nov 2020 18:08:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Fix the rx_filter flag setting for peer rssi
 stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1605091117-11005-1-git-send-email-mkenna@codeaurora.org>
References: <1605091117-11005-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20201123180839.34B3BC43460@smtp.codeaurora.org>
Date: Mon, 23 Nov 2020 18:08:39 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> Set the rx_filter in ath11k_mac_config_mon_status_default(),
> only when the rx_filter value exists in ath11k_debug_rx_filter().
> 
> Without this change, rx_filter gets set to 0 and peer rssi stats
> aren't updating properly from firmware.
> 
> Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01230-QCAHKSWPL_SILICONZ-4
> 
> Fixes: ec48d28ba291 ("ath11k: Fix rx_filter flags setting for per peer rx_stats")
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

11af6de4799e ath11k: Fix the rx_filter flag setting for peer rssi stats

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1605091117-11005-1-git-send-email-mkenna@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
