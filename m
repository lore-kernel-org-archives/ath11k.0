Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLUUD-0005dc-7D
 for ath11k@lists.infradead.org; Mon, 06 Apr 2020 16:20:34 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Increase the tx completion ring size
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1585567006-9173-1-git-send-email-srirrama@codeaurora.org>
References: <1585567006-9173-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20200406162031.1A479C433F2@smtp.codeaurora.org>
Date: Mon,  6 Apr 2020 16:20:31 +0000 (UTC)
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
To: Sriram R <srirrama@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> Increase the tx completion ring size to 0x8000.Also set the
> idr size to be same as the completion ring size.
> 
> This avoids backpressure on the TX Completion and
> corresponding TCL Data ring during high data traffic.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

bdef56a36eea ath11k: Increase the tx completion ring size

-- 
https://patchwork.kernel.org/patch/11465275/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
