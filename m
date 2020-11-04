Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaErJ-0006cg-7z
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 09:13:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: PROBLEM: unable to get QCA6390 to work
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
 <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
 <87ft5rszcs.fsf@codeaurora.org> <87ft5qsem9.fsf@codeaurora.org>
 <f99862f4-9b3a-03e5-cd26-1de6136f9e46@gmail.com>
Date: Wed, 04 Nov 2020 11:12:46 +0200
In-Reply-To: <f99862f4-9b3a-03e5-cd26-1de6136f9e46@gmail.com> (Pavel
 Procopiuc's message of "Tue, 3 Nov 2020 22:01:46 +0100")
Message-ID: <87blgdscxd.fsf@codeaurora.org>
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
To: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Cc: ath11k@lists.infradead.org

(fixing top posting)

Pavel Procopiuc <pavel.procopiuc@gmail.com> writes:

> Op 03.11.2020 om 15:23 schreef Kalle Valo:
>> For me v5.10-rc2 (no extra patches) was working fine. A bisection would
>> be a good next step. What I suggest that is that you first test these
>> three commits from Linus' tree in this order:
>>
>> fd5ad4d1e980 wcn36xx: Advertise beacon filtering support in bmps
>> 3650b228f83a Linux 5.10-rc1
>> 3cea11cd5e3b Linux 5.10-rc2
>>
>> Commit fd5ad4d1e980 is based on v5.9-rc6 so try that first. In these
>> three commits ath11k is practically identical, the only change is a
>> small bugfix in commit 8431350eee2e ("ath11k: Fix memory leak on error
>> path").
>
> Thanks! fd5ad4d1e980 works fine and 3650b228f83a is broken. 

Oh, this is a weird problem. So by the looks of this something outside
of ath11k breaks your setup, but I have no clue what. Or I'm missing
something very obvious.

> I'm doing the bisecting, but it looks like it will take some time.

Yeah, it is unfortunately time consuming but it is the best way to get
bottom of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
