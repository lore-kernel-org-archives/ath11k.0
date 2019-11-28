Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaFhX-0008QS-Ao
 for ath11k@lists.infradead.org; Thu, 28 Nov 2019 09:03:04 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: nFrom 964f1808c8512d0e99baf48cfa45cf5ee6b41952 Mon Sep 17
 00:00:00 2001
References: <0101016eb11a0ada-a650c6a4-f82e-4298-8a5f-a5d16ffa9c4a-000000@us-west-2.amazonses.com>
Date: Thu, 28 Nov 2019 09:03:01 +0000
In-Reply-To: <0101016eb11a0ada-a650c6a4-f82e-4298-8a5f-a5d16ffa9c4a-000000@us-west-2.amazonses.com>
 (Kalle Valo's message of "Thu, 28 Nov 2019 08:21:44 +0000")
Message-ID: <0101016eb13fd76a-52b45acd-3f4b-472a-b254-61731e674d42-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
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

Kalle Valo <kvalo@codeaurora.org> writes:

> Here's fourth, and last, round of ath11k patches from
> ath11k-post-bringup branch[1] which got queued while ath11k was in
> review.
>
> This time there are various fixes.
>
> Please review.
>
> Kalle
>
>
> John Crispin (1):
>   ath11k: fix indentation in ath11k_mac_prepare_he_mode()
>
> Manikanta Pubbisetty (1):
>   ath11k: fix vht guard interval mapping
>
> Miles Hu (1):
>   ath11k: fix memory leak in monitor mode
>
> Sriram R (1):
>   ath11k: Update tx and rx chain count properly on drv_set_antenna
>
> Vasanthakumar Thiagarajan (2):
>   ath11k: Move mac80211 hw allocation before wmi_init command
>   ath11k: Setup REO destination ring before sending wmi_init command
>
> Venkateswara Naralasetty (3):
>   ath11k: Advertise MPDU start spacing as no restriction
>   ath11k: update tx duration in station info
>   ath11k: Skip update peer stats for management packets

Oops, I had accidentaly added character 'n' to the beginning of the
cover letter and that's why the odd subject. It was supposed to be
'[PATCH 0/9] ath11k: fourth round of post-bringup patches'.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
