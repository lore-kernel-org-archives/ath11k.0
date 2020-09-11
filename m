Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfoe-0000EZ-TP
 for ath11k@lists.infradead.org; Fri, 11 Sep 2020 09:58:01 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: remove calling ath11k_init_hw_params() second time
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <010101746d2a40d3-25cd7dbe-c0dd-4fdf-8735-366d7fb40207-000000@us-west-2.amazonses.com>
References: <010101746d2a40d3-25cd7dbe-c0dd-4fdf-8735-366d7fb40207-000000@us-west-2.amazonses.com>
Message-ID: <010101747c99a1f7-01b03b4e-da1b-45fa-be10-8729ba088dbe-000000@us-west-2.amazonses.com>
Date: Fri, 11 Sep 2020 09:57:57 +0000
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> During probe ath11k_init_hw_params() is called from ath11k_core_pre_init()
> and is not needed agian in ath11k_core_init().
> 
> Tested on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 1ff8ed786d5d (ath11k: use remoteproc only with AHB devices)
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a9d9e03858ad ath11k: remove calling ath11k_init_hw_params() second time

-- 
https://patchwork.kernel.org/patch/11763091/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
