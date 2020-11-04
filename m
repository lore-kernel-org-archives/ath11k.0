Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaR4d-0006Rp-RP
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 22:16:14 +0000
Received: by mail-ed1-x530.google.com with SMTP id v4so24171720edi.0
 for <ath11k@lists.infradead.org>; Wed, 04 Nov 2020 14:16:11 -0800 (PST)
Subject: Re: PROBLEM: unable to get QCA6390 to work
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
 <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
 <87ft5rszcs.fsf@codeaurora.org> <87ft5qsem9.fsf@codeaurora.org>
 <f99862f4-9b3a-03e5-cd26-1de6136f9e46@gmail.com>
 <87blgdscxd.fsf@codeaurora.org>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Message-ID: <229c31e7-9aff-18e6-a6db-be7b46331173@gmail.com>
Date: Wed, 4 Nov 2020 23:15:05 +0100
MIME-Version: 1.0
In-Reply-To: <87blgdscxd.fsf@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

Op 04.11.2020 om 10:12 schreef Kalle Valo:
> Yeah, it is unfortunately time consuming but it is the best way to get
> bottom of this.

I have found the commit that breaks things for me, it's
7fef431be9c9ac255838a9578331567b9dba4477 mm/page_alloc: place pages to tail in __free_pages_core()

I've reverted it on top of the 5.10-rc2 and ath11k driver loads fine and I have wifi working.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
