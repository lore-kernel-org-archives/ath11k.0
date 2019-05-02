Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMCRj-0001yz-E8
 for ath11k@lists.infradead.org; Thu, 02 May 2019 14:12:24 +0000
MIME-Version: 1.0
Date: Thu, 02 May 2019 19:42:22 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH] ath11k: fix build issues on disabling ATH11K_DEBUG
In-Reply-To: <87woj9m1jk.fsf@kamboji.qca.qualcomm.com>
References: <1556045425-28750-1-git-send-email-akolli@codeaurora.org>
 <87woj9m1jk.fsf@kamboji.qca.qualcomm.com>
Message-ID: <6e9f3d1bb1a3ec7e925d8866dce0cdb1@codeaurora.org>
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

On 2019-05-02 18:55, Kalle Valo wrote:
> Anilkumar Kolli <akolli@codeaurora.org> writes:
> 
> Failed to apply:
> 
> Applying: ath11k: fix build issues on disabling ATH11K_DEBUG
> fatal: sha1 information is lacking or useless
> (drivers/net/wireless/ath/ath11k/dp_rx.c).
> error: could not build fake ancestor
> Patch failed at 0001 ath11k: fix build issues on disabling ATH11K_DEBUG
> 
> Please use ath11k-bringup branch as the baseline so that git can use
> 3-way merge. Otherwise it will be hard to resolve conflicts.

Hi Kalle,

Could you please try in this order,
0001-ath11k-move-per-peer-pktlog-entry-to-per-sta-debugfs.patch
0001-ath11k-fix-build-issues-on-disabling-ATH11K_DEBUG.patch

Thanks
Anil.

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
