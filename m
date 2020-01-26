Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivfW7-0003SH-1H
 for ath11k@lists.infradead.org; Sun, 26 Jan 2020 10:51:50 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: fix up some error paths
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200115174652.dvkmznhfvjaoc47l@kili.mountain>
References: <20200115174652.dvkmznhfvjaoc47l@kili.mountain>
Message-Id: <20200126105142.07E49C43383@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 10:51:41 +0000 (UTC)
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
Cc: Bhagavathi Perumal S <bperumal@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There are two error paths where "ret" wasn't set.  Also one error path
> we set the error code to -EINVAL but we should just preserve the error
> code from ath11k_hal_srng_get_entrysize().  That function only returns
> -EINVAL so this doesn't change anything.
> 
> I removed the "ret = 0;" initializers so that hopefully GCC will be able
> to detect these sorts of bugs in the future.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7195c8747e87 ath11k: fix up some error paths

-- 
https://patchwork.kernel.org/patch/11335489/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
