Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihk7m-0000p7-B1
 for ath11k@lists.infradead.org; Thu, 19 Dec 2019 00:57:07 +0000
Received: by mail-pf1-x444.google.com with SMTP id x184so2189422pfb.3
 for <ath11k@lists.infradead.org>; Wed, 18 Dec 2019 16:57:01 -0800 (PST)
Date: Wed, 18 Dec 2019 16:56:59 -0800
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ath11k: Use sizeof_field() instead of FIELD_SIZEOF()
Message-ID: <201912181656.01259B85@keescook>
References: <201912180919.2A471217@keescook>
 <87d0cl8q46.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d0cl8q46.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, ath11k@lists.infradead.org

On Wed, Dec 18, 2019 at 08:07:05PM +0200, Kalle Valo wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > The FIELD_SIZEOF() macro was redundant, and is being removed from the
> > kernel. Since commit c593642c8be0 ("treewide: Use sizeof_field() macro")
> > this is one of the last users of the old macro, so replace it.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Please also Cc linux-wireless so that the patchwork sees this.

Ah, okay. It wasn't listed in MAINTAINERS, so I didn't remember. Sorry;
I'll resend.

-- 
Kees Cook

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
