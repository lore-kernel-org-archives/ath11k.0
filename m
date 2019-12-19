Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihyVu-0003OE-EC
 for ath11k@lists.infradead.org; Thu, 19 Dec 2019 16:19:00 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Use sizeof_field() instead of FIELD_SIZEOF()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <201912181657.CE7D3CE33@keescook>
References: <201912181657.CE7D3CE33@keescook>
Message-Id: <20191219161857.473A0C447A2@smtp.codeaurora.org>
Date: Thu, 19 Dec 2019 16:18:57 +0000 (UTC)
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
To: Kees Cook <keescook@chromium.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org

Kees Cook <keescook@chromium.org> wrote:

> The FIELD_SIZEOF() macro was redundant, and is being removed from the
> kernel. Since commit c593642c8be0 ("treewide: Use sizeof_field() macro")
> this is one of the last users of the old macro, so replace it.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ca0e477931c5 ath11k: Use sizeof_field() instead of FIELD_SIZEOF()

-- 
https://patchwork.kernel.org/patch/11302533/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
