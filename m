Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfnr-0008Vd-LC
 for ath11k@lists.infradead.org; Fri, 11 Sep 2020 09:57:12 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath11k: add raw mode and software crypto support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <010101746c6a52d9-18302a2c-0d6d-4057-aa4b-95960c809646-000000@us-west-2.amazonses.com>
References: <010101746c6a52d9-18302a2c-0d6d-4057-aa4b-95960c809646-000000@us-west-2.amazonses.com>
Message-ID: <010101747c98dff4-5878f89e-c338-4480-bb1a-4ba172c403bc-000000@us-west-2.amazonses.com>
Date: Fri, 11 Sep 2020 09:57:07 +0000
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> wrote:

> Adding raw mode tx/rx support. Also, adding support
> for software crypto which depends on raw mode.
> 
> To enable raw mode tx/rx:
> insmod ath11k.ko frame_mode=0
> 
> To enable software crypto:
> insmod ath11k.ko crypto_mode=1
> 
> These modes could be helpful in debugging crypto related issues.
> 
> Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

aa2092a9bab3 ath11k: add raw mode and software crypto support

-- 
https://patchwork.kernel.org/patch/11762567/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
