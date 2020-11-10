Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcYOf-0002ig-V3
 for ath11k@lists.infradead.org; Tue, 10 Nov 2020 18:29:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix rmmod failure if qmi sequence fails
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1602929817-25920-1-git-send-email-akolli@codeaurora.org>
References: <1602929817-25920-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20201110182932.361D6C433FE@smtp.codeaurora.org>
Date: Tue, 10 Nov 2020 18:29:32 +0000 (UTC)
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

> QMI sequence fails if caldata file is not available.
> It is observed that 'rmmod ath11k' fails if qmi message fails.
> With this patch rmmod/insmod is working.
> 
> Logs:
> Direct firmware load for IPQ8074/caldata.bin failed with error -2
> Falling back to user helper
> qmi failed to load CAL: IPQ8074/caldata.bin
> qmi failed to load board data file:-11
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

Does not apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/qmi.c:2621
error: drivers/net/wireless/ath/ath11k/qmi.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1602929817-25920-1-git-send-email-akolli@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
