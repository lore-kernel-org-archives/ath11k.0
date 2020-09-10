Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGGvw-0002iG-Ht
 for ath11k@lists.infradead.org; Thu, 10 Sep 2020 07:23:53 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: Tree for Sep 9 (ath11k)
References: <20200909202624.2cc6c3d1@canb.auug.org.au>
 <3f8649d7-c64a-4b0a-a2db-69f1b11e31e5@infradead.org>
 <0101017476bd06e1-16ca4de8-647e-4423-9630-753fb5675e8b-000000@us-west-2.amazonses.com>
Date: Thu, 10 Sep 2020 07:23:48 +0000
In-Reply-To: <0101017476bd06e1-16ca4de8-647e-4423-9630-753fb5675e8b-000000@us-west-2.amazonses.com>
 (Kalle Valo's message of "Thu, 10 Sep 2020 06:38:53 +0000")
Message-ID: <0101017476e6257f-732e9a06-f420-47d0-b7db-36b2e3c2a266-000000@us-west-2.amazonses.com>
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
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Randy Dunlap <rdunlap@infradead.org> writes:
>
>> On 9/9/20 3:26 AM, Stephen Rothwell wrote:
>>> Hi all,
>>> 
>>> Changes since 20200908:
>>> 
>>
>> on x86_64:
>>
>> ld: drivers/net/wireless/ath/ath11k/core.o: in function `ath11k_core_init':
>> core.c:(.text+0x121f): undefined reference to `rproc_get_by_phandle'
>
> This is because CONFIG_REMOTEPROC is not, I'll fix the dependency in
> ath11k. Thanks for the report.

Patch sent:

ath11k: fix link error when CONFIG_REMOTEPROC is disabled

https://patchwork.kernel.org/patch/11766849/

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
