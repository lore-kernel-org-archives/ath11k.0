Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfMeI-0001ik-L1
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 10:56:38 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: clean up in qmi_txn_wait error code handling
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561115853-18202-1-git-send-email-gsamin@codeaurora.org>
References: <1561115853-18202-1-git-send-email-gsamin@codeaurora.org>
Message-Id: <20190624105634.60F0660741@smtp.codeaurora.org>
Date: Mon, 24 Jun 2019 10:56:34 +0000 (UTC)
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
To: Govindaraj Saminathan <gsamin@codeaurora.org>
Cc: ath11k@lists.infradead.org

Govindaraj Saminathan <gsamin@codeaurora.org> wrote:

> qmi_txn_wait functions resp.resp.result is assigned to ret
> variable and then returned from the function. The functions should
> not return error codes from firmware, instead it should return -EINVAL.
> 
> Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

d5fff50f82df ath11k: clean up in qmi_txn_wait error code handling

-- 
https://patchwork.kernel.org/patch/11009821/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
