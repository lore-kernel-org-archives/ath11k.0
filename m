Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcYPI-0002Zt-6Z
 for ath11k@lists.infradead.org; Tue, 10 Nov 2020 18:30:20 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix thermal temperature read
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201027204803.12464-1-pradeepc@codeaurora.org>
References: <20201027204803.12464-1-pradeepc@codeaurora.org>
Message-Id: <20201110183006.51069C433C9@smtp.codeaurora.org>
Date: Tue, 10 Nov 2020 18:30:06 +0000 (UTC)
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> Fix dangling pointer in thermal temperature event which causes
> incorrect temperature read.
> 
> Tested-on: IPQ8074 AHB WLAN.HK.2.4.0.1-00041-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

Does not apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/wmi.c:6410
error: drivers/net/wireless/ath/ath11k/wmi.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201027204803.12464-1-pradeepc@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
