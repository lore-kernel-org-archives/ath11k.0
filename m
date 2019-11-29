Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iab1M-0007Mh-02
 for ath11k@lists.infradead.org; Fri, 29 Nov 2019 07:48:57 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 01/10] ath11k: tracing: fix ath11k tracing
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016ead3164f5-3135488d-f71b-4fc9-834f-08a735724e15-000000@us-west-2.amazonses.com>
References: <0101016ead3164f5-3135488d-f71b-4fc9-834f-08a735724e15-000000@us-west-2.amazonses.com>
Message-ID: <0101016eb62256c5-39f3a0c8-cd74-4617-9b67-d03024ec6c93-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2019 07:48:54 +0000
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

> Add missing tracing subsystem define.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

10 patches applied to ath-next branch of ath.git, thanks.

e8da3986570e ath11k: tracing: fix ath11k tracing
d6af906d8307 ath11k: qmi clean up ce and HTC service config update
0c408515cd3b ath11k: qmi clean up in ath11k_qmi_wlanfw_wlan_cfg_send()
d0f390eae072 ath11k: pktlog: fix sending/using the pdev id
f425078b449f ath11k: avoid burst time conversion logic
30679ec40918 ath11k: avoid use_after_free in ath11k_dp_rx_msdu_coalesce API
fe201947f8bd ath11k: update bawindow size in delba process
64f1d7e94daa ath11k: add support for controlling tx power to a station
ba47923974fb ath11k: unlock mutex during failure in qmi fw ready
1cb616a3b497 ath11k: add necessary peer assoc params in wmi dbg

-- 
https://patchwork.kernel.org/patch/11264127/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
