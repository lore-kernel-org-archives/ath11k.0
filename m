Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdj7-0007ga-1S
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 18:07:15 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: Use sizeof_field() instead of FIELD_SIZEOF()
References: <201912180919.2A471217@keescook>
Date: Wed, 18 Dec 2019 20:07:05 +0200
In-Reply-To: <201912180919.2A471217@keescook> (Kees Cook's message of "Wed, 18
 Dec 2019 09:19:35 -0800")
Message-ID: <87d0cl8q46.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, ath11k@lists.infradead.org

Kees Cook <keescook@chromium.org> writes:

> The FIELD_SIZEOF() macro was redundant, and is being removed from the
> kernel. Since commit c593642c8be0 ("treewide: Use sizeof_field() macro")
> this is one of the last users of the old macro, so replace it.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Please also Cc linux-wireless so that the patchwork sees this.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
