Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcihQ-00064R-Jt
 for ath11k@lists.infradead.org; Wed, 11 Nov 2020 05:29:41 +0000
MIME-Version: 1.0
Date: Wed, 11 Nov 2020 10:59:32 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH 1/3] ath11k: vdev delete synchronization with firmware
In-Reply-To: <20201110182825.3D1C6C433FE@smtp.codeaurora.org>
References: <1590067829-26109-2-git-send-email-mkenna@codeaurora.org>
 <20201110182825.3D1C6C433FE@smtp.codeaurora.org>
Message-ID: <40170802ba4bc4787c126004a42be3e8@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Ritesh Singh <ritesi@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-11-10 23:58, Kalle Valo wrote:
> Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:
> 
>> From: Ritesh Singh <ritesi@codeaurora.org>
>> 
>> When the interface is added immediately after removing the
>> interface, vdev deletion in firmware might not have been
>> completed.
>> 
>> Hence, add vdev_delete_resp_event and wait_event_timeout
>> to synchronize with firmware.
>> 
>> Tested-on: IPQ8074 WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>
>> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> 
> Does not apply anymore, please rebase.
> 
> error: patch failed: drivers/net/wireless/ath/ath11k/wmi.c:97
> error: drivers/net/wireless/ath/ath11k/wmi.c: patch does not apply
> stg import: Diff does not apply cleanly
> 
> 3 patches set to Changes Requested.

[Maha]: Sure, Kalle. I will rebase and send the next version of this 
patch.

> 11562969 [1/3] ath11k: vdev delete synchronization with firmware
> 11562967 [2/3] ath11k: peer delete synchronization with firmware
> 11562971 [3/3] ath11k: remove "ath11k_mac_get_ar_vdev_stop_status" 
> references

Regards,
Maha

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
