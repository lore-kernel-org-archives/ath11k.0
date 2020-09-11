Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfp1-0000EZ-CF
 for ath11k@lists.infradead.org; Fri, 11 Sep 2020 09:58:24 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix link error when CONFIG_REMOTEPROC is disabled
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101017476e38f40-c4168ac4-c00a-4220-a032-fe17e4a157cb-000000@us-west-2.amazonses.com>
References: <0101017476e38f40-c4168ac4-c00a-4220-a032-fe17e4a157cb-000000@us-west-2.amazonses.com>
Message-ID: <010101747c9a0228-5898723d-b777-4998-ac2e-1983151f4927-000000@us-west-2.amazonses.com>
Date: Fri, 11 Sep 2020 09:58:22 +0000
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

> If CONFIG_REMOTEPROC was disabled the linking failed with:
> 
> ERROR: modpost: "rproc_get_by_phandle" [drivers/net/wireless/ath/ath11k/ath11k.ko] undefined!
> 
> Compile tested only.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: 1ff8ed786d5d ("ath11k: use remoteproc only with AHB devices")
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5c0ec012ca7f ath11k: fix link error when CONFIG_REMOTEPROC is disabled

-- 
https://patchwork.kernel.org/patch/11766849/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
