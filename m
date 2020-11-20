Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg1am-0005Rs-MG
 for ath11k@lists.infradead.org; Fri, 20 Nov 2020 08:16:29 +0000
Received: by mail-ej1-x631.google.com with SMTP id 7so11684958ejm.0
 for <ath11k@lists.infradead.org>; Fri, 20 Nov 2020 00:16:27 -0800 (PST)
Subject: Re: ath11k-qca6390-bringup-202011191920: new suspend implementation
References: <87sg95t9ez.fsf@codeaurora.org> <87o8jtt98l.fsf@codeaurora.org>
 <ba11dcda-ed2c-6840-e42c-bb3fa4e59cec@gmail.com>
 <CAHUdJJXWSiWz7Te0hJ5uvzk1iAtSdo8QrjBWiTHw_gSt4R+ZSg@mail.gmail.com>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Message-ID: <01073455-065a-e45d-3186-6e4109794e3c@gmail.com>
Date: Fri, 20 Nov 2020 09:16:24 +0100
MIME-Version: 1.0
In-Reply-To: <CAHUdJJXWSiWz7Te0hJ5uvzk1iAtSdo8QrjBWiTHw_gSt4R+ZSg@mail.gmail.com>
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
To: wi nk <wink@technolu.st>
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

Op 19.11.2020 om 23:11 schreef wi nk:
> Hi Pavel,
> 
>    I'm compiling it now as well.  For your testing did you revert
> 7fef431be9c9ac255838a9578331567b9dba4477 again?  The memmap
> reservation never functioned for me.

No I did not, I'm using the vanilla 5.10-rc4 + the commits from ath11k-qca6390-bringup branch + Bluetooth LE fix [1] 
(not that it should matter in this case). The memmap=20M$12M option completely (at least for the last 10 or so boots) 
fixes the problem. I've tried reducing the non-allocatable window and this is the the minimum that works for me reliably 
so far.

[1]: https://patchwork.kernel.org/project/bluetooth/patch/20201022082304.31757-1-sathish.narasimman@intel.com/

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
