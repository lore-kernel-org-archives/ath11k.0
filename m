Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1aNZ-0007Bh-HD
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 18:35:29 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fixing dangling pointer issue upon peer delete
 failure
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1580891515-15054-1-git-send-email-vnaralas@codeaurora.org>
References: <1580891515-15054-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20200211183524.0F502C433A2@smtp.codeaurora.org>
Date: Tue, 11 Feb 2020 18:35:24 +0000 (UTC)
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
To: Venkateswara Rao Naralasetty <vnaralas@codeaurora.org>
Cc: Vikas Patel <vikpatel@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Venkateswara Rao Naralasetty <vnaralas@codeaurora.org> wrote:

> When there is WMI command failure, 'peer->sta' was not getting
> cleaned up, and mac80211 frees the 'sta' memory, which is causing
> the below page fault.
> 
> Cleaning up the sta pointer in ath11k whenever peer delete command
> is sent.
> 
> Unable to handle kernel paging request at virtual address 200080000006a
> pgd = ffffffc02a774000
> [200080000006a] *pgd=0000000000000000, *pud=0000000000000000
> Internal error: Oops: 96000004 [#1] PREEMPT SMP
> .
> .
> .
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W       4.4.60 #1
> Hardware name: Qualcomm Technologies, Inc. IPQ807x/AP-HK01-C1 (DT)
> task: ffffffc00083c6d0 ti: ffffffc00083c6d0 task.ti: ffffffc00083c6d0
> PC is at ath11k_dp_rx_process_mon_status+0x114/0x4e0 [ath11k]
> LR is at ath11k_dp_rx_process_mon_status+0xe8/0x4e0 [ath11k]
> pc : [<ffffffbffcf8e544>] lr : [<ffffffbffcf8e518>] pstate: 60000145
> sp : ffffffc000833a30
> 
> Signed-off-by: Vikas Patel <vikpatel@codeaurora.org>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

58595c9874c6 ath11k: Fixing dangling pointer issue upon peer delete failure

-- 
https://patchwork.kernel.org/patch/11365881/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
