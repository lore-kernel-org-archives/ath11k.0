Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iabfo-0005Fp-El
 for ath11k@lists.infradead.org; Fri, 29 Nov 2019 08:30:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: add wmi helper for turning STA PS on/off
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191118110815.23768-1-john@phrozen.org>
References: <20191118110815.23768-1-john@phrozen.org>
Message-ID: <0101016eb6489ad3-6f1c3be9-26bc-48f1-84de-108d9154d18d-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2019 08:30:41 +0000
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

> Add a WMI call helper to set the powersave mode of a STA interface.
> 
> Signed-off-by: John Crispin <john@phrozen.org>

Failed to apply, please resend.

error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:4074
error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
stg import: Diff does not apply cleanly

2 patches set to Changes Requested.

11249515 [1/2] ath11k: add wmi helper for turning STA PS on/off
11249513 [2/2] ath11k: disable PS for STA interfaces by default upon bringup

-- 
https://patchwork.kernel.org/patch/11249515/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
