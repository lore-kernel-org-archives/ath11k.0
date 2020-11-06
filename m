Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaurO-0000ZZ-56
 for ath11k@lists.infradead.org; Fri, 06 Nov 2020 06:04:31 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: QCA6390 failure on unsuspend
References: <CAKuwtP2UbFTxj7bqXFNckJrYaocp=83Uctmxvwme9CcvcU6fkg@mail.gmail.com>
 <87ft5pqduv.fsf@codeaurora.org>
 <CAKuwtP1SJ-XsMzFMij=KaWTS-E17075C77zOyOD+nqXaK9Y+ww@mail.gmail.com>
Date: Fri, 06 Nov 2020 08:04:24 +0200
In-Reply-To: <CAKuwtP1SJ-XsMzFMij=KaWTS-E17075C77zOyOD+nqXaK9Y+ww@mail.gmail.com>
 (Kenny Johansson's message of "Wed, 4 Nov 2020 20:35:04 +0100")
Message-ID: <87k0uzm36f.fsf@codeaurora.org>
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
To: Kenny Johansson <wirehell@gmail.com>
Cc: Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org

Kenny Johansson <wirehell@gmail.com> writes:

> I tried to apply the patch manually, but the function ath11k_config_ps
> seems to be missing from the patch.
> Google didn't find me any repos containing this, so assuming diff was
> against something unpublished.
> I'll wait for an updated patch.

Carl, can you rebase your suspend RFC patch to top of ath.git master
branch and resend?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
