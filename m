Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKLZl-0004ap-H3
 for ath11k@lists.infradead.org; Mon, 21 Sep 2020 13:09:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Remove rproc references from common core layer
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1600090615-18904-1-git-send-email-govinds@codeaurora.org>
References: <1600090615-18904-1-git-send-email-govinds@codeaurora.org>
Message-Id: <20200921130946.06941C433CA@smtp.codeaurora.org>
Date: Mon, 21 Sep 2020 13:09:46 +0000 (UTC)
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> IPQ8074 HW uses rproc with AHB as underlying hif layer.
> Move rproc references from common core layer to target
> hif layer. Remove IS_ENABLED check for CONFIG_REMOTEPROC
> as it's not required anymore.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

I assume this was only compile tested so I added:

No functional changes. Compile tested only.

-- 
https://patchwork.kernel.org/patch/11773797/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
