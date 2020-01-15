Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irepX-000316-2E
 for ath11k@lists.infradead.org; Wed, 15 Jan 2020 09:19:19 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix up some error paths
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191213105448.b7lic5ddih6c3sqy@kili.mountain>
References: <20191213105448.b7lic5ddih6c3sqy@kili.mountain>
Message-Id: <20200115091903.59FC7C433A2@smtp.codeaurora.org>
Date: Wed, 15 Jan 2020 09:19:03 +0000 (UTC)
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bhagavathi Perumal S <bperumal@codeaurora.org>, kernel-janitors@vger.kernel.org, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, linux-wireless@vger.kernel.org, John Crispin <john@phrozen.org>, ath11k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There are two error paths where "ret" wasn't set.  Ideally the compiler
> would have warned about these bugs, but we initialized "ret" to zero so
> it silenced the warning.  I have removed that.  Also if
> ath11k_hal_srng_get_entrysize() fails then we need to free some
> resources before returning.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Failed to apply:

error: patch failed: drivers/net/wireless/ath/ath11k/dp_tx.c:646
error: drivers/net/wireless/ath/ath11k/dp_tx.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11290443/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
