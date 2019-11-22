Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY6Nk-00051v-Pz
 for ath11k@lists.infradead.org; Fri, 22 Nov 2019 10:41:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix vht guard interval mapping
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1573639984-31249-1-git-send-email-mpubbise@codeaurora.org>
References: <1573639984-31249-1-git-send-email-mpubbise@codeaurora.org>
Message-ID: <0101016e92b402fa-48d0200a-77bf-4eb7-a133-7182e8ac49d9-000000@us-west-2.amazonses.com>
Date: Fri, 22 Nov 2019 10:41:41 +0000
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: ath11k@lists.infradead.org

Manikanta Pubbisetty <mpubbise@codeaurora.org> wrote:

> Guard interval value which comes from VHT_SIG_A TLV has a mapping
> where value 0 corresponds to LGI, 1 and 3 corresponds to SGI.
> 
> Value 3 which is SGI(0.4us) in VHT was incorrectly mapped to a GI
> of 3.2us(only applicable in HE) resulting in incorrect rx GI stats.
> Fixing the mapping.
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

d5296ae6ba6f ath11k: fix vht guard interval mapping

-- 
https://patchwork.kernel.org/patch/11241633/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
