Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXgd-0001V7-SP
 for ath11k@lists.infradead.org; Tue, 08 Dec 2020 07:45:29 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] add ath11k MODULE_FIRMWARE macros
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201202182705.dhkml4nb4rf2vwav@orac>
References: <20201202182705.dhkml4nb4rf2vwav@orac>
Message-Id: <20201208074525.BF1BFC433CA@smtp.codeaurora.org>
Date: Tue,  8 Dec 2020 07:45:25 +0000 (UTC)
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

Patch applied to ath-next branch of ath.git, thanks.

3dbd7fe78c42 ath11k: pci: add MODULE_FIRMWARE macros

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201202182705.dhkml4nb4rf2vwav@orac/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
