Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcYNj-0002Zt-0q
 for ath11k@lists.infradead.org; Tue, 10 Nov 2020 18:28:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: vdev delete synchronization with firmware
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1590067829-26109-2-git-send-email-mkenna@codeaurora.org>
References: <1590067829-26109-2-git-send-email-mkenna@codeaurora.org>
Message-Id: <20201110182825.11500C433F0@smtp.codeaurora.org>
Date: Tue, 10 Nov 2020 18:28:25 +0000 (UTC)
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

> From: Ritesh Singh <ritesi@codeaurora.org>
> 
> When the interface is added immediately after removing the
> interface, vdev deletion in firmware might not have been
> completed.
> 
> Hence, add vdev_delete_resp_event and wait_event_timeout
> to synchronize with firmware.
> 
> Tested-on: IPQ8074 WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>

Does not apply anymore, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/wmi.c:97
error: drivers/net/wireless/ath/ath11k/wmi.c: patch does not apply
stg import: Diff does not apply cleanly

3 patches set to Changes Requested.

11562969 [1/3] ath11k: vdev delete synchronization with firmware
11562967 [2/3] ath11k: peer delete synchronization with firmware
11562971 [3/3] ath11k: remove "ath11k_mac_get_ar_vdev_stop_status" references

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1590067829-26109-2-git-send-email-mkenna@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
