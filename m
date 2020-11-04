Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaF9O-0001X8-0n
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 09:32:18 +0000
Received: by mail-ej1-x631.google.com with SMTP id p5so28810882ejj.2
 for <ath11k@lists.infradead.org>; Wed, 04 Nov 2020 01:32:17 -0800 (PST)
Subject: Re: PROBLEM: unable to get QCA6390 to work
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
 <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
 <87ft5rszcs.fsf@codeaurora.org>
 <c25b5029-4f21-c621-1416-3646d90b6a7f@gmail.com>
Message-ID: <b1ae1ff4-b768-2db5-a35a-48b9c8f0c55b@gmail.com>
Date: Wed, 4 Nov 2020 10:32:14 +0100
MIME-Version: 1.0
In-Reply-To: <c25b5029-4f21-c621-1416-3646d90b6a7f@gmail.com>
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

Op 03.11.2020 om 14:12 schreef Pavel Procopiuc:
> I have another probably interesting finding. I was trying to create a QCA6390-enabled kernel with the latest stable 
> version 5.9.3. But I only succeeded in making 5.9.1 work, in 5.9.2 loading the driver resulted in a quite weird behavior:
 > ...
> That's it, it didn't go any further, no wifi device appeared. But the patch for 5.9.2 is quite big and there is a number 
> of non-obvious conflicts so that might be just me resolving them incorrectly.

I have found the workaround for that problem. When this happens (no log output after "ath11k_pci 0000:05:00.0: enabling 
device (0000 -> 0002)") it's enough to just reboot into Windows 10 (that has working driver for the wifi card) and just 
reboot back into Linux. Loading the driver and firmware goes ok afterwards.

Just rebooting into Linux without going through Windows doesn't work. Full shutdown and start also doesn't help. So some 
hardware initialization going wrong I assume.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
