Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8mg-0004R6-00
 for ath11k@lists.infradead.org; Fri, 20 Nov 2020 15:57:17 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k-qca6390-bringup-202011191920: new suspend implementation
References: <87sg95t9ez.fsf@codeaurora.org> <87o8jtt98l.fsf@codeaurora.org>
 <ba11dcda-ed2c-6840-e42c-bb3fa4e59cec@gmail.com>
 <875z60tlh8.fsf@codeaurora.org>
 <d2cb032b-3dd8-6915-1b49-1c45e73f1ba7@gmail.com>
Date: Fri, 20 Nov 2020 17:56:28 +0200
In-Reply-To: <d2cb032b-3dd8-6915-1b49-1c45e73f1ba7@gmail.com> (Pavel
 Procopiuc's message of "Fri, 20 Nov 2020 11:24:41 +0100")
Message-ID: <874klkrphv.fsf@codeaurora.org>
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

Pavel Procopiuc <pavel.procopiuc@gmail.com> writes:

>>> ... suspend here ...
>>>
>>> Nov 19 22:49:30 razor kernel: mhi 0000:05:00.0: Allowing M3 transition
>>> Nov 19 22:49:30 razor kernel: mhi 0000:05:00.0: Wait for M3 completion
>>> Nov 19 22:49:30 razor kernel: mhi 0000:05:00.0: Entered with PM state:
>>> M3, MHI state: M3
>>> Nov 19 22:49:33 razor ModemManager[725]: <info>  Couldn't check
>>> support for device
>>> '/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0': not supported by
>>> any plugin
>>
>> And I guess resume also worked? :) Do you have logs about resume?
>
> Yes, resume was successful and I could use wireless network thereafter
> :)) The ath11k module didn't produce any additional log lines after
> resume, only those "kernel: mhi ..." lines were visible.
>
>> You had Dell XPS 17, right?
>
> Yes, I've got the XPS 17 model with the i9 processor (the i7 and lower
> are outfitted with the Killer AX1650 wireless card).

Thanks. I got a report that on XPS 15 this suspend implementation
doesn't work at all, haven't figured out yet why.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
