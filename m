Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iabgN-0005TS-DE
 for ath11k@lists.infradead.org; Fri, 29 Nov 2019 08:31:21 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V2 1/3] ath11k: rename ath11k_wmi_base instances from
 wmi_sc to wmi_ab
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191120192854.29582-1-john@phrozen.org>
References: <20191120192854.29582-1-john@phrozen.org>
Message-ID: <0101016eb6492523-b804d6f1-e8df-4d5c-b55e-273f6bfb241c-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2019 08:31:17 +0000
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
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> This makes the code consistent with the recent sc to ab rename.
> 
> Signed-off-by: John Crispin <john@phrozen.org>

Failed to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/wmi.c:2479
error: drivers/net/wireless/ath/ath11k/wmi.c: patch does not apply
stg import: Diff does not apply cleanly

3 patches set to Changes Requested.

11254749 [V2,1/3] ath11k: rename ath11k_wmi_base instances from wmi_sc to wmi_ab
11254745 [V2,2/3] ath11k: add WMI calls to manually add/del/pause/resume TWT dialogs
11254743 [V2,3/3] ath11k: add debugfs for TWT debug calls

-- 
https://patchwork.kernel.org/patch/11254749/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
