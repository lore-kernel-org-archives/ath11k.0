Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFWRD-0007EJ-39
 for ath11k@lists.infradead.org; Tue, 08 Sep 2020 05:45:04 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix a double free and a memory leak
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200906212625.17059-1-trix@redhat.com>
References: <20200906212625.17059-1-trix@redhat.com>
Message-ID: <010101746c3ef419-e01fca01-760f-4d9f-901c-05657331a6fe-000000@us-west-2.amazonses.com>
Date: Tue, 8 Sep 2020 05:44:59 +0000
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
To: trix@redhat.com
Cc: mkenna@codeaurora.org, rmanohar@codeaurora.org, linux-wireless@vger.kernel.org, vnaralas@codeaurora.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, clang-built-linux@googlegroups.com, netdev@vger.kernel.org, john@phrozen.org, kuba@kernel.org, natechancellor@gmail.com, davem@davemloft.net

trix@redhat.com wrote:

> clang static analyzer reports this problem
> 
> mac.c:6204:2: warning: Attempt to free released memory
>         kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The channels pointer is allocated in ath11k_mac_setup_channels_rates()
> When it fails midway, it cleans up the memory it has already allocated.
> So the error handling needs to skip freeing the memory.
> 
> There is a second problem.
> ath11k_mac_setup_channels_rates(), allocates 3 channels. err_free
> misses releasing ar->mac.sbands[NL80211_BAND_6GHZ].channels
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Tom Rix <trix@redhat.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7e8453e35e40 ath11k: fix a double free and a memory leak

-- 
https://patchwork.kernel.org/patch/11759745/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
