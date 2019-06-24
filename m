Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfMZi-0007Qc-Bl
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 10:51:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath11k: Avoid use of struct initializers for runtime
 assignment
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561162641-4676-1-git-send-email-srirrama@codeaurora.org>
References: <1561162641-4676-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20190624105150.18FE7607C3@smtp.codeaurora.org>
Date: Mon, 24 Jun 2019 10:51:50 +0000 (UTC)
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
Cc: ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> Cleanup the use of REG_RULE struct initializer macro for updating or
> addinig reg rules at runtime. Rather make use of a separate function
> to update reg rules while building new regd data.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath11k-bringup branch of ath.git, thanks.

596d308e33da ath11k: Avoid use of struct initializers for runtime assignment
a8bfc3648ccd ath11k: modify code styling for boolean function return values
61b7f587e157 ath11k: replace locally defined MACRO's with actual functions
051ebababfc1 ath11k: Remove stray character in reg notifier debug log

-- 
https://patchwork.kernel.org/patch/11011077/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
