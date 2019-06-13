Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbDdl-00085X-0P
 for ath11k@lists.infradead.org; Thu, 13 Jun 2019 00:30:54 +0000
MIME-Version: 1.0
Date: Thu, 13 Jun 2019 06:00:52 +0530
From: Sriram R <srirrama@codeaurora.org>
Subject: Re: [PATCH] ath11k: Fix vdev start failure when operating in CN, KR
 regdomain
In-Reply-To: <878suevevc.fsf@kamboji.qca.qualcomm.com>
References: <1559561865-27928-1-git-send-email-srirrama@codeaurora.org>
 <20190606163825.E0DD560E75@smtp.codeaurora.org>
 <878suevevc.fsf@kamboji.qca.qualcomm.com>
Message-ID: <2236c335e44587db2e928bdf5150a0aa@codeaurora.org>
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
Cc: ath11k@lists.infradead.org

On 2019-06-06 22:18, Kalle Valo wrote:
> Kalle Valo <kvalo@codeaurora.org> writes:
> 
>> Sriram R <srirrama@codeaurora.org> wrote:
>> 
>>> Currently, firmware expects the correct regdomain to be set in
>>> vdev start command. As firmware supports regulatory offload, it can 
>>> track
>>> the current regdomain. This info is received from firmware via
>>> REG_CHAN_LIST_CC event during bringup or after setting country code.
>>> Currently the dfs_region received is mapped to nl80211_dfs_regions
>>> and stored in default_regd or new_regd and is used for vdev start.
>>> But since nl80211_dfs_regions doesn't have a value enumerated for CN
>>> KR, the firmware rejects VDEV start with an 'invalid regdomain' 
>>> error.
>>> Hence, send the appropriate regdomain received from firmware during
>>> REG_CHAN_LIST_CC event in vdev start to avoid vdev start failure.
>>> 
>>> Signed-off-by: Sriram R <srirrama@codeaurora.org>
>> 
>> Patch applied to ath.git, thanks.
>> 
>> b0d742f32bc3 ath11k: Fix vdev start failure when operating in CN, KR 
>> regdomain
> 
> This added a new warning:
> 
> drivers/net/wireless/ath/ath11k/wmi.c:4655:34: warning: mixing
> different enum types
> drivers/net/wireless/ath/ath11k/wmi.c:4655:34:     unsigned int enum
> dfs_reg versus
> drivers/net/wireless/ath/ath11k/wmi.c:4655:34:     unsigned int enum
> ath11k_dfs_region
> 
> Please send a followup patch to fix that.
Sure Kalle. These warnings got subsided during my compilation and they 
look
valid. I'll send a followup patch.

Regards,
Sriram.R

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
