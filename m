Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeD0N-0007WA-Aj
 for ath11k@lists.infradead.org; Thu, 28 May 2020 07:31:10 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ath11k: remove "ath11k_mac_get_ar_vdev_stop_status"
 references
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1590067829-26109-4-git-send-email-mkenna@codeaurora.org>
References: <1590067829-26109-4-git-send-email-mkenna@codeaurora.org>
Message-Id: <20200528073035.22F46C43387@smtp.codeaurora.org>
Date: Thu, 28 May 2020 07:30:35 +0000 (UTC)
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
Cc: Ritesh Singh <ritesi@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> Unused structure ath11k_vdev_stop_status is removed.
> 'ath11k_mac_get_ar_vdev_stop_status' api has been replaced
> with 'ath11k_mac_get_ar_by_vdev_id' inside vdev_stopped_event.
> 
> Tested-on: IPQ8074 WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

What about other firmware branches? For example, will this break 2.1.0.1 branch support?

-- 
https://patchwork.kernel.org/patch/11562971/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
