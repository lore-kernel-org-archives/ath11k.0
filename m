Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaLlW-0004hl-St
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 16:36:14 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: QCA6390 failure on unsuspend
References: <CAKuwtP2UbFTxj7bqXFNckJrYaocp=83Uctmxvwme9CcvcU6fkg@mail.gmail.com>
Date: Wed, 04 Nov 2020 18:35:36 +0200
Message-ID: <87ft5pqduv.fsf@codeaurora.org>
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
Cc: ath11k@lists.infradead.org

Kenny Johansson <wirehell@gmail.com> writes:

> I've tried out the QCA6390 support as described in
> https://lore.kernel.org/linux-wireless/87r1r4nukq.fsf@codeaurora.org/#t
>
> I was able to get connectivity and experienced no issues while using
> it for a couple of hours
> , but after a suspend it stopped working.

Can you try this patch:

https://patchwork.kernel.org/project/linux-wireless/patch/20201030095832.7447-1-cjhuang@codeaurora.org/

And please let me know if it helped or not.

But while writing this I noticed it doesn't apply to v5.10-rc1 directly,
but the conflict seems to be quite simple to solve. I have asked Carl to
rebase the patch.

Also updated the instructions how to test latest ath11k:

http://lists.infradead.org/pipermail/ath11k/2020-November/000537.html

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
