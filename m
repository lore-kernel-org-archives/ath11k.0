Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kabs2-0005u3-0L
 for ath11k@lists.infradead.org; Thu, 05 Nov 2020 09:47:55 +0000
Received: by mail-ed1-x52e.google.com with SMTP id v4so859430edi.0
 for <ath11k@lists.infradead.org>; Thu, 05 Nov 2020 01:47:52 -0800 (PST)
Subject: Re: Regression: QCA6390 fails with "mm/page_alloc: place pages to
 tail in __free_pages_core()"
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
 <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
 <87ft5rszcs.fsf@codeaurora.org> <87ft5qsem9.fsf@codeaurora.org>
 <f99862f4-9b3a-03e5-cd26-1de6136f9e46@gmail.com>
 <87blgdscxd.fsf@codeaurora.org>
 <229c31e7-9aff-18e6-a6db-be7b46331173@gmail.com>
 <87361onphy.fsf_-_@codeaurora.org>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Message-ID: <b9312d0b-1219-edda-0333-debb8e7b32e7@gmail.com>
Date: Thu, 5 Nov 2020 10:47:49 +0100
MIME-Version: 1.0
In-Reply-To: <87361onphy.fsf_-_@codeaurora.org>
Content-Language: en-US
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>, david@redhat.com
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, linux-kernel@vger.kernel.org

Op 05.11.2020 om 10:04 schreef Kalle Valo:
> Oh, very interesting. Thanks a lot for the bisection, otherwise we would
> have never found out whats causing this.
> 
> David & mm folks: Pavel noticed that his QCA6390 Wi-Fi 6 device (driver
> ath11k) failed on v5.10-rc1. After bisecting he found that the commit
> below causes the regression. I have not been able to reproduce this and
> for me QCA6390 works fine. I don't know if this needs a specific kernel
> configuration or what's the difference between our setups.
> 
> Any ideas what might cause this and how to fix it?
> 
> Full discussion: http://lists.infradead.org/pipermail/ath11k/2020-November/000501.html
> 
> commit 7fef431be9c9ac255838a9578331567b9dba4477
> Author:     David Hildenbrand <david@redhat.com>
> AuthorDate: Thu Oct 15 20:09:35 2020 -0700
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Fri Oct 16 11:11:18 2020 -0700
> 
>      mm/page_alloc: place pages to tail in __free_pages_core()

This is my kernel config, for the reference: https://gist.github.com/twistedfall/455885024c56587fc5a0f4b2784612e8

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
