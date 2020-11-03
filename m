Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka3R8-0001gi-IX
 for ath11k@lists.infradead.org; Tue, 03 Nov 2020 21:01:52 +0000
Received: by mail-ed1-x533.google.com with SMTP id a71so14599403edf.9
 for <ath11k@lists.infradead.org>; Tue, 03 Nov 2020 13:01:49 -0800 (PST)
Subject: Re: PROBLEM: unable to get QCA6390 to work
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
 <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
 <87ft5rszcs.fsf@codeaurora.org> <87ft5qsem9.fsf@codeaurora.org>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Message-ID: <f99862f4-9b3a-03e5-cd26-1de6136f9e46@gmail.com>
Date: Tue, 3 Nov 2020 22:01:46 +0100
MIME-Version: 1.0
In-Reply-To: <87ft5qsem9.fsf@codeaurora.org>
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

Thanks! fd5ad4d1e980 works fine and 3650b228f83a is broken. I'm doing the bisecting, but it looks like it will take some 
time.

Op 03.11.2020 om 15:23 schreef Kalle Valo:
> For me v5.10-rc2 (no extra patches) was working fine. A bisection would
> be a good next step. What I suggest that is that you first test these
> three commits from Linus' tree in this order:
> 
> fd5ad4d1e980 wcn36xx: Advertise beacon filtering support in bmps
> 3650b228f83a Linux 5.10-rc1
> 3cea11cd5e3b Linux 5.10-rc2
> 
> Commit fd5ad4d1e980 is based on v5.9-rc6 so try that first. In these
> three commits ath11k is practically identical, the only change is a
> small bugfix in commit 8431350eee2e ("ath11k: Fix memory leak on error
> path").

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
