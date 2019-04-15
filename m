Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG2Gv-0003VA-Ce
 for ath11k@lists.infradead.org; Mon, 15 Apr 2019 14:07:46 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: fix compiler warnings for unused variables
References: <20190410055840.5049-1-john@phrozen.org>
 <2594851.t0ysoKU8H1@bentobox>
Date: Mon, 15 Apr 2019 17:07:39 +0300
In-Reply-To: <2594851.t0ysoKU8H1@bentobox> (Sven Eckelmann's message of "Wed, 
 10 Apr 2019 10:04:32 +0200")
Message-ID: <871s23cqfo.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <seckelmann@datto.com>
Cc: Anilkumar Kolli <akolli@codeaurora.org>, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Sven Eckelmann <seckelmann@datto.com> writes:

> On Wednesday, 10 April 2019 07:58:40 CEST John Crispin wrote:
>>   CC [M]  drivers/net/wireless/ath/ath11k/core.o
>> drivers/net/wireless/ath/ath11k/core.c: In function 'ath11k_core_init':
>> drivers/net/wireless/ath/ath11k/core.c:609:10: warning: unused
>> variable 'rproc_phandle' [-Wunused-variable]
>> phandle rproc_phandle;
>> ^
>> drivers/net/wireless/ath/ath11k/core.c:608:16: warning: unused
>> variable 'prproc' [-Wunused-variable]
>> struct rproc *prproc;
>> ^
>> drivers/net/wireless/ath/ath11k/core.c:607:17: warning: unused
>> variable 'dev' [-Wunused-variable]
>> struct device *dev = sc->dev;
>> ^
>
> This patch doesn't apply because they just dropped the 
> CONFIG_IPQ_SUBSYSTEM_RESTART support (which is their only way to get the Q6 up 
> in their 4.4 Hawkeye kernel) using a off-the-list patch [1] submission.

BTW, now as the ath11k mailing list is up and running, I won't apply
patches directly to ath11k-bringup branch anymore. I only take them from
this list after review, I was thinking to wait minimum two days for
comments.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
