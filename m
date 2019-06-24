Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfMck-0008Vw-Ci
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 10:55:00 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix invalid memory access
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561056973-32524-1-git-send-email-periyasa@codeaurora.org>
References: <1561056973-32524-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190624105458.025FF609D4@smtp.codeaurora.org>
Date: Mon, 24 Jun 2019 10:54:58 +0000 (UTC)
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> dp_reo_cache_flush_elem element get dynamically allocated with invalid size
> which leads to the access of unallocated memory region or memory corruption.
> Fix this bug by allocate with dp_reo_cache_flush_elem structure size.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

11 patches applied to ath11k-bringup branch of ath.git, thanks.

f1df70c948f4 ath11k: fix invalid memory access
3213345e51fc ath11k: Remove unnecessary whitespaces
9d18a5b1d777 ath11k: Avoid blank lines related warning
e3b79f9ec2a4 ath11k: Avoid space related warning
dcc1fd37c6dd ath11k: Fix Alignment should match open parenthesis warning
d2b20789808d ath11k: Fix misspelled warnings
e4e738f422d4 ath11k: fix unnecessary brace warnings
61bfed886e93 ath11k: fix Block comments warnings
1e9c09edaba3 ath11k: fix SPDX comment style warnings
6a82b2e7f17e ath11k: fix return statements on void function warnings
ff1effad0d9b ath11k: fix string split across warnings

-- 
https://patchwork.kernel.org/patch/11007773/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
