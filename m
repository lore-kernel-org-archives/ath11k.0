Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxBf8-0001qN-5O
 for ath11k@lists.infradead.org; Mon, 12 Aug 2019 14:51:07 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 01/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab
 in ahb.c
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1565269392-2838-2-git-send-email-mkenna@codeaurora.org>
References: <1565269392-2838-2-git-send-email-mkenna@codeaurora.org>
Message-Id: <20190812145105.444AF6090F@smtp.codeaurora.org>
Date: Mon, 12 Aug 2019 14:51:05 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath11k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> To avoid confusion and better readability, renamed the
> ath11k_base struct from 'sc' to 'ab'.
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

15 patches applied to ath11k-bringup branch of ath.git, thanks.

e9a9c7ce20c3 ath11k: Rename ath11k_base struct from 'sc' to 'ab in ahb.c
97b7d50e442e ath11k: Rename ath11k_base struct from 'sc' to 'ab in ce.c
921875d8447e ath11k: Rename ath11k_base struct from 'sc' to 'ab in ce.h
f89c8045c71e ath11k: Rename ath11k_base struct from 'sc' to 'ab in core.c
032c9ae20492 ath11k: Rename ath11k_base struct from 'sc' to 'ab in core.h
f3ce3b075ce9 ath11k: Rename ath11k_base struct from 'sc' to 'ab in debug.c
53ac892df561 ath11k: Rename ath11k_base struct from 'sc' to 'ab in debug.h
ff68b8aeec52 ath11k: Rename ath11k_base struct from 'sc' to 'ab in dp.c
ce0b4c3b9fed ath11k: Rename ath11k_base struct from 'sc' to 'ab in dp.h
ef79f7734a4b ath11k: Rename ath11k_base struct from 'sc' to 'ab in dp_rx.c
3b5143219077 ath11k: Rename ath11k_base struct from 'sc' to 'ab in hal.c
f657f4579186 ath11k: Rename ath11k_base struct from 'sc' to 'ab in hal.h
deeb215c52fa ath11k: Rename ath11k_base struct from 'sc' to 'ab in qmi.h
eef18cfbb399 ath11k: Rename ath11k_base struct from 'sc' to 'ab in wmi.c
4680dac93f46 ath11k: Rename ath11k_base struct from 'sc' to 'ab in wmi.h

-- 
https://patchwork.kernel.org/patch/11084107/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
