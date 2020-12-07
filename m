Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJHR-0001q5-Ip
 for ath11k@lists.infradead.org; Mon, 07 Dec 2020 16:22:32 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] add ath11k MODULE_FIRMWARE macros
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201202182705.dhkml4nb4rf2vwav@orac>
References: <20201202182705.dhkml4nb4rf2vwav@orac>
Message-Id: <20201207162224.CEC91C43461@smtp.codeaurora.org>
Date: Mon,  7 Dec 2020 16:22:24 +0000 (UTC)
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
To: Devin Bayer <dev@doubly.so>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Devin Bayer <dev@doubly.so> wrote:

> I am trying to get the ath11k driver to work with VyOS and during the
> build it tries to discover the firmware blobs which drivers require.
> 
> This doesn't work with ath11k because it doesn't use the MODULE_FIRMWARE
> macro. This patch fixes that.
> 
> Signed-off-by: Devin Bayer <dev@doubly.so>
> [kvalo@codeaurora.org: cleanup commit log, move to pci.c]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

I cleaned up the commit log and moved the macros to pci.c, please check my changes:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=9fc43fa2b621fa84a312d9eba538bf75c9049f3b

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201202182705.dhkml4nb4rf2vwav@orac/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
