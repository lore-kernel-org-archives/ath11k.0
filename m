Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kabCK-00070x-7q
 for ath11k@lists.infradead.org; Thu, 05 Nov 2020 09:04:49 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Regression: QCA6390 fails with "mm/page_alloc: place pages to tail in
 __free_pages_core()"
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
 <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
 <87ft5rszcs.fsf@codeaurora.org> <87ft5qsem9.fsf@codeaurora.org>
 <f99862f4-9b3a-03e5-cd26-1de6136f9e46@gmail.com>
 <87blgdscxd.fsf@codeaurora.org>
 <229c31e7-9aff-18e6-a6db-be7b46331173@gmail.com>
Date: Thu, 05 Nov 2020 11:04:41 +0200
In-Reply-To: <229c31e7-9aff-18e6-a6db-be7b46331173@gmail.com> (Pavel
 Procopiuc's message of "Wed, 4 Nov 2020 23:15:05 +0100")
Message-ID: <87361onphy.fsf_-_@codeaurora.org>
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
To: Pavel Procopiuc <pavel.procopiuc@gmail.com>, david@redhat.com
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, linux-kernel@vger.kernel.org

(changing the subject, adding more lists and people)

Pavel Procopiuc <pavel.procopiuc@gmail.com> writes:

> Op 04.11.2020 om 10:12 schreef Kalle Valo:
>> Yeah, it is unfortunately time consuming but it is the best way to get
>> bottom of this.
>
> I have found the commit that breaks things for me, it's
> 7fef431be9c9ac255838a9578331567b9dba4477 mm/page_alloc: place pages to
> tail in __free_pages_core()
>
> I've reverted it on top of the 5.10-rc2 and ath11k driver loads fine
> and I have wifi working.

Oh, very interesting. Thanks a lot for the bisection, otherwise we would
have never found out whats causing this.

David & mm folks: Pavel noticed that his QCA6390 Wi-Fi 6 device (driver
ath11k) failed on v5.10-rc1. After bisecting he found that the commit
below causes the regression. I have not been able to reproduce this and
for me QCA6390 works fine. I don't know if this needs a specific kernel
configuration or what's the difference between our setups.

Any ideas what might cause this and how to fix it?

Full discussion: http://lists.infradead.org/pipermail/ath11k/2020-November/000501.html

commit 7fef431be9c9ac255838a9578331567b9dba4477
Author:     David Hildenbrand <david@redhat.com>
AuthorDate: Thu Oct 15 20:09:35 2020 -0700
Commit:     Linus Torvalds <torvalds@linux-foundation.org>
CommitDate: Fri Oct 16 11:11:18 2020 -0700

    mm/page_alloc: place pages to tail in __free_pages_core()

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
